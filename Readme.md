# CICD-infrastructure


install pipeline reqirments 
`$ ./install.sh`

<!--       _
       .__(.)< (MEOW)
        \___)   
 ~~~~~~~~~~~~~~~~~~-->

tasks list 
```yaml
tasks:
  Requirments:
    git_hub_repos:
      - name: infrastructure  
        descption: ArgoCD monters this repo for NS, tasks etc
      - name: Application_repos
        descption: Users code; go, node, etc
      - name: Deployment 
        descption: generated code that makes tasks for ArgoCD
      - name: ArgoCD 
        descption: tasks for ArgoCD 
        
    K8_install_list:
      - name: SonarQube
      - name: Buildah
      - name: Trivy
      - name: ArgoCD
      - name: Hashicop vault
      - name: Nexus 
      - name: MySQL

  K8_cluster:
    - name: ArgoCD
      namespace: ArgoCD_ns
      descption: config for hash corp ArgoCD 
      Argo_namespaces:
        - name: app_1_ns
          descption: app live here 
          steps: 
            - name: CICD-Pipeline
              descption: uses CICD-Pipeline to deploy app
        - name: app_2_ns
          descption: app live here 
          steps: 
            - name: CICD-Pipeline
              descption: uses CICD-Pipeline to deploy app
    - name: vault
      namespace: Vault_ns
      descption: namespace location of vault
    - name: nexus
      namespace: Nexus_ns
      descption: namespace location of Nexus_ns
      
  CICD-Pipeline: 
    tekton_tasks:
      - name: SonaerQube_scan
        descption: Scan code; vunablits, code smells, etc
        steps: 
          - name: store logs
      - name: Buildah_image_build
        descption: build image from code 
      - name: Trivy_image_scan
        descption: Scan image; vunablits
      - name: Nexus_push
        descption: Push Buildah image to nexus
      - name: Config_generate
        descption: Deployment config generate 
```
        

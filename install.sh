
# install tekton
kubectl apply -f install/task/tekton.yaml

# install nexus3
helm repo add stevehipwell https://stevehipwell.github.io/helm-charts/
helm upgrade --install --namespace default --values ./install/values/values-nexus3.yaml my-release stevehipwell/nexus3

# install sonarqube
helm repo add sonarqube https://SonarSource.github.io/helm-chart-sonarqube
helm upgrade --install --namespace default --values ./install/values/values-sonarqube.yaml sonarqube sonarqube/sonarqube

# install vault
helm repo add hashicorp https://helm.releases.hashicorp.com
helm install vault hashicorp/vault

# install argocd
helm repo add argo https://argoproj.github.io/argo-helm
helm install my-release argo/argocd-apps


# add wait here 
echo "sleep for 10 sec "
sleep 10

# add trivy-scanner
kubectl apply -f install/task/trivy-scanner.yaml

# install buildah
kubectl apply -f install/task/buildah.yaml



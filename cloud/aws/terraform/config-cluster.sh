## Terraform steps
#terraform init -input=false
#terraform plan -out=tfplan -input=false
#terraform apply -input=false tfplan

## Config kubectl
aws eks --region eu-west-1 update-kubeconfig --name realtime_eks

## Metrics server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.6/components.yaml

## Kubernetes dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

## Apply the service account and cluster role binding
kubectl apply -f ./kubernetes-dashboard-admin.rbac.yaml

## Create namespaces for services
kubectl create namespace accounts
kubectl create namespace cards
kubectl create namespace customers

## Get token
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')

## INFO
echo "Execute 'kubectl proxy' to expose"
echo "K8s Dashboard: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/overview?namespace=default"
echo ""
echo "Docker login to ECR"
echo "aws ecr --profile serverless get-login-password --region region | docker login --username AWS --password-stdin 297906742605.dkr.ecr.eu-west-2.amazonaws.com/technology-bank_eks-ecr"

## docker tag mocks-server:latest 297906742605.dkr.ecr.eu-west-2.amazonaws.com/technology-bank_eks-ecr/mocks-server:latest
## docker push 297906742605.dkr.ecr.eu-west-2.amazonaws.com/technology-bank_eks-ecr/mocks-server:latest

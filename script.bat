echo "Criando ass imagens......"

docker build -t efrainqueiroz/projeto-backend:1.0 backend/.
docker build -t efrainqueiroz/projeto-database:1.0 database/.

echo "Realizando push das imagens....."

docker push efrainqueiroz/projeto-backend:1.0
docker push efrainqueiroz/projeto-database:1.0

echo "Criando serviços do cluster Kubernetes......"

kubectl apply -f .\services.yml

echo "Criando os deployments"
kubectl apply -f .\deployment.yml


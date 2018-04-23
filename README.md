# google-cloud-kubernetes-manga

*******************
MANGA:
$HOME/MANGA/manganode
gcloud auth list
gcloud config list
gcloud info
gcloud projects list
*******************

#docker rm $(docker ps -a -q)
docker container prune

docker rmi manga

docker build -t manga .

docker run --name=manga -it -d -p 8080:8124 manga

----  GOOGLE -----
gcloud auth configure-docker
gcloud config set project manganode
docker build -t gcr.io/manganode/manganode:v1 .
docker run -d -p 8080:8124 gcr.io/manganode/manganode:v1
docker push gcr.io/manganode/manganode:v1

---- GOOGLE CLUSTER ----
gcloud container clusters get-credentials manganode-1 --zone us-central1-a --project manganode
kubectl run manganode --image gcr.io/manganode/manganode:v1 --port 8080
kubectl get pods
kubectl logs manganode-744476df96-852kx
kubectl cluster-info
kubectl get events
kubectl config view
kubectl expose deployment manganode --type="LoadBalancer"
#Changed to port 8080
kubectl set image deployment/manganode manganode=gcr.io/manganode/manganode:v2

gcloud components update
kubectl rollout status deployment manganode
gcloud compute --project "manganode" ssh --zone "us-central1-a" "gke-manganode-1-default-pool-8f8ffc56-1r3t"






$ gcloud auth configure-docker
The following settings will be added to your Docker config file
located at [/home/mdc/.docker/config.json]:
 {
  "credHelpers": {
    "gcr.io": "gcloud",
    "us.gcr.io": "gcloud",
    "eu.gcr.io": "gcloud",
    "asia.gcr.io": "gcloud",
    "staging-k8s.gcr.io": "gcloud"
  }
}

Do you want to continue (Y/n)?  Y

Docker configuration file updated.

docker push gcr.io/283306654203/manganode:v1


gcloud container clusters create democluster1 --zone=ap-south1-a --image-type=ubuntu --labels="env=k8s-cluster1" --machine-type=n1-standard-1 --num-nodes=3 --tags=k8s-demo1 --zone=asia-south1-a --enable-network-policy
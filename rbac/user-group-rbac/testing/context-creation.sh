#!/bin/bash
read -p "Enter your username : " username
read -p "Enter the group : " groupname
read -p "Enter the namespace : " namespace
read -p "Enter the ca-location : " CA_LOCATION
read -p "Enter the clustername : " clustername
echo $username
echo $groupname
echo $namespace
mkdir $username
#####
openssl genrsa -out employee.key 2048
openssl req -new -key employee.key -out employee.csr -subj "/CN=employee/O=bitnami"
openssl x509 -req -in employee.csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out employee.crt -days 500
kubectl config set-credentials employee --client-certificate=/home/employee/.certs/employee.crt  --client-key=/home/employee/.certs/employee.key
kubectl config set-context employee-context --cluster=minikube --namespace=office --user=employee
#####
openssl genrsa -out $username/"$username".key 2048
openssl req -new -key $username/"$username".key -out $username/"$username".csr -subj "/CN=$username/O=$group"
openssl x509 -req -in $username/"$username".csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out $username.crt -days 500
kubectl config set-credentials $username --client-certificate=/.certs/"$username".crt  --client-key=/.certs/"$username".key
kubectl config set-context "$username"-context --cluster=$clustername --namespace=$namespace --user=$username

#!/bin/bash
openssl genrsa -out employee.key 2048
openssl req -new -key employee.key -out employee.csr -subj "/CN=employee/O=bitnami"
openssl x509 -req -in employee.csr -CA CA_LOCATION/ca.crt -CAkey CA_LOCATION/ca.key -CAcreateserial -out employee.crt -days 500

##https://docs.bitnami.com/kubernetes/how-to/configure-rbac-in-your-kubernetes-cluster/
##https://medium.com/@lestrrat/configuring-rbac-for-your-kubernetes-service-accounts-c348b64eb242

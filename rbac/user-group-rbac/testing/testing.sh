#!/bin/bash
read -p "Enter your username : " username
read -p "Enter the group : " groupname
read -p "Enter the namespace : " namespace
echo $username
echo $groupname
echo $namespace
mkdir $username
openssl genrsa -out $username/"$username".key 2048


#!/bin/bash
#Repository-Name $1
#Region - $2
#Profile Name $3


aws ecr create-repository --repository-name ${1}/redtail/postgres --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt

aws ecr create-repository --repository-name ${1}/redtail/zookeeper --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt

aws ecr create-repository --repository-name ${1}/redtail/hawkconsolenode --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt
 
aws ecr create-repository --repository-name ${1}/redtail/grafana --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt

aws ecr create-repository --repository-name ${1}/redtail/webapp --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt

aws ecr create-repository --repository-name ${1}/redtail/prometheus_discoveryservice --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt

aws ecr create-repository --repository-name ${1}/redtail/querynode --image-scanning-configuration scanOnPush=true --region $2 --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt

aws ecr create-repository --repository-name ${1}/redtail/hkceagent    --image-scanning-configuration scanOnPush=true --region ${2} --profile ${3} --query "repository.repositoryUri" >> redtail-images-ecr-uri.txt


echo "#############################################"
echo "All AWS ECR Repository created .."
echo "Image URI can be found at $PWD/redtail-images-ecr-uri.txt"
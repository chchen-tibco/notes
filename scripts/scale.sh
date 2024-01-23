#!/bin/bash

export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
export AWS_PROFILE=/home/aws/.aws/config

CLUSTER_ALL=`eksctl --profile dp_role get cluster| grep dp | awk '{print $1}'`
#CLUSTER_ALL="dp-cluster-bwpunedemo dp-cluster-puneteam"

echo `date`  >> /home/aws/scripts/eks_worknode.out

for CLUSTER_NAME in $CLUSTER_ALL
do 
    echo "scaling node to 0 for $CLUSTER_NAME"
    eksctl --profile dp_role scale nodegroup --cluster=$CLUSTER_NAME --nodes=0 --name=ng-1 --nodes-min=0
    eksctl --profile dp_role get nodegroup --color true --cluster $CLUSTER_NAME -o yaml | egrep "Cluster|Time|Desired" >> /home/aws/scripts/eks_worknode.out
    echo "----------" >> /home/aws/scripts/eks_worknode.out

done

cat /home/aws/scripts/eks_worknode.out


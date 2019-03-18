#!/bin/bash
export CLUSTER_TEMPLATE_YAML=private-topology.tmpl.yaml
export CLUSTER_NAME=test.stackator.com
export KOPS_STATE_STORE_BUCKET=test-stackator-kops-state-store
export REGION=eu-west-1
export K8S_VERSION=1.11.7
export MASTER_PUBLIC_NAME=api.test.stackator.com
export MASTER_IMAGE_ID=ami-099b2d1bdd27b4649
export MASTER_SERVER_TYPE=t2.medium
export MASTER_MAX_SIZE=1
export MASTER_MIN_SIZE=1
export NODES_IMAGE_ID=ami-099b2d1bdd27b4649
export NODES_SERVER_TYPE=t2.large
export NODES_MAX_SIZE=3
export NODES_MIN_SIZE=3
export BASTION_IMAGE_ID=ami-099b2d1bdd27b4649
export BASTION_SERVER_TYPE=t2.nano
export BASTION_MAX_SIZE=1
export BASTION_MIN_SIZE=1
export CLUSTER_YAML=${CLUSTER_TEMPLATE_YAML%%.*}.yaml

set -ex

declare -A envMap

envMap=(["CLUSTER_NAME"]="${CLUSTER_NAME}"
  ["CLUSTER_TEMPLATE_YAML"]="${CLUSTER_TEMPLATE_YAML}" 
  ["KOPS_STATE_STORE_BUCKET"]="${KOPS_STATE_STORE_BUCKET}" 
  ["REGION"]="${REGION}" 
  ["K8S_VERSION"]="${K8S_VERSION}" 
  ["MASTER_PUBLIC_NAME"]="${MASTER_PUBLIC_NAME}" 
  ["MASTER_IMAGE_ID"]="${MASTER_IMAGE_ID}" 
  ["MASTER_SERVER_TYPE"]="${MASTER_SERVER_TYPE}" 
  ["MASTER_MAX_SIZE"]="${MASTER_MAX_SIZE}" 
  ["MASTER_MIN_SIZE"]="${MASTER_MIN_SIZE}" 
  ["NODES_IMAGE_ID"]="${NODES_IMAGE_ID}" 
  ["NODES_SERVER_TYPE"]="${NODES_SERVER_TYPE}" 
  ["NODES_MAX_SIZE"]="${NODES_MAX_SIZE}" 
  ["NODES_MIN_SIZE"]="${NODES_MIN_SIZE}" 
  ["BASTION_IMAGE_ID"]="${BASTION_IMAGE_ID}" 
  ["BASTION_SERVER_TYPE"]="${BASTION_SERVER_TYPE}" 
  ["BASTION_MIN_SIZE"]="${BASTION_MIN_SIZE}" 
  ["BASTION_MAX_SIZE"]="${BASTION_MAX_SIZE}" 
)

for v in "${!envMap[@]}";do
  if  [[ -z ${envMap[${v}]} ]]
  then
    echo -e "ERROR\tThe variable \"${v}\" is NOT set"
    exit 1
  fi
done

envsubst < ${CLUSTER_TEMPLATE_YAML} > ${CLUSTER_YAML}

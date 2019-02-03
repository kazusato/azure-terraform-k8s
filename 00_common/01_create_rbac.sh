#!/usr/bin/env bash

TARGET_LOCATION=japaneast

ACCOUNT_JSON=$(az account show --query "{subscriptionId:id, tenantId:tenantId}")
echo ${ACCOUNT_JSON}

export SUB_ID=$(echo ${ACCOUNT_JSON} | jq .subscriptionId -r)
export TENANT_ID=$(echo ${ACCOUNT_JSON} | jq .tenantId -r)

RBAC_JSON=$(az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUB_ID}")
echo ${RBAC_JSON}

export APP_ID=$(echo ${RBAC_JSON} | jq .appId -r)
export SP_NAME=$(echo ${RBAC_JSON} | jq .name -r)
export PASSWORD=$(echo ${RBAC_JSON} | jq .password -r)

cat ZZ_azure_config.sh.template | envsubst | tee nogit/ZZ_azure_config.sh


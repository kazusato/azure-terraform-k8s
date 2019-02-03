#!/usr/bin/env bash

. 00_config.sh

rg_name=${RG_NAME}

vmlist=$(az vm list -g $rg_name --query '[].{name:name}' -o tsv)
for i in $vmlist
do
 echo "Restarting VM $i"
 az vm restart -g $rg_name -n $i --no-wait
done

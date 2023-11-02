#!/usr/bin/env zsh

for d in $(kubectl get deployment -o jsonpath='{.items[].metadata.name}'); do kubectl delete deployment $d; done

for s in $(kubectl get service -o jsonpath='{.items[].metadata.name}' | grep -v service/kubernetes); do kubectl delete service $s; done



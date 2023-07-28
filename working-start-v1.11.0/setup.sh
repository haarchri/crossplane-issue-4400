#!/usr/bin/env bash

kind create cluster --name=release-1-13
kubectx kind-release-1-13
kubectl create ns crossplane-system
echo "#### install 1.11.0"
helm install crossplane --namespace crossplane-system crossplane-stable/crossplane --version 1.11.0 --wait 

helm list -A
kubectl get crd compositionrevisions.apiextensions.crossplane.io -o json | jq '.status.storedVersions'

kubectl get pods -n crossplane-system

kubectl apply -f ../manifests-version-01/
sleep 10

kubectl apply -f ../manifests-version-02/
sleep 10

kubectl apply -f ../manifests-version-03/
sleep 10

kubectl get compositionrevision


echo "#### upgrade 1.12.0"
helm upgrade crossplane --namespace crossplane-system crossplane-stable/crossplane --version 1.12.0 --wait
kubectl get crd compositionrevisions.apiextensions.crossplane.io -o json | jq '.status.storedVersions'
kubectl get compositionrevision
kubectl get pods -n crossplane-system

echo "#### upgrade 1.13.0"
helm upgrade crossplane --namespace crossplane-system crossplane-stable/crossplane --version 1.13.0
kubectl get crd compositionrevisions.apiextensions.crossplane.io -o json | jq '.status.storedVersions'
kubectl get compositionrevision
kubectl get pods -n crossplane-system

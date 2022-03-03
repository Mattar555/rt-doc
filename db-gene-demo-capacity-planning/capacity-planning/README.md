DB-Gene helm chart deployment

# Overview
DB-Gene applications can be deployed on Kubernetes and Openshift using Helm charts generated in deployment/helm.
A typical application uses 5 charts :

- dbos-volumes : persistent volumes
- dbos-secrets : all application secrets (database credentials, docker puller configurations)
- dbos-infra : all infrastructure services (databases, messaging, authentication)
- dbos : DBOS components (without workers)
- \<your-application-name> : Gene services (backend, data, execution, gateway, scenario, web and workers) 

Charts are independent, there is no sub-charts or dependencies.

- High level charts declare volume and secrets names, defined in dbos-volumes and dbos-secrets.
- High level charts declare hosts and URLs to access services in lower level charts.

This organization allow
- keep charts smaller and easier to maintain,
- can be splitted between different teams (IT team can define volumes and secrets, used by dev team without knowing the real credentials or volumes details)
- faster deployments, most of time you only want to upgrade you app chart.
- avoid painful mistakes like volumes uninstallation.


# Installation
A typical installation consist in :

- copy default value files in a dedicated installation folder
```
cp -a <chart_home>/values/configname <chart_home>/values/<my_configname>
cd <chart_home>/values/<my_configname>
mv values-configname-dbos-infra.yaml values-<my_configname>-dbos-infra.yaml 
mv values-configname-dbos-secrets.yaml values-<my_configname>-dbos-secrets.yaml 
mv values-configname-dbos-volumes.yaml values-<my_configname>-dbos-volumes.yaml 
mv values-configname-dbos.yaml values-<my_configname>-dbos.yaml 
mv values-configname.yaml values-<my_configname>.yaml

```
- update values files to suit your needs.
```
vi values-<my_configname>-dbos-infra.yaml 
vi values-<my_configname>-dbos-secrets.yaml 
vi values-<my_configname>-dbos-volumes.yaml 
vi values-<my_configname>-dbos.yaml 
vi values-<my_configname>.yaml
```
- deploy charts using corresponding values file.

## Configure values files

## Deployment

First add (once) DBOS repository to your Helm repositories 
```
helm repo add dbos https://nexus.decisionbrain.cloud/repository/dbos-helm/ --username <your_user_name> --password $(read -s;echo "$REPLY")
```

Then you can deploy DBOS charts
```
helm install secrets dbos/dbos-secrets --version 3.1.0 -f <chart_home>/values/<my_configname>/values-<my_configname>-dbos-secrets.yaml 
helm install volumes dbos/dbos-volumes --version 3.1.0 -f <chart_home>/values/<my_configname>/values-<my_configname>-dbos-volumes.yaml 
helm install infra dbos/dbos-infra --version 3.1.0 -f <chart_home>/values/<my_configname>/values-<my_configname>-dbos-infra.yaml 
helm install dbos dbos/dbos --version 3.1.0 -f <chart_home>/values/<my_configname>/values-<my_configname>-dbos.yaml 
```
and deploy your application chart from local folder
```
helm install <my_app> <chart_home> -f <chart_home>/values/<my_configname>/values-<my_configname>.yaml 
```

Upgrading application can be done using  
```
helm uninstall <my_app>
helm install <my_app> <chart_home> -f <chart_home>/values/<my_configname>/values-<my_configname>.yaml 
```
or
```
helm upgrade <my_app> <chart_home> -f <chart_home>/values/<my_configname>/values-<my_configname>.yaml 
```

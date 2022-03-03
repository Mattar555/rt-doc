# Rio Tinto APS 

## Installing DOC 4.x on OCP

Run this:

```bash
oc login <your-secret-cluster-stuff>
oc new-project $PROJECT_NAME
helm install demo-capacity-planning db-gene-demo-capacity-planning-1.0.8.tgz -f ./db-gene-demo-capacity-planning/values-demo-ocp.yaml
```

*Life is good!!*


## Notes from Michel

This helm chart can be used to deploy the capacity-planning demonstration (built with DOC 4.0) on a Kubernetes cluster.



It is meant to be customized to meet your specific deployment requirements and should be a very good starting base.



The chart contains a values.yaml file that should not be touched a-priori.

The values-demo.yaml should be used to override the default behavior of the deployment. 

Typically, you will need to change

- the target k8s -> okd

- the global.domain value that is used to compute the different routes



The secrets we provide should let you access our docker repository where the different docker images of the application can be found.



To use this template with helm, you should use something like:



  `$ helm install demo-capacity-planning ./db-gene-demo-capacity-planing-1.0.8.tgz -f ./db-gene-demo-capacity-planing/values-demo.yaml`
 
 
## To solve errors

In case if above command fails with imagestream error try below step:

Add imagestream: false in values-demo-ocp 



If you get an error pulling open shift secrets follow below link:

https://console.redhat.com/openshift/downloads to get OpenShift pull secrets



For other errors 


Cluster Settings->images ->cluster
Annotations:

include.release.openshift.io/ibm-cloud-managed: 'true'
    include.release.openshift.io/self-managed-high-availability: 'true'
    include.release.openshift.io/single-node-developer: 'true'

spec:
  registrySources:
    allowedRegistries:
      - dbgene-demos-registry.decisionbrain.cloud
      - quay.io
      - registry.redhat.io
      - 'image-registry.openshift-image-registry.svc:5000'
      - registry.hub.docker.com
      - docker.io

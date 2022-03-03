oc get DeploymentConfig web -n rt-doc -o json | jq '.spec.template.spec.containers[0].resources.limits.memory = "14Mi" ' | oc apply -f -
oc get DeploymentConfig dbos-console -n rt-doc -o json | jq '.spec.template.spec.containers[0].resources.limits.memory = "14Mi" ' | oc apply -f -

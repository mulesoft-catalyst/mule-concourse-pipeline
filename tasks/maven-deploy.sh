#!/usr/bin/env bash

set -e

source ./pipeline/tasks/common.sh

# Create Version
VERSION=$(get_build_version "./version" "number" "./source-code" $BRANCH)
echo "Version to build:"
echo " - ${VERSION}"

# Create Maven settings file
./pipeline/tasks/generate-settings.sh

cd ./source-code

# Maven version build
MAVEN_OPTS=""
MAVEN_GOALS="versions:set"
MAVEN_ARGS="-DnewVersion=${VERSION}"

echo "Starting ${MAVEN_GOALS} goal(s)"
echo " - Using MAVEN_OPTS: ${MAVEN_OPTS}"
echo " - Using MAVEN_GOALS: ${MAVEN_GOALS}"
echo " - Using MAVEN_ARGS: ${MAVEN_ARGS}" 
mvn ${MAVEN_OPTS} ${MAVEN_GOALS} ${MAVEN_ARGS}

# Maven build
MAVEN_OPTS=""
MAVEN_GOALS="deploy"
echo "Mule Environment Name: ${MULE_ENV_NAME}"
echo "Anypoint Platform URL: ${ANYPOINT_PLATFORM_URL}"
echo "Connected App Id: ${CONNECTED_APP_CLIENT_ID}"
echo "Connected App Secret: ****************"
echo "Connected App Grant Type: ${CONNECTED_APP_GRANT_TYPE}"
echo "Environment Name: ${ENVIRONMENT_NAME}"
echo "Runtime Fabric Instance Name: ${RTF_INSTANCE_NAME}"
echo "Application Domain Name: ${APPLICATION_DOMAIN_NAME}"
echo "Application CPU Reserved: ${APPLICATION_CPU_RESERVED}"
echo "Application CPU Max: ${APPLICATION_CPU_MAX}"
echo "Application Memory Reserved: ${APPLICATION_MEM_RESERVED}"
echo "Application Memory Max: ${APPLICATION_MEM_MAX}"
echo "Application Client Id: ${APPLICATION_CLIENT_ID}"
echo "Application Client Secret: ****************"
echo "Deployment Mule Runtime: ${DEPLOYMENT_MULE_RUNTIME}"
echo "Deployment Replicas: ${DEPLOYMENT_REPLICAS}"
echo "Deployment Replicas across Nodes: ${DEPLOYMENT_REPLICAS_ACROSS_NODES}"
echo "Deployment Update Strategy: ${DEPLOYMENT_UPDATE_STRATEGY}"
echo "Deployment Forward SSL: ${DEPLOYMENT_FORWARD_SSL}"
echo "Deployment Clustered: ${DEPLOYMENT_CLUSTERED}"
echo "Deployment Last Mile Security: ${DEPLOYMENT_LAST_MILE_SECURITY}"
MAVEN_ARGS="-DmuleDeploy \
-DskipTests \
-Dmule.env.name=${MULE_ENV_NAME} \
-Danypoint.platform.url=${ANYPOINT_PLATFORM_URL} \
-Dconnected.app.client.id=${CONNECTED_APP_CLIENT_ID} \
-Dconnected.app.client.secret=${CONNECTED_APP_CLIENT_SECRET} \
-Dconnected.app.grant.type=${CONNECTED_APP_GRANT_TYPE} \
-Denvironment.name=${ENVIRONMENT_NAME} \
-Drtf.instance.name=${RTF_INSTANCE_NAME} \
-Dapplication.domain.name=${APPLICATION_DOMAIN_NAME} \
-Dapplication.cpu.reserved=${APPLICATION_CPU_RESERVED} \
-Dapplication.cpu.max=${APPLICATION_CPU_MAX} \
-Dapplication.mem.reserved=${APPLICATION_MEM_RESERVED} \
-Dapplication.mem.max=${APPLICATION_MEM_MAX} \
-Dapplication.client.id=${APPLICATION_CLIENT_ID} \
-Dapplication.client.secret=${APPLICATION_CLIENT_SECRET} \
-Ddeployment.mule.runtime=${DEPLOYMENT_MULE_RUNTIME} \
-Ddeployment.replicas=${DEPLOYMENT_REPLICAS} \
-Ddeployment.replicas.across.nodes=${DEPLOYMENT_REPLICAS_ACROSS_NODES} \
-Ddeployment.update.strategy=${DEPLOYMENT_UPDATE_STRATEGY} \
-Ddeployment.forward.ssl=${DEPLOYMENT_FORWARD_SSL} \
-Ddeployment.clustered=${DEPLOYMENT_CLUSTERED} \
-Ddeployment.last.mile.security=${DEPLOYMENT_LAST_MILE_SECURITY}"

echo "Starting ${MAVEN_GOALS} goal(s)"
echo " - Using MAVEN_OPTS: ${MAVEN_OPTS}"
echo " - Using MAVEN_GOALS: ${MAVEN_GOALS}"
echo " - Using MAVEN_ARGS: ${MAVEN_ARGS}" 
mvn ${MAVEN_OPTS} ${MAVEN_GOALS} ${MAVEN_ARGS}
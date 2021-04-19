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
MAVEN_ARGS=" -DskipTests"

echo "Starting ${MAVEN_GOALS} goal(s)"
echo " - Using MAVEN_OPTS: ${MAVEN_OPTS}"
echo " - Using MAVEN_GOALS: ${MAVEN_GOALS}"
echo " - Using MAVEN_ARGS: ${MAVEN_ARGS}" 
mvn ${MAVEN_OPTS} ${MAVEN_GOALS} ${MAVEN_ARGS}
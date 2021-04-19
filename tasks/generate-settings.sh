#!/usr/bin/env bash

set -u

mkdir -p ${HOME}/.m2/

# Create Maven settings file
echo "Writing settings xml to [${HOME}/.m2/settings.xml]"
echo " - Mule EE Nexus Repository Username: ${M2_SETTINGS_MULE_EE_REPO_USERNAME}"
echo " - Anypoint Exchange Organization Id: ${M2_SETTINGS_EXCHANGE_REPO_ORG_ID}"
echo " - Anypoint Exchange Repository Username: ${M2_SETTINGS_EXCHANGE_REPO_USERNAME}"

set +x
cat > ${HOME}/.m2/settings.xml <<EOF

<?xml version="1.0" encoding="UTF-8"?>

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0" 
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
          xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0 http://maven.apache.org/xsd/settings-1.0.0.xsd">
  <pluginGroups>
    <pluginGroup>org.mule.tools</pluginGroup>
  </pluginGroups>

  <proxies></proxies>

  <servers>
    <server>
      <id>mule-ee-nexus-releases</id>
      <username>${M2_SETTINGS_MULE_EE_REPO_USERNAME}</username>
      <password>${M2_SETTINGS_MULE_EE_REPO_PASSWORD}</password>
    </server>
    <server>
      <id>Exchange</id>
      <username>${M2_SETTINGS_EXCHANGE_REPO_USERNAME}</username>
      <password>${M2_SETTINGS_EXCHANGE_REPO_PASSWORD}</password>
    </server>
  </servers>

  <mirrors></mirrors>

  <profiles>
    <profile>
      <id>Mule</id>
      <activation>
        <activeByDefault>true</activeByDefault>
      </activation>
      <repositories>
        <repository>
          <id>maven-central</id>
          <name>Maven Central</name>
          <url>https://repo1.maven.org/maven2/</url>
          <layout>default</layout>
        </repository>
        <repository>
          <id>mulesoft-releases</id>
          <name>MuleSoft Repository</name>
          <url>http://repository.mulesoft.org/releases/</url>
          <layout>default</layout>
        </repository>
        <repository>
          <id>mulesoft-snapshots</id>
          <name>MuleSoft Snapshots Repository</name>
          <url>http://repository.mulesoft.org/snapshots/</url>
          <layout>default</layout>
        </repository>
        <repository>
          <id>mulesoft-public</id>
          <name>MuleSoft Public Repository</name>
          <url>https://repository.mulesoft.org/nexus/content/repositories/public/</url>
          <layout>default</layout>
        </repository>
        <repository>
          <id>mule-ee-nexus-releases</id>
          <name>Mule EE Repository</name>
          <url>https://repository.mulesoft.org/nexus-ee/content/repositories/releases-ee/</url>
          <layout>default</layout>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
        <repository>
          <id>Exchange</id>
          <name>Anypoint Platform Exchange Repository</name>
          <url>https://maven.anypoint.mulesoft.com/api/v1/organizations/${M2_SETTINGS_EXCHANGE_REPO_ORG_ID}/maven</url>
          <layout>default</layout>
          <releases>
            <enabled>true</enabled>
          </releases>
          <snapshots>
            <enabled>true</enabled>
          </snapshots>
        </repository>
      </repositories>
      <pluginRepositories>
        <pluginRepository>
          <id>mulesoft-releases</id>
          <name>mulesoft release repository</name>
          <layout>default</layout>
          <url>http://repository.mulesoft.org/releases/</url>
          <snapshots>
            <enabled>false</enabled>
          </snapshots>
        </pluginRepository>
        <pluginRepository>
          <id>mule-public</id>
          <url>https://repository.mulesoft.org/nexus/content/repositories/releases</url>
        </pluginRepository>
      </pluginRepositories>
    </profile>
  </profiles>
</settings>

EOF
set -x
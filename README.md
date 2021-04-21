# mule-concourse-pipeline

## About
Generic [**Concourse**](https://concourse-ci.org/) pipeline resource for **Mule 4** applications. 

### Tasks
Different Maven based `Tasks` are included and can be used in different scenarios:

|No.|Task|Platform|Type|Source|Description
|---|---|---|---|---|---
|1|[Verify Task](./tasks/maven-verify.yml)|Linux|docker-image|Maven 3.6.3-openjdk-8|Sets the new build `version` and executes an application `verification` step
|2|[Publish Task](./tasks/maven-publish.yml)|Linux|docker-image|Maven 3.6.3-openjdk-8|Executes an application `publication` step
|3|[Deploy Task](./tasks/maven-deploy.yml)|Linux|docker-image|Maven 3.6.3-openjdk-8|Executes an application `deployment` step
|4|[Test and Package Task](./tasks/maven-test-and-package.yml)|Linux|docker-image|Maven 3.6.3-openjdk-8|Executes an application `test` step followed by a `package` step

### Supporting Scripts
Supporting Task `Scripts` are included, allowing the execution of the actual Maven goals (`build`, `test`, `package` and `deploy`):

|No.|Script|Description
|---|---|---
|1|[Semver Support](./tasks/common.sh)|Simple functions to support  Semver versioning
|2|[Generate Settings](./tasks/generate-settings.sh)|Generates the required Maven settings.xml file, containing references to the Mule EE Nexus and Exchange repositories
|3|[Verify Script](./tasks/maven-verify.sh)|Sets the new build version and executes the actual application verification step
|4|[Publish Script](./tasks/maven-publish.sh)|Executes the actual application publication step
|5|[Deploy Script](./tasks/maven-deploy.sh)|Executes the actual application deployment step
|6|[Test and Package Script](./tasks/maven-test-and-package.sh)|Executes the actual application test and package steps

## Example Pipelines
The generic tasks provided by this pipeline resource can be used as building blocks for (**complex**) pipelines.

Several examples have been created and used to test different pipeline scenarios. See [mule-concourse-pipeline-example](https://github.com/mulesoft-catalyst/mule-concourse-pipeline-example)). 



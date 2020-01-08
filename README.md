# AMI Bakery 

The bakery uses Hashicorp Packer to generate the encrypted AMIs. This repository uses AWS Systems Manager. It checks out the packer source code from github and executes it in a managed AWS environment.

### AWS Systems Manager (works in Dev and SharedServices VPC)

### NONPROD ACCOUNT
Upload bakery document to SSM
```sh
aws --region us-east-1 ssm update-document --name "BASE-AMI-Bakery" --content "file://ssm-ami-automation-nonprod.json" --document-vxxxion "$LATEST"
```
Set default version of bakery document
```sh
aws --region us-east-1 ssm update-document-default-vxxxion --name "BASE-AMI-Bakery" --document-vxxxion "28"
```
Execute automation using bakery document
ECS
```sh
aws --region us-east-1 ssm start-automation-execution --cli-input-json "file://ssm-ecs-input-nonprod.json"
```
CentOS
```sh
aws --region us-east-1 ssm start-automation-execution --cli-input-json "file://ssm-centos-input-nonprod.json"
```

### PROD ACCOUNT NON-PCI
Upload bakery document to SSM
```sh
aws --region us-east-1 ssm update-document --name "PROD-BASE-AMI-Bakery" --content "file://ssm-ami-automation-prod.json" --document-version "$LATEST"
```
Set default vxxxion of bakery document
```sh
aws --region us-east-1 ssm update-document-default-vxxxion --name "PROD-BASE-AMI-Bakery" --document-version "11"
```
Execute automation using bakery document
ECS
```sh
aws --region us-east-1 ssm start-automation-execution --cli-input-json "file://ssm-ecs-input-prod.json"
```
CentOS
```sh
aws --region us-east-1 ssm start-automation-execution --cli-input-json "file://ssm-centos-input-prod.json"
```

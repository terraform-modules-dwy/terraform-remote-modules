# Terraform Remote Modules
  - This repository is for the team to use remote terraform modules.
  - Versions of the modules can be maintained here. \
  - Its <span style="color:blue">completely automated repository</span> where all the push and action runs happens in automated fashion

#### Pipelines:
1. azure extractor: to extract the azure .zip modules (02_azure-module-extraction.yml)
2. aws extractor: to extract the aws .zip modules (01_aws-module-extraction.yml)
3. gcp extractor: to extract the gcp .zip modules (03_gcp-module-extraction.yml)

Extractor-Reusable pipeline: this contains the logic to unzip the modules and create the modules in the targeted location (extractor.yml)

**Execution Diagram:**

![image](https://github.com/terraform-modules-dwy/terraform-remote-modules/assets/156210181/e3a63af9-79b7-4ef0-a1c9-98937d78e8d8)


#### How to use remote modules:
Create *.tfvars file in which you can pass your inputs 
```
resource_groups = [
  {
    name = "rg-integrations-zone"
    location = "east-us"
    tags = {
        environment = "dev"
     }
  },
  {
    name = "rg-datafactory-zone"
    location = "east-us"
    tags = {
        environment = "dev"
     }
  }
]
```

```
remote module url ➡️ github.com/<ORGANIZATION_NAME>/<REMOTE_REPOSITORY_NAME>/<FOLDER_NAME>/azure/resource_group_Cholans_<VERSION>
module "azure_resource_group" {
  source = "github.com/terraform-modules-dwy/terraform-remote-modules/terraform-modules/azure/resource_group_Cholans_1.0.0"
  for_each = {for rg in var.resource_groups : rg.name => rg}
  name =  each.value.name
  location =  each.value.location
  tags = each.value.tags
}
```

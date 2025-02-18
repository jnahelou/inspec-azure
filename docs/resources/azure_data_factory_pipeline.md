---
title: About the azure_data_factory_pipeline Resource
platform: azure
---

# azure_data_factory_pipeline

Use the `azure_data_factory_pipeline` InSpec audit resource to test properties of an Azure pipeline.

## Azure REST API version, endpoint, and HTTP client parameters

This resource interacts with api versions supported by the resource provider.
The `api_version` can be defined as a resource parameter.
If not provided, the latest version will be used.
For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint, and default values for the HTTP client will be used.
For more information, refer to the resource pack [README](../../README.md).
For api related info : [`Azure pipeline Docs`](https://docs.microsoft.com/en-us/rest/api/datafactory/pipelines/get).


## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure).
For an example `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

`resource_group` and `pipeline_name`, `factory_name` must be given as parameters.

```ruby
describe azure_data_factory_pipeline(resource_group: 'RESOURCE_GROUP', factory_name: 'FACTORY_NAME', pipeline_name: 'PIPELINE_NAME') do
  #...
end
```

## Parameters

| Name                           | Description                                                                       |
 |--------------------------------|-----------------------------------------------------------------------------------|
| resource_group                 | Azure resource group that the targeted resource resides in. `MyResourceGroup`     |
| factory_name                           | Name for the data factory that you want to create your pipeline in..                                                                 |
| pipeline_name                 | The pipeline name. |

All the parameter sets needs be provided for a valid query:
- `resource_group` , `factory_name` and `pipeline_name`
## Properties

| Name                           | Description                                                                      |
|--------------------------------|----------------------------------------------------------------------------------|
| name                           | Name of the Azure resource to test.                                      |
| id                             | The pipeline type.                                                 |
| properties                     | The properties of the Resource.                                |

## Examples

### Test That A Pipeline Exists

```ruby
describe azure_data_factory_pipeline(resource_group: 'RESOURCE_GROUP', factory_name: 'FACTORY_NAME', pipeline_name: 'PIPELINE_NAME') do
  it { should exist }
end
```

### Test That A Pipeline Does Not Exist

```ruby
describe azure_data_factory_pipeline(resource_group: 'RESOURCE_GROUP', factory_name: 'FACTORY_NAME', pipeline_name: 'PIPELINE_NAME') do
  it { should_not exist }
end
 ```

### Test Properties Of A Pipeline

```ruby
describe azure_data_factory_pipeline(resource_group: 'RESOURCE_GROUP', factory_name: 'FACTORY_NAME', pipeline_name: 'PIPELINE_NAME') do
  its('name') { should eq 'PIPELINE_NAME' }
end
```

## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be setup with a `contributor` role on the subscription you wish to test.
---
title: About the azure_monitor_activity_log_alert Resource
platform: azure
---

# azure_monitor_activity_log_alert

Use the `azure_monitor_activity_log_alert` InSpec audit resource to test properties of an Azure Monitor Activity Log Alert.

## Azure REST API Version, Endpoint, and HTTP Client Parameters

This resource interacts with API versions supported by the resource provider.
The `api_version` can be defined as a resource parameter.
If not provided, the latest version will be used.
For more information, refer to [`azure_generic_resource`](azure_generic_resource.md).

Unless defined, `azure_cloud` global endpoint and default values for the HTTP client will be used.
For more information, refer to the resource pack [README](../../README.md).

## Availability

### Installation

This resource is available in the [InSpec Azure resource pack](https://github.com/inspec/inspec-azure). 
For an example `inspec.yml` file and how to set up your Azure credentials, refer to resource pack [README](../../README.md#Service-Principal).

## Syntax

An `azure_monitor_activity_log_alert` resource block identifies an Azure Monitor Activity Log Alert by `name` and `resource_group` or the `resource_id`.
```ruby
describe azure_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
  it { should exist }
end
```
```ruby
describe azure_monitor_activity_log_alert(resource_id: '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/microsoft.insights/activityLogAlerts/{activityLogAlertName}') do
  it { should exist }
end
```
## Parameters

| Name                           | Description                                                                       |
|--------------------------------|-----------------------------------------------------------------------------------|
| resource_group                 | Azure resource group that the targeted resource resides in. `MyResourceGroup`     |
| name                           | Name of the Activity Log Alert to test. `AlertName`                               |
| resource_id                    | The unique resource ID. `/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/microsoft.insights/activityLogAlerts/{activityLogAlertName}` |

Either one of the parameter sets can be provided for a valid query:
- `resource_id`
- `resource_group` and `name`

## Properties

| Property          | Description |
|-------------------|-------------|
| operations        | The list of operations. `['Microsoft.Authorization/policyAssignments/write']` |
| conditions        | The list of activity log alert conditions that will cause this alert to activate. |
| scopes            | A list of resource id prefixes. The alert will only apply to activityLogs with resource ids that fall under one of these prefixes. |
| enabled?          | Indicates whether this activity log alert is enabled. `true` or `false` |

For properties applicable to all resources, such as `type`, `name`, `id`, `properties`, refer to [`azure_generic_resource`](azure_generic_resource.md#properties).

Also, refer to [Azure documentation](https://docs.microsoft.com/en-us/rest/api/monitor/activitylogalerts/get#activitylogalertresource) for other properties available. 
Any attribute in the response may be accessed with the key names separated by dots (`.`), eg. `properties.<attribute>`.

## Examples

### Test an Activity Log Alert Has the Correct Operation
```ruby
describe azure_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
  its('operations') { should include 'Microsoft.Authorization/policyAssignments/write' }
end
```
### Test the Scope of an Activity Log Alert
```ruby
describe azure_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
  its('scopes') { should include 'subscriptions/{SUBSCRIPTION_ID}' }
end
```
## Matchers

This InSpec audit resource has the following special matchers. For a full list of available matchers, please visit our [Universal Matchers page](https://docs.chef.io/inspec/matchers/).

### enabled

Test if a resource is enabled. If an activity log alert is not enabled, then none of its actions will be activated.
```ruby
describe azure_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
  it { should be_enabled }
end
```
### exists
```ruby
# If we expect a resource to always exist
describe azure_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
  it { should exist }
end

# If we expect a resource to never exist
describe azure_monitor_activity_log_alert(resource_group: 'example', name: 'AlertName') do
  it { should_not exist }
end
```
## Azure Permissions

Your [Service Principal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal) must be setup with a `contributor` role on the subscription you wish to test.

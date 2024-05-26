[Introduction](https://github.com/krebor/AzureDemo/#introduction) <br />

[Assignment](https://github.com/krebor/AzureDemo/#assignment) <br />

[Configuration](https://github.com/krebor/AzureDemo/#configuration) <br />

  - [Azure Portal](https://github.com/krebor/AzureDemo/#azure-portal) <br />
  - [Powershell](https://github.com/krebor/AzureDemo/#powershell) <br />
  
[Notes](https://github.com/krebor/AzureDemo/#notes) <br />
  
[Final Overview](https://github.com/krebor/AzureDemo/#final-overview) <br />

## Introduction

In this practice lab we will showcase basic Microsoft Azure functionality like creating and managing resources.

First, we will create an Azure SQL Server and several Azure SQL Databases running under this SQL server.

Similarly, we will also create an App Service Plan and several Web Apps within this plan.

For provisioning of resources we will use Azure Portal and/or PowerShell.

**If you are facing issues with any part of the deployment or task, please review Notes section first.**

## Assignment

Required resources:

• Git account on a platform where you can share your code publicly (e.g. GitHub) <br />
• Email address that you can use to create a free Azure subscription <br />

Notes:

• Use descriptive resource names <br />
• Use the cheapest resource versions that you can use <br />
• You can create additional resources if that will make resource administration easier <br />
• You can create additional resources if that will make resource prices lower <br />
• All assignment steps can be solved using the https://portal.azure.com/ UI, but if you wish to write your own ARM templates you can (this excludes the PowerShell step) <br />

Assignment steps

1. Create a free Azure subscription that you will use to solve these assignments. <br />
You can create the subscription here: https://azure.microsoft.com/en-us/free
2. Create 1 resource group where you will place all of the required resources
3. Create 3 SQL Database resources with arbitrary names <br />
	a. All 3 databases must share the resources they use

4. Create 3 Web App resources with arbitrary names <br />
	a. All 3 Web Apps must share the resources they use, these are small web apps, and we want to keep the costs down <br />
	b. Assume that apps will be accessed from Croatia <br />
	c. You don’t need to publish any kind of code <br />
5. Write a PowerShell script that creates a new Web App and use it to create another app on your subscription <br />
	a. We recommend using the Az PowerShell module but feel free to use other modules instead <br />
	b. The app needs to share resources with apps that you have already created <br />
	c. Save the .ps1 file you will need no push it to git <br />
6. Export the ARM template of your resource group <br />
	a. Open your Resource Group in Azure portal UI <br />
	b. In the left navigation navigate to Automation > Export Template <br />
	c. Save the generated JSON to a file <br />
7. Upload the .ps1 file and ARM JSON file to a public git repository <br />

## Configuration

### Azure Portal

1. **Resource Group**

	a. After creating an Azure Free Subscription, visit https://portal.azure.com and login with your credentials. <br />
	b. Search for **Resource Groups** and select **Create** <br />
	c. Choose a sensible name for your resource group (RG), some guidance is provided by Microsoft [here](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming) <br />
	d. Choose a Region - this will only store metadata about Resource Group <br />
	e. Review + Create <br />
	
2. **SQL Server**

	a. Search for **SQL Servers** and select **Create** <br />
	b. Choose appropriate RG, name and location - in this case "Germany West Central" <br />
	c. Leave remaining settings Networking, Security and Additional settings at their default <br />
	d. Review + Create <br />
	
3. **Databases**

	a. Search for **SQL Databases** select **Create** <br />
	b. Choose appropriate Name, RG, and Server (which we created in previous step) <br />
	c. Choose a minimal SQL Service Tier - in this case we are going with DTU-based purchasing model, Basic tier <br />
	d. Choose storage redundancy tier, in this case we are choosing **Zone-redundant backup storage**
	d. Leave remaining settings Networking, Security and Additional settings at their default <br />
	e. Review + Create <br />
	f. Repeat steps to create all three SQL Databases <br />
	
4. **App Service Plan**

	a. Search for **App Service plans** and select **Create** <br />
	b. Choose appropriate Name, RG, Region and pricing plan - in this case **Free F1 (Shared infrastructure)** <br />
	c. Choose an Operating System - in this case we are using Linux <br />
	d. Review + Create <br />
	
5. **Web Apps**

	a. Search for **App Services** and select **Create** <br />
	b. Choose appropriate Name, RG, Region, App Service Plan and pricing plan <br />
	c. Choose Publish - Code, Runtime Stack - Python 3.12, Operating System - Linux <br />
	d. Leave remaining settings for Database, Deployment, Networking and Monitoring (App Insights - Disabled) at their default <br />
	e. Review + Create <br />
	f. Repeat these steps for two more Web apps
	g. To create fourth and final Web App, use deploy_azure_web_app.ps1 PowerShell script provided in this repository
	
### PowerShell

To ensure that required PowerShell modules are available, use the following commands:

```
Install-Module -Name Az -AllowClobber -Force
```
```
Import-Module Az
```
```
Connect-AzAccount
```

1. **Resource Group**

```
New-AzResourceGroup -Name <ResourceGroupName> -Location <Location>
```

2. **SQL Server**

```
New-AzSqlServer -ResourceGroupName <ResourceGroupName> -Location <Location> -ServerName <ServerName> -ServerVersion "12.0" -SqlAdministratorCredentials (Get-Credential)
```

3. **Databases**

```
New-AzSqlDatabase -ResourceGroupName <ResourceGroupName> -ServerName <ServerName> -DatabaseName <DatabaseName> -Edition Basic
```

4. **App Service Plan**

```
New-AzAppServicePlan -ResourceGroupName <ResourceGroupName> -Name <Name> -Location <Location> -Tier "Free"
```

5. **Web Apps**

```
New-AzWebApp -Name <Name> -Location <Location> -AppServicePlan <AppServicePlanName> -ResourceGroupName <ResourceGroupName>
```

## Notes

-----------

If you're facing error *Authentication failed against tenant* when using *Connect-AzAccount* cmdlet, please use the following command:

```
Update-AzConfig -EnableLoginByWam $false
```

Reference: https://github.com/Azure/azure-powershell/issues/24967

-----------

If you're facing error BadGateway when creating a new App Service plan, try switching your Azure billing plan to Pay-As-You go and creating a new subscription (200$ free credit is still usable).

Alternatively, try waiting for the issue to resolve itself, or raise a ticket with MS support if you're not using Free Tier subscription.

Reference: https://learn.microsoft.com/en-us/answers/questions/1657059/the-subscription-is-not-allowed-to-create-or-updat

-----------

When exporting ARM template of your resource group you may face the following error:

*XXX resource types cannot be exported yet and are not included in the template.*

Some resource types cannot be exported and this is expected behaviour. 

Required resources which could not be created can be provisioned by hand written configuration within ARM template.

Reference: https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/export-template-portal#limitations

## Final Overview

In this short demo we showcased some basic Azure tasks and touched upon provisioning resources via PowerShell.

We also performed some troubleshooting to enable us to complete the assignment, and understand Azure platform in more detail.

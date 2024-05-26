[Introduction](https://github.com/krebor/AzureDemo/#introduction) <br />

[Assignment](https://github.com/krebor/AzureDemo/#assignment) <br />

[Configuration](https://github.com/krebor/AzureDemo/#configuration) <br />

  - [Azure Portal](https://github.com/krebor/AzureDemo/#teamcity) <br />
  - [Powershell](https://github.com/krebor/AzureDemo/#ansible) <br />
  
[Final Overview](https://github.com/krebor/AzureDemo/#final-overview) <br />

## Introduction

In this practice lab we will showcase basic Microsoft Azure functionality like creating and managing resources.

First, we will create an Azure SQL Server and several Azure SQL Databases, which will be running on the created SQL server and within an elastic pool, which will enable them to share resources.

Similarly, we will also create an App Service Plan and several Web Apps within this plan.

For provisioning of resources we will use Azure Portal and PowerShell.

## Assignment

Required resources:

• Git account on a platform where you can share your code publicly (e.g. GitHub)
• Email address that you can use to create a free Azure subscription

Notes:

• Use descriptive resource names
• Use the cheapest resource versions that you can use
• You can create additional resources if that will make resource administration
easier
• You can create additional resources if that will make resource prices lower
• All assignment steps can be solved using the https://portal.azure.com/ UI, but if
you wish to write your own ARM templates you can (this excludes the PowerShell
step)

Assignment steps

1. Create a free Azure subscription that you will use to solve these assignments.
You can create the subscription here: https://azure.microsoft.com/en-us/free
2. Create 1 resource group where you will place all of the required resources
3. Create 3 SQL Database resources with arbitrary names
	a. All 3 databases must share the resources they use

4. Create 3 Web App resources with arbitrary names
	a. All 3 Web Apps must share the resources they use, these are small web apps, and we want to keep the costs down
	b. Assume that apps will be accessed from Croatia
	c. You don’t need to publish any kind of code
5. Write a PowerShell script that creates a new Web App and use it to create another app on your subscription
	a. We recommend using the Az PowerShell module but feel free to use other modules instead
	b. The app needs to share resources with apps that you have already created
	c. Save the .ps1 file you will need no push it to git
6. Export the ARM template of your resource group
	a. Open your Resource Group in Azure portal UI
	b. In the left navigation navigate to Automation > Export Template
	c. Save the generated JSON to a file
7. Upload the .ps1 file and ARM JSON file to a public git repository


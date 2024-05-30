$location = Read-Host -Prompt "Enter the Location (e.g., Germany West Central)"
$webAppName = Read-Host -Prompt "Enter the Web App name"
$appServicePlanName = Read-Host -Prompt "Enter the App Service Plan name"
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"

New-AzWebApp -Name $webAppName -Location $location -AppServicePlan $appServicePlanName -ResourceGroupName $resourceGroupName
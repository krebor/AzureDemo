$location = "Germany West Central"
$webAppName = "app-azuredemo-staging-4"
$appServicePlanName = "asp-azuredemo-staging"
$resourceGroupName = "rg-azuredemo-staging"

New-AzWebApp -Name $webAppName -Location $location -AppServicePlan $appServicePlanName -ResourceGroupName $resourceGroupName
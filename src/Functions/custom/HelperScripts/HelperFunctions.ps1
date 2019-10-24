
function LoadModuleConstants
{
    $constants = @{}
    $constants["LinuxRuntimes"] = @('dotnet', 'node', 'python')
    $constants["WindowsRuntimes"] = @('dotnet', 'node', 'java', 'powershell')
    $constants["AllowedStorageTypes"] = @('Standard_GRS', 'Standard_RAGRS', 'Standard_LRS', 'Standard_ZRS', 'Premium_LRS')
    $constants["RequiedStorageEndpoints"] = @('blob', 'queue', 'table')
    $constants["WebsiteNodeDefaultVersion"] = '10.14.1'
    $constants["RuntimeToImage"] = @{
        'node' = 'mcr.microsoft.com/azure-functions/node:2.0-node8-appservice'
        'dotnet' = 'mcr.microsoft.com/azure-functions/dotnet:2.0-appservice'
        'python' = 'mcr.microsoft.com/azure-functions/python:2.0-python3.6-appservice'
        # TODO: Check container image name with Ankit
        'powershell' = 'mcr.microsoft.com/azure-functions/powershell:2.0-powershell-appservice'
    }


    foreach ($variableName in $constants.Keys)
    {
        if (-not (Get-Variable $variableName -ErrorAction SilentlyContinue))
        {
            Set-Variable $variableName -option Constant -value $constants[$variableName]
        }
    }
}

# Load the module constants
LoadModuleConstants

function GetConnectionString
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $StorageAccountName
    )

    $storageAccountInfo = GetStorageAccount -Name $StorageAccountName -ErrorAction SilentlyContinue
    if (-not $storageAccountInfo)
    {
        throw "Storage account '$StorageAccount' does not exist."
    }    
    
    $skuName = $storageAccountInfo.Sku.Name
    if (-not ($AllowedStorageTypes -contains $skuName))
    {
        throw "Storage type '$skuName' is not allowed'."
    }

    $endpoints = $storageAccountInfo.PrimaryEndpoints
    foreach ($type in $RequiedStorageEndpoints)
    {
        if ([string]::IsNullOrEmpty($endpoints.$type))
        {
            throw "Storage account '$StorageAccountName' has no '$type' endpoint. It must have table, queue, and blob endpoints all enabled."
        }
    }

    #$keys = Get-AzStorageAccountKey -ResourceGroupName $ResourceGroupName -Name $storageAccount -ErrorAction SilentlyContinue
    $keys = Get-AzStorageAccountKey -ResourceGroupName $storageAccountInfo.ResourceGroupName -Name $StorageAccountName -ErrorAction SilentlyContinue
    if ([string]::IsNullOrEmpty($keys[0].Value))
    {
        throw "Storage account '$StorageAccountName' has no key value."
    }

    $accountKey = $keys[0].Value
    #$connectionString = "DefaultEndpointsProtocol=https;EndpointSuffix={1};AccountName=$storageAccount;AccountKey=${$keys[0].Value}"
    $connectionString = "DefaultEndpointsProtocol=https;AccountName=$storageAccount;AccountKey=$accountKey"

    return $connectionString
}

function GetServicePlan
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Name
    )

    $plans = @(Az.Functions\Get-AzFunctionAppPlan)
    foreach ($plan in $plans)
    {
        if ($plan.Name -eq $Name)
        {
            return $plan
        }
    }
}

function GetStorageAccount
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Name
    )

    $storageAccounts = @(Az.Storage.internal\Get-AzStorageAccount)
    foreach ($thisStorageAccount in $storageAccounts)
    {
        if ($thisStorageAccount.StorageAccountName -eq $Name)
        {
            return $thisStorageAccount
        }
    }
}

function GetApplicationInsightsKey
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Name
    )
    $projects = @(Az.ApplicationInsights\Get-AzApplicationInsights)
    foreach ($project in $projects)
    {
        if ($project.Name -eq $Name)
        {
            return $project
        }
    }
}

function AddFunctionAppSettings
{
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [Object]
        $App
    )

    $App.AppServicePlan = ($App.ServerFarmId -split "/")[-1]
    $App.OSType = if ($App.kind.Contains("linux", [StringComparison]::OrdinalIgnoreCase)){ "Linux" } else { "Windows" }
    $currentSubscription = $null
    $resetDefaultSubscription = $false
    
    try
    {
        # Move $a[0].ApplicationSettings.Property.Keys --> $a[0].ApplicationSettings.Keys
        $settings = Get-AzWebAppApplicationSetting -Name $App.Name -ResourceGroupName $App.ResourceGroup -ErrorAction SilentlyContinue
        if ($null -eq $settings)
        {
            $resetDefaultSubscription = $true
            $currentSubscription = (Get-AzContext).Subscription.Id
            $null = Select-AzSubscription $App.SubscriptionId
            $settings = Az.Functions.internal\Get-AzWebAppApplicationSetting -Name $App.Name -ResourceGroupName $App.ResourceGroup -ErrorAction SilentlyContinue
            if ($null -eq $settings)
            {
                # We are unable to get the app settings, return the app
                return $App
            }
        }
    }
    finally
    {
        if ($resetDefaultSubscription)
        {
            $null = Select-AzSubscription $currentSubscription
        }
    }

    <#
    $App.RuntimeName = $App.ApplicationSettings.Property["FUNCTIONS_WORKER_RUNTIME"]
    $App.HostVersion = $App.ApplicationSettings.Property["FUNCTIONS_EXTENSION_VERSION"]
    #>

    $applicationSettings = @{}

    foreach ($keyName in $settings.Property.Keys)
    {
        $applicationSettings[$keyName] = $settings.Property[$keyName]
    }

    $App.ApplicationSettings = $applicationSettings    
    $App.RuntimeName = $settings.Property["FUNCTIONS_WORKER_RUNTIME"]
    $App.HostVersion = $settings.Property["FUNCTIONS_EXTENSION_VERSION"]

    return $App
}

function GetFunctionApps
{
    param
    (
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Object[]]
        $Apps,

        [System.String]
        $Location
    )

    if ($Apps.Count -eq 0)
    {
        return
    }

    for ($index = 0; $index -lt $Apps.Count; $index++)
    {
        $app = $Apps[$index]

        $percentageCompleted = [int]((100 * ($index + 1)) / $Apps.Count)
        $status = "Complete: $($index + 1)/$($Apps.Count) function apps processed."
        Write-Progress -Activity "Getting function apps" -Status $status -PercentComplete $percentageCompleted
        
        if ($app.kind.Contains("functionapp", [StringComparison]::OrdinalIgnoreCase))
        {
            if ($Location)
            {
                if ($app.Location -eq $Location)
                {
                    $app = AddFunctionAppSettings -App $app
                    $app
                }
            }
            else
            {
                $app = AddFunctionAppSettings -App $app
                $app
            }
        }
    }
}

function AddFunctionAppPlanWorkerType
{
    param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $AppPlan
    )

    $currentSubscription = $null
    $resetDefaultSubscription = $false

    # The GetList api for service plan that does not set the Reserved property which is needed to figure out if the OSType is Linux
    if ($null -eq $AppPlan.Reserved)
    {
        try
        {
            # Get the service plan by name does set the Reserved property
            $planObject = Az.Functions.internal\Get-AzFunctionAppPlan -Name $AppPlan.Name -ResourceGroupName $AppPlan.ResourceGroup -SubscriptionId $AppPlan.SubscriptionId -ErrorAction SilentlyContinue

            if ($null -eq $planObject)
            {
                $resetDefaultSubscription = $true
                $currentSubscription = (Get-AzContext).Subscription.Id
                $null = Select-AzSubscription $App.SubscriptionId
                $planObject = Az.Functions.internal\Get-AzFunctionAppPlan -Name $AppPlan.Name -ResourceGroupName $AppPlan.ResourceGroup -SubscriptionId $AppPlan.SubscriptionId -ErrorAction SilentlyContinue
            }

            $AppPlan = $planObject
        }
        finally
        {
            if ($resetDefaultSubscription)
            {
                $null = Select-AzSubscription $currentSubscription
            }
        }

        $AppPlan = $planObject
    }

    $AppPlan.WorkerType = if ($AppPlan.Reserved){ "Linux" } else { "Windows" }

    return $AppPlan
}

function GetFunctionAppPlans
{
    param
    (
        [Parameter(Mandatory=$true)]
        [AllowEmptyCollection()]
        [Object[]]
        $Plans,

        [System.String]
        $Location
    )

    if ($Plans.Count -eq 0)
    {
        return
    }

    for ($index = 0; $index -lt $Plans.Count; $index++)
    {
        $plan = $Plans[$index]
        
        $percentageCompleted = [int]((100 * ($index + 1)) / $Plans.Count)
        $status = "Complete: $($index + 1)/$($Plans.Count) function apps plans processed."
        Write-Progress -Activity "Getting function app plans" -Status $status -PercentComplete $percentageCompleted

        if ($Location)
        {
            if ($plan.Location -eq $Location)
            {
                $plan = AddFunctionAppPlanWorkerType -AppPlan $plan
                $plan
            }
        }
        else
        {
            $plan = AddFunctionAppPlanWorkerType -AppPlan $plan
            $plan
        }
    }
}

function ValidateLocation
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Location,

        [Parameter(Mandatory=$false)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Sku
    )

    $Location = $Location.Trim()
    $availableLocations = @(Az.Functions.internal\Get-AzFunctionAppAvailableLocation | ForEach-Object { $_.Name })
    if (-not ($availableLocations -contains $Location))
    {
        $errorMessage = "Location is invalid. Use: 'Get-AzFunctionAppConsumptionLocation' to see available locations."
        $exception = [System.InvalidOperationException]::New($errorMessage)
        ThrowTerminatingError -ErrorId "LocationIsInvalid" `
                              -ErrorMessage $errorMessage `
                              -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                              -Exception $exception
    }
}

function ValidateFunctionName
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Name
    )

    $result = Test-AzNameAvailability -Type Site -Name $Name

    if (-not $result.NameAvailable)
    {
        $errorMessage = "Function name '$Name' is not available.  Please try a different name."
        $exception = [System.InvalidOperationException]::New($errorMessage)
        ThrowTerminatingError -ErrorId "LocationIsInvalid" `
                              -ErrorMessage $errorMessage `
                              -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                              -Exception $exception
    }
}

function NormalizeSku
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Sku
    )    
    if ($Sku -eq "SHARED")
    {
        return "D1"
    }
    return $Sku
}

function CreateObjectFromPipeline
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        $InputObject
    )

    if ($InputObject.Name -and $InputObject.ResourceGroupName -and $InputObject.SubscriptionId)
    {
        $functionsIdentity = [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.FunctionsIdentity]::new()
        $functionsIdentity.Name = $InputObject.Name
        $functionsIdentity.SubscriptionId = $InputObject.SubscriptionId
        $functionsIdentity.ResourceGroupName = $InputObject.ResourceGroupName

        return $functionsIdentity
    }
    
    return $null
}


function GetSkuName
{
    param
    (
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Sku
    )

    if (($Sku -eq "D1") -or ($Sku -eq "SHARED"))
    {
        return "SHARED"
    }
    elseif (($Sku -eq "B1") -or ($Sku -eq "B2") -or ($Sku -eq "B3") -or ($Sku -eq "BASIC"))
    {
        return "BASIC"
    }
    elseif (($Sku -eq "S1") -or ($Sku -eq "S2") -or ($Sku -eq "S3"))
    {
        return "STANDARD"
    }
    elseif (($Sku -eq "P1") -or ($Sku -eq "P2") -or ($Sku -eq "P3"))
    {
        return "PREMIUM"
    }
    elseif (($Sku -eq "P1V2") -or ($Sku -eq "P2V2") -or ($Sku -eq "P3V2"))
    {
        return "PREMIUMV2"
    }
    elseif (($Sku -eq "PC2") -or ($Sku -eq "PC3") -or ($Sku -eq "PC4"))
    {
        return "PremiumContainer"
    }
    elseif (($Sku -eq "EP1") -or ($Sku -eq "EP2") -or ($Sku -eq "EP3"))
    {
        return "ElasticPremium"
    }
    elseif (($Sku -eq "I1") -or ($Sku -eq "I2") -or ($Sku -eq "I3"))
    {
        return "Isolated"
    }

    $guidanceUrl = 'https://docs.microsoft.com/en-us/azure/azure-functions/functions-premium-plan#plan-and-sku-settings'

    $errorMessage = "Invalid sku (pricing tier), please refer to '$guidanceUrl' for valid values."
    $exception = [System.InvalidOperationException]::New($errorMessage)
    ThrowTerminatingError -ErrorId "InvalidSkuPricingTier" `
                          -ErrorMessage $errorMessage `
                          -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                          -Exception $exception                          
}


function ThrowTerminatingError
{
    param 
    (
        [System.String]
        $ErrorId,

        [System.String]
        $ErrorMessage,

        [System.Management.Automation.ErrorCategory]
        $ErrorCategory,

        [Exception]
        $Exception,

        [object]
        $TargetObject
    )

    if (-not $Exception)
    {
        $Exception = New-Object System.Exception $ErrorMessage
    }

    $errorRecord = New-Object System.Management.Automation.ErrorRecord $Exception, $ErrorId, $ErrorCategory, $TargetObject
    throw $errorRecord
}

# GetConnectionString -ResourceGroupName frangom-ps-delete-me-2 -StorageAccount frangompsdeletea594 ::
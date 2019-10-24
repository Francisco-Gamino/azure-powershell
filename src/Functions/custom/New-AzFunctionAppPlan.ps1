function New-AzFunctionAppPlan {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.IAppServicePlan])]
[CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
[Microsoft.Azure.PowerShell.Cmdlets.Functions.Profile('latest-2019-04-30')]
param(
    [Parameter(Mandatory=$true, HelpMessage='Name of the App Service plan.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
    [System.String]
    ${Name},

    [Parameter(Mandatory=$true, HelpMessage='Name of the resource group to which the resource belongs.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
    [System.String]
    ${ResourceGroupName},

    [Parameter(HelpMessage='The Azure subscription ID.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
    [System.String]
    ${SubscriptionId},

    [Parameter(Mandatory=$true, HelpMessage='The plan sku. Valid inputs are: EP1, P2, EP3')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Functions.Support.SkuType])]
    [System.String]
    # Sku (EP1, EP2 or EP3)
    ${Sku},

    [Parameter(Mandatory=$true, HelpMessage='The worker type for the plan. Valid inputs are: Windows or Linux.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
    [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Functions.Support.WorkerType])]
    [System.String]
    # Worker type (Linux or Windows)
    ${WorkerType},

    [Parameter(Mandatory=$true, HelpMessage='The location for the consumption plan.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
    [ValidateNotNullOrEmpty()]
    [System.String]
    ${Location},

    [Parameter(HelpMessage='The maximum number of workers for the app service plan.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
    [System.Int32]
    [ValidateRange(0,20)]
    [Alias("MaxBurst")]
    ${MaximumWorkerCount},

    [Parameter(HelpMessage='The minimum number of workers for the app service plan.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
    [System.Int32]
    [Alias("MinInstances")]
    [ValidateRange(0,20)]
    ${MinimumWorkerCount},

    [Parameter(HelpMessage='Resource tags.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20150801Preview.IResourceTags]))]
    [System.Collections.Hashtable]
    ${Tag},  

    [Parameter(HelpMessage='Run the command as a job.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    ${AsJob},

    [Parameter(HelpMessage='Run the command asynchronously.')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    ${NoWait},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Azure')]
    [System.Management.Automation.PSObject]
    ${DefaultProfile}
)
    process {

        # Remove bound parameters from the dictionary that cannot be process by the intenal cmdlets.
        foreach ($paramName in @("Sku", "WorkerType", "UseLinuxWorker", "MaximumWorkerCount", "MinimumWorkerCount", "Location"))
        {
            if ($PSBoundParameters.ContainsKey($paramName))
            {
                $null = $PSBoundParameters.Remove($paramName)
            }
        }

        $Sku = NormalizeSku -Sku $Sku
        $tier = GetSkuName -Sku $Sku

        if (($MaximumWorkerCount -gt 0) -and ($tier -ne "ElasticPremium"))
        {
            $errorMessage = "MaximumWorkerCount is only supported for Elastic Premium (EP) plans."
            $exception = [System.InvalidOperationException]::New($errorMessage)
            ThrowTerminatingError -ErrorId "MaximumWorkerCountIsOnlySupportedForElasticPremiumPlan" `
                                  -ErrorMessage $errorMessage `
                                  -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                                  -Exception $exception

        }

        if ($MaximumWorkerCount -lt $MinimumWorkerCount)
        {
            $errorMessage = "MinimumWorkerCount '$($MinimumWorkerCount)' cannot be less than '$($MaximumWorkerCount)'."
            $exception = [System.InvalidOperationException]::New($errorMessage)
            ThrowTerminatingError -ErrorId "MaximumWorkerCountIsOnlySupportedForElasticPremiumPlan" `
                                  -ErrorMessage $errorMessage `
                                  -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                                  -Exception $exception
        }

        $Location = $Location.Trim()
        ValidateLocation -Location $Location

        <#
        $skuDefinition = [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20150801Preview.SkuDescription]::New()
        $skuDefinition.Tier = $tier
        $skuDefinition.Name = $Sku
        $skuDefinition.Capacity = $MinInstances
        #>

        $servicePlan = [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.AppServicePlan]::New()

        # SkuDescription information
        $servicePlan.SkuTier = $tier
        $servicePlan.SkuName = $Sku
        if ($MinimumWorkerCount -gt 0)
        {
            $servicePlan.Capacity = $MinimumWorkerCount
        }       

        $servicePlan.Location = $Location
        $servicePlan.Tag = $Tag
        $servicePlan.Reserved = ($WorkerType -eq "Linux")
        #$servicePlan.WorkerType = $WorkerType
        $servicePlan.MaximumElasticWorkerCount = $MaximumWorkerCount
        $null = $PSBoundParameters.Add("AppServicePlan", $servicePlan)

        Az.Functions.internal\New-AzFunctionAppPlan @PSBoundParameters
    }
}

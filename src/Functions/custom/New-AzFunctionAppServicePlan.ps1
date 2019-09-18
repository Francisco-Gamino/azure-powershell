<#
.Synopsis
Creates or updates an App Service Plan.
.Description
Creates or updates an App Service Plan.
.Link
https://docs.microsoft.com/en-us/powershell/module/az.functions/new-azfunctionappserviceplan
#>
function New-AzFunctionAppServicePlan {
    [OutputType('Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.IAppServicePlan')]
    [CmdletBinding(DefaultParameterSetName='Create', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Description('Creates or updates an App Service Plan.')]
    param(
        [Parameter(ParameterSetName='Create', Mandatory, HelpMessage='Name of the App Service plan.')]
        [Parameter(ParameterSetName='CreateExpanded', Mandatory, HelpMessage='Name of the App Service plan.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
        [System.String]
        ${Name},
    
        [Parameter(ParameterSetName='Create', Mandatory, HelpMessage='Name of the resource group to which the resource belongs.')]
        [Parameter(ParameterSetName='CreateExpanded', Mandatory, HelpMessage='Name of the resource group to which the resource belongs.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
        [System.String]
        ${ResourceGroupName},
    
        [Parameter(ParameterSetName='Create', Mandatory, HelpMessage='Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).')]
        [Parameter(ParameterSetName='CreateExpanded', Mandatory, HelpMessage='Your Azure subscription ID. This is a GUID-formatted string (e.g. 00000000-0000-0000-0000-000000000000).')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
        [System.String]
        ${SubscriptionId},
    
        [Parameter(ParameterSetName='CreateViaIdentity', Mandatory, ValueFromPipeline, HelpMessage='Identity Parameter')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', Mandatory, ValueFromPipeline, HelpMessage='Identity Parameter')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.IFunctionsIdentity]
        ${InputObject},
    
        [Parameter(ParameterSetName='Create', ValueFromPipeline, HelpMessage='App Service plan.')]
        [Parameter(ParameterSetName='CreateViaIdentity', ValueFromPipeline, HelpMessage='App Service plan.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.IAppServicePlan]
        ${AppServicePlan},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Current number of instances assigned to the resource.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Current number of instances assigned to the resource.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${Capacity},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='The time when the server farm free offer expires.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='The time when the server farm free offer expires.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.DateTime]
        ${FreeOfferExpirationTime},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Resource ID of the App Service Environment.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Resource ID of the App Service Environment.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${HostingEnvironmentProfileId},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='If Hyper-V container app service plan <code>true</code>, <code>false</code> otherwise.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='If Hyper-V container app service plan <code>true</code>, <code>false</code> otherwise.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        ${HyperV},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='If <code>true</code>, this App Service Plan owns spot instances.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='If <code>true</code>, this App Service Plan owns spot instances.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        ${IsSpot},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Obsolete: If Hyper-V container app service plan <code>true</code>, <code>false</code> otherwise.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Obsolete: If Hyper-V container app service plan <code>true</code>, <code>false</code> otherwise.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        ${IsXenon},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Kind of resource.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Kind of resource.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${Kind},
    
        [Parameter(ParameterSetName='CreateExpanded', Mandatory, HelpMessage='Resource Location.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', Mandatory, HelpMessage='Resource Location.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${Location},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${MaximumElasticWorkerCount},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='If <code>true</code>, apps assigned to this App Service plan can be scaled independently.If <code>false</code>, apps assigned to this App Service plan will scale to all instances of the plan.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='If <code>true</code>, apps assigned to this App Service plan can be scaled independently.If <code>false</code>, apps assigned to this App Service plan will scale to all instances of the plan.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        ${PerSiteScaling},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='If Linux app service plan <code>true</code>, <code>false</code> otherwise.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='If Linux app service plan <code>true</code>, <code>false</code> otherwise.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        ${Reserved},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Capabilities of the SKU, e.g., is traffic manager enabled')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Capabilities of the SKU, e.g., is traffic manager enabled')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.ICapability[]]
        ${SkuCapability},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Default number of workers for this App Service plan SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Default number of workers for this App Service plan SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${SkuCapacityDefault},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Maximum number of workers for this App Service plan SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Maximum number of workers for this App Service plan SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${SkuCapacityMaximum},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Minimum number of workers for this App Service plan SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Minimum number of workers for this App Service plan SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${SkuCapacityMinimum},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Available scale configurations for an App Service plan.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Available scale configurations for an App Service plan.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${SkuCapacityScaleType},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Family code of the resource SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Family code of the resource SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${SkuFamily},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Locations of the SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Locations of the SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String[]]
        ${SkuLocation},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Name of the resource SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Name of the resource SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${SkuName},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Size specifier of the resource SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Size specifier of the resource SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${SkuSize},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Service tier of the resource SKU.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Service tier of the resource SKU.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${SkuTier},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='The time when the server farm expires. Valid only if it is a spot server farm.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='The time when the server farm expires. Valid only if it is a spot server farm.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.DateTime]
        ${SpotExpirationTime},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Resource tags.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Resource tags.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.IResourceTags]
        ${Tag},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Scaling worker count.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Scaling worker count.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${TargetWorkerCount},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Scaling worker size ID.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Scaling worker size ID.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.Int32]
        ${TargetWorkerSizeId},
    
        [Parameter(ParameterSetName='CreateExpanded', HelpMessage='Target worker tier assigned to the App Service plan.')]
        [Parameter(ParameterSetName='CreateViaIdentityExpanded', HelpMessage='Target worker tier assigned to the App Service plan.')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Body')]
        [System.String]
        ${WorkerTierName},
    
        [Parameter(HelpMessage='The credentials, account, tenant, and subscription used for communication with Azure.')]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Azure')]
        [System.Management.Automation.PSObject]
        ${DefaultProfile},
    
        [Parameter(HelpMessage='Run the command as a job')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${AsJob},
    
        [Parameter(DontShow, HelpMessage='Wait for .NET debugger to attach')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${Break},
    
        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be appended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.SendAsyncStep[]]
        ${HttpPipelineAppend},
    
        [Parameter(DontShow, HelpMessage='SendAsync Pipeline Steps to be prepended to the front of the pipeline')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.SendAsyncStep[]]
        ${HttpPipelinePrepend},
    
        [Parameter(DontShow, HelpMessage='The URI for the proxy server to use')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [System.Uri]
        ${Proxy},
    
        [Parameter(DontShow, HelpMessage='Credentials for a proxy server to use for the remote call')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        ${ProxyCredential},
    
        [Parameter(DontShow, HelpMessage='Use the default credentials for the proxy')]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        ${ProxyUseDefaultCredentials}
    )
    
    begin {
        try {
            $outBuffer = $null
            if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
                $PSBoundParameters['OutBuffer'] = 1
            }
            $parameterSet = $PsCmdlet.ParameterSetName
            $mapping = @{
                Create = 'Az.Functions.private\New-AzFunctionAppServicePlan_Create';
                CreateExpanded = 'Az.Functions.private\New-AzFunctionAppServicePlan_CreateExpanded';
                CreateViaIdentity = 'Az.Functions.private\New-AzFunctionAppServicePlan_CreateViaIdentity';
                CreateViaIdentityExpanded = 'Az.Functions.private\New-AzFunctionAppServicePlan_CreateViaIdentityExpanded';
            }
            $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
            $scriptCmd = {& $wrappedCmd @PSBoundParameters}
            $steppablePipeline = $scriptCmd.GetSteppablePipeline($myInvocation.CommandOrigin)
            $steppablePipeline.Begin($PSCmdlet)
        } catch {
            throw
        }
    }
    
    process {
        try {
            $steppablePipeline.Process($_)
        } catch {
            throw
        }
    }
    
    end {
        try {
            $steppablePipeline.End()
        } catch {
            throw
        }
    }
    }
    
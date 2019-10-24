
function New-AzFunctionApp {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.ISite])]
    [Microsoft.Azure.PowerShell.Cmdlets.Functions.Description('Creates a function app.')]
    [CmdletBinding(SupportsShouldProcess=$true, DefaultParametersetname="ByAppServicePlan")]
    param(        
        [Parameter(ParameterSetName="Consumption", HelpMessage='The Azure subscription ID.')]
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [ValidateNotNullOrEmpty()]
        [System.String[]]
        ${SubscriptionId},
        
        [Parameter(Mandatory=$true, ParameterSetName="Consumption", HelpMessage='The name of the resource group.')]
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${ResourceGroupName},
        
        [Parameter(Mandatory=$true, ParameterSetName="Consumption", HelpMessage='The name of the function app.')]
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${Name},

        [Parameter(ParameterSetName="ByAppServicePlan", HelpMessage='The service plan type.')]
        [Parameter(ParameterSetName="Consumption")]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Functions.Support.PlanType])]
        [ValidateNotNullOrEmpty()]
        [System.String]
        # Plan type (Dedicated, Consumption or Premium)
        ${PlanType},
        
        [Parameter(Mandatory=$true, ParameterSetName="Consumption", HelpMessage='The name of the storage account.')]
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${StorageAccountName},        

        [Parameter(ParameterSetName="Consumption", HelpMessage='Name of the existing App Insights project to be added to the function app.')]
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [ValidateNotNullOrEmpty()]
        [System.String]
        [Alias("AppInsightsName")]
        ${ApplicationInsightsName},

        [Parameter(ParameterSetName="Consumption", HelpMessage='Instrumentation key of App Insights to be added.')]
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [ValidateNotNullOrEmpty()]
        [System.String]
        [Alias("AppInsightsKey")]
        ${ApplicationInsightsKey},

        [Parameter(ParameterSetName="Consumption", HelpMessage='The location for the consumption plan.')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${Location},

        [Parameter(ParameterSetName="ByAppServicePlan", HelpMessage='The name of the service plan.')]
        [ValidateNotNullOrEmpty()]
        [System.String]
        ${PlanName},

        [Parameter(ParameterSetName="ByAppServicePlan", HelpMessage='Linux only. Container image name from Docker Hub, e.g. publisher/image-name:tag.')]
        [Parameter(ParameterSetName="Consumption")]
        [System.String]
        ${DockerImageName},

        [Parameter(ParameterSetName="ByAppServicePlan", HelpMessage='The OS to host the function app.')]
        [Parameter(ParameterSetName="Consumption")]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Functions.Support.WorkerType])]
        # OS type (Linux or Windows)
        ${OSType},
        
        [Parameter(ParameterSetName="ByAppServicePlan", HelpMessage='The function runtime.')]
        [Parameter(ParameterSetName="Consumption")]
        [ArgumentCompleter([Microsoft.Azure.PowerShell.Cmdlets.Functions.Support.WorkerType])]
        # Runtime type (DotNet, Node, Java, PowerShell or Python
        [System.String]
        ${Runtime},

        [Parameter(ParameterSetName="ByAppServicePlan", HelpMessage='Disable creating application insights resource during the function app creation. No logs will be available.')]
        [Parameter(ParameterSetName="Consumption")]
        [System.Management.Automation.SwitchParameter]
        [Alias("DisableAppInsights")]
        ${DisableApplicationInsights},
        
        [Parameter(ParameterSetName="ByAppServicePlan")]
        [Parameter(ParameterSetName="Consumption", HelpMessage='Returns true when the command succeeds.')]
        [System.Management.Automation.SwitchParameter]
        ${PassThru},

        [Parameter(ParameterSetName="ByAppServicePlan")]
        [Parameter(ParameterSetName="Consumption")]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Category('Azure')]
        [System.Management.Automation.PSObject]
        ${DefaultProfile}
)
    process {

        # Remove bound parameters from the dictionary that cannot be process by the intenal cmdlets.
        $paramsToRemove = @(
            "StorageAccountName",
            "ApplicationInsightsName",
            "ApplicationInsightsKey",
            "Location",
            "PlanName",
            "PlanType",
            "DockerImageName",
            "OSType",
            "Runtime",
            "DisableApplicationInsights"
        )
        foreach ($paramName in $paramsToRemove)
        {
            if ($PSBoundParameters.ContainsKey($paramName))
            {
                $null = $PSBoundParameters.Remove($paramName)
            }
        }

        # Validate and set function app name
        ValidateFunctionName -Name $Name

        $appSettings = @{}
        $siteCofig = [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.SiteConfig]::new()
        $functionAppDef = [Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.Site]::new()
        $servicePlan = $null

        $OSIsLinux = $OSType -eq "Linux"
        $consumptionPlan = $PsCmdlet.ParameterSetName -eq "Consumption"
        
        if ($consumptionPlan)
        {
            $Location = $Location.Trim()

            $availableLocations = @(Get-AzFunctionAppConsumptionLocation | ForEach-Object { $_.Name })
            if (-not ($availableLocations -contains $Location))
            {
                $errorMessage = "Location is invalid. Use: 'Get-AzFunctionAppConsumptionLocation' to see available locations."
                $exception = [System.InvalidOperationException]::New($errorMessage)
                ThrowTerminatingError -ErrorId "LocationIsInvalid" `
                                      -ErrorMessage $errorMessage `
                                      -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                                      -Exception $exception
            }

            $appSettings.Add("FUNCTIONS_EXTENSION_VERSION","~2")
        }
        else 
        {
            # App with SKU based plan
            $servicePlan = GetServicePlan $PlanName
            if (-not $servicePlan)
            {
                throw "Service plan '$PlanName' does not exist."
            }

            if ($null -ne $servicePlan.Location)
            {
                $Location = $servicePlan.Location
            }

            if ($null -ne $servicePlan.Reserved)
            {
                $OSIsLinux = $servicePlan.Reserved
            }

            $functionAppDef.ServerFarmId = $servicePlan.Id
        }

        # Validate Runtime
        if ($Runtime)
        {
            if ($OSIsLinux)
            {
                if (-not ($LinuxRuntimes -contains $Runtime))
                {
                    $runtimeOptions = $LinuxRuntimes -join ", "
                    $errorMessage = "Invalid runtime for Linux. Currently supported runtimes are: $runtimeOptions"
                    $exception = [System.InvalidOperationException]::New($errorMessage)
                    ThrowTerminatingError -ErrorId "LocationIsInvalid" `
                                          -ErrorMessage $errorMessage `
                                          -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                                          -Exception $exception
                }
            }
            else
            {
                if (-not ($WindowsRuntimes -contains $Runtime))
                {
                    $runtimeOptions = $WindowsRuntimes -join ", "
                    $errorMessage = "Invalid runtime for Windows. Currently supported runtimes are: $runtimeOptions"
                    $exception = [System.InvalidOperationException]::New($errorMessage)
                    ThrowTerminatingError -ErrorId "LocationIsInvalid" `
                                          -ErrorMessage $errorMessage `
                                          -ErrorCategory ([System.Management.Automation.ErrorCategory]::InvalidOperation) `
                                          -Exception $exception
                }
            }

            $runtimeWorker = $Runtime.ToLower()
            $appSettings.Add('FUNCTIONS_WORKER_RUNTIME',"$runtimeWorker")
        }

        if ($OSIsLinux -and (-not $Runtime) -and ($consumptionPlan -or (-not $DockerImageName)))
        {
            throw "-Runtime required for linux functions apps without custom image."
        }

        if ($OSIsLinux)
        {
            # Linux function app            
            $functionAppDef.Kind = 'functionapp,linux'
            $functionAppDef.Reserved = $true

            if ($DockerImageName)
            {
                $functionAppDef.Kind = 'functionapp,linux,container'
                $appSettings.Add('DOCKER_CUSTOM_IMAGE_NAME', $DockerImageName)
                $appSettings.Add('FUNCTION_APP_EDIT_MODE', 'readOnly')
                $appSettings.Add('WEBSITES_ENABLE_APP_SERVICE_STORAGE', 'false')
                $DockerImageName = $DockerImageName.Trim().ToLower()

                # TODO check with Roger/Maheer/Bala to make sure this is correct.
                # https://github.com/Azure/azure-cli/blob/a6dfefb6b07b40ee793ffc52a6a0ba9338c07eff/src/azure-cli/azure/cli/command_modules/appservice/custom.py#L706
                $siteCofig.LinuxFxVersion = "DOCKER|$DockerImageName"
            }

            else
            {
                if (-not $RuntimeToImage.ContainsKey($Runtime))
                {
                    throw "An appropriate linux image for runtime: '$Runtime' was not found"
                }

                $image = $RuntimeToImage[$Runtime]
                $image = $image.ToLower()
                $siteCofig.LinuxFxVersion = "DOCKER|$image"
            }
        }
        else 
        {
            # Windows function app
            $functionAppDef.Kind = 'functionapp'        
        }    

        # Set the default Host version.
        $appSettings.Add('FUNCTIONS_EXTENSION_VERSION','~2')

        $connectionStrings = GetConnectionString -ResourceGroupName $ResourceGroupName -StorageAccountName $StorageAccountName
        $appSettings.Add('WEBSITE_CONTENTAZUREFILECONNECTIONSTRING', $connectionStrings)
        $appSettings.Add('AzureWebJobsDashboard', $connectionStrings)
        $appSettings.Add('WEBSITE_NODE_DEFAULT_VERSION', $WebsiteNodeDefaultVersion)

        # If plan is not consumption or elastic premium, set always on
        $planIsElasticPremium = $servicePlan.SkuTier -eq 'ElasticPremium'
        if ((-not $consumptionPlan) -and $planIsElasticPremium)
        {
            $siteCofig.AlwaysOn = $true
        }

        # If plan is elastic premium or windows consumption, we need these app settings
        $IsWindowsConsumption = $consumptionPlan -and  (-not $OSIsLinux)

        if ($planIsElasticPremium -or $IsWindowsConsumption)
        {
            $appSettings.Add('WEBSITE_CONTENTAZUREFILECONNECTIONSTRING', $connectionStrings)
            $appSettings.Add('WEBSITE_CONTENTSHARE', $Name.ToLower())
        }

        if (-not $DisableAppInsights)
        {
            if ($AppInsightsKey)
            {
                $appSettings.Add('APPINSIGHTS_INSTRUMENTATIONKEY', $AppInsightsKey)
            }
            elseif ($AppInsights)
            {
                # TODO: Need to fix this to make an internal cmdlet call
                $AppInsightsKey = GetApplicationInsightsKey -Name $AppInsights
                if (-not $appInsightsProject)
                {
                    throw "Failed to get application insights key for project name '$AppInsights'. Please make sure the project exist."
                }
                $appSettings.Add('APPINSIGHTS_INSTRUMENTATIONKEY', $AppInsightsKey)
            }
            else
            {
                # Create a new ApplicationInsights
                $warningMessage = $null
                try 
                {
                    $AppInsights = Az.ApplicationInsights\New-AzApplicationInsights -ResourceGroupName $resourceGroupName -Name $functionAppDef.Name -Kind web -Location $functionAppDef.Location -ErrorAction Stop
                    $warningMessage = "Application Insights was created for this Function App '$($AppInsights.Name)'. You can visit 'https://portal.azure.com/#resource$($AppInsights.Id)/overview' to view your Application Insights component."

                    $appSettings.Add('APPINSIGHTS_INSTRUMENTATIONKEY', $AppInsights.InstrumentationKey)
                }
                catch
                {
                    $warningMessage = 'Unable to create the Application Insights for the Function App. Please use the Azure Portal to manually create and configure the Application Insights, if needed.'                    
                }

                Write-Warning $warningMessage
            }
        }       

        # Try to create the function app
        $siteCofig.AppSetting = $appSettings
        $functionAppDef.Config = $siteCofig
        Az.Functions.internal\Get-AzFunctionApp -ResourceGroupName $resourceGroupName -Name $Name -SiteEnvelope $functionAppDef
    }
}


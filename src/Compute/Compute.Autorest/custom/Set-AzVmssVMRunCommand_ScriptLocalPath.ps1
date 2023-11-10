
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

function Set-AzVmssVMRunCommand_ScriptLocalPath {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.Compute.Models.Api20230701.IVirtualMachineRunCommand])]
    [CmdletBinding(PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Path')]
        [System.String]
        # The instance ID of the virtual machine.
        ${InstanceId},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Path')]
        [System.String]
        # The name of the resource group.
        ${ResourceGroupName},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Path')]
        [System.String]
        # The name of the virtual machine run command.
        ${RunCommandName},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Path')]
        [System.String]
        # The name of the VM scale set.
        ${VMScaleSetName},
        
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Specifies a commandId of predefined built-in script.
        ${ScriptLocalPath},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # Subscription credentials which uniquely identify Microsoft Azure subscription.
        # The subscription ID forms part of the URI for every service call.
        ${SubscriptionId},
    
        [Parameter(Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Resource location
        ${Location},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # Optional.
        # If set to true, provisioning will complete as soon as the script starts and will not wait for script to complete.
        ${AsyncExecution},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Specifies the Azure storage blob where script error stream will be uploaded.
        ${ErrorBlobUri},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Specifies the Azure storage blob where script output stream will be uploaded.
        ${OutputBlobUri},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Models.Api20230701.IRunCommandInputParameter[]]
        # The parameters used by the script.
        # To construct, see NOTES section for PARAMETER properties and create a hash table.
        ${Parameter},
    
        [Parameter()]
        [AllowEmptyCollection()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Models.Api20230701.IRunCommandInputParameter[]]
        # The parameters used by the script.
        # To construct, see NOTES section for PROTECTEDPARAMETER properties and create a hash table.
        ${ProtectedParameter},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Specifies the user account password on the VM when executing the run command.
        ${RunAsPassword},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Client Id (GUID value) of the user-assigned managed identity.
        # ObjectId should not be used if this is provided.
        ${ErrorBlobManagedIdentityClientId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Object Id (GUID value) of the user-assigned managed identity.
        # ClientId should not be used if this is provided.
        ${ErrorBlobManagedIdentityObjectId},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Client Id (GUID value) of the user-assigned managed identity.
        # ObjectId should not be used if this is provided.
        ${OutputBlobManagedIdentityClientId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Object Id (GUID value) of the user-assigned managed identity.
        # ClientId should not be used if this is provided.
        ${OutputBlobManagedIdentityObjectId},

        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Client Id (GUID value) of the user-assigned managed identity.
        # ObjectId should not be used if this is provided.
        ${ScriptUriManagedIdentityClientId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Object Id (GUID value) of the user-assigned managed identity.
        # ClientId should not be used if this is provided.
        ${ScriptUriManagedIdentityObjectId},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.Management.Automation.SwitchParameter]
        # Optional.
        # If set to true, any failure in the script will fail the deployment and ProvisioningState will be marked as Failed.
        # If set to false, ProvisioningState would only reflect whether the run command was run or not by the extensions platform, it would not indicate whether script failed in case of script failures.
        # See instance view of run command in case of script failures to see executionMessage, output, error: https://aka.ms/runcommandmanaged#get-execution-status-and-results
        ${TreatFailureAsDeploymentFailure},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.String]
        # Specifies the user account on the VM when executing the run command.
        ${RunAsUser},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Compute.Models.Api10.IResourceTags]))]
        [System.Collections.Hashtable]
        # Resource tags
        ${Tag},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Body')]
        [System.Int32]
        # The timeout in seconds to execute the run command.
        ${TimeoutInSecond},
    
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.Compute.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
        if ($PSBoundParameters.ContainsKey("ScriptLocalPath"))
        {
             # Read Local File and add 
             $script = ""
             if ((Get-ChildItem $scriptLocalPath | Select-Object Extension).Extension -eq ".sh"){
                 foreach ($line in Get-Content -Path $scriptLocalPath){
                     $words = $line.trim().split()
                     $commentFound = $false
                     foreach ($word in $words){
                         if ($word[0] -eq "#" -and $commentFound -eq $false){
                             $commentFound = $true
                             $script += "``" + $word + " "
                         }
                         else{
                             $script += $word + " "
                         }
                     }
                     $script = $script.trim()
                     #close 
                     if ($commentFound){
                     $script += "``"
                     }
                     $script += ";"
                 }
             }
             else{
                 foreach ($line in Get-Content -Path $scriptLocalPath){
                     $words = $line.trim().split()
                     $commentFound = $false
                     foreach ($word in $words){
                         if ($word[0] -eq "#" -and $commentFound -eq $false){
                             $commentFound = $true
                             $script += "<" + $word + " "
                         }
                         else{
                             $script += $word + " "
                         }
                     }
                     $script = $script.trim()
                     #close 
                     if ($commentFound){
                         $script += "#>"
                     }
                     $script += ";"
                 }
            }
            $PSBoundParameters.Add("SourceScript", $script)
            # If necessary, remove the -ParameterA parameter from the dictionary of bound parameters
            $null = $PSBoundParameters.Remove("ScriptLocalPath")
        }
        Az.Compute\Set-AzVmssVMRunCommand @PSBoundParameters
    }
}
    
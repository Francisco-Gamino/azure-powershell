namespace Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201
{
    public partial class Site :
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.ISite,
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20180201.ISiteInternal,
        Microsoft.Azure.PowerShell.Cmdlets.Functions.Runtime.IValidates
    {
        /* 

        /// <summary>The site resource group name.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.Functions.Origin(Microsoft.Azure.PowerShell.Cmdlets.Functions.PropertyOrigin.Inlined)]
        public string ResourceGroupName { get => ((Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20150801.ISitePropertiesInternal)Property).ResourceGroup; }

        /// <summary>The site status. This is an alias for the state property.</summary>
        public string Status { get => ((Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20150801.ISitePropertiesInternal)Property).State;}

        /// <summary>The site subscription Id. </summary>
        public string SubscriptionId { 
            get => GetSubscriptionId(((Microsoft.Azure.PowerShell.Cmdlets.Functions.Models.Api20150801.ISitePropertiesInternal)Property).ServerFarmId); }

        
        */
	    
        // Function app settings. These gets set via PowerShell. For more info, please see custom/HelperScripts/HelperFunctions.ps1        

        public System.Collections.Hashtable ApplicationSettings { get; set; }
        
        public string RuntimeName { get; set; }
        
        public string HostVersion { get; set; }

        public string OSType { get; set; }

        public string AppServicePlan { get; set; }        
        
    }
}
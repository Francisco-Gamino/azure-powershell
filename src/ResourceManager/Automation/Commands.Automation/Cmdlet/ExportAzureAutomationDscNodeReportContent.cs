﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using Microsoft.Azure.Commands.Automation.Common;
using System;
using System.IO;
using System.Management.Automation;
using System.Security.Permissions;

namespace Microsoft.Azure.Commands.Automation.Cmdlet
{
    /// <summary>
    /// Gets node report for a given node and report id
    /// </summary>
    [Cmdlet(VerbsData.Export, "AzureRmAutomationDscNodeReportContent", SupportsShouldProcess = true,
        DefaultParameterSetName = AutomationCmdletParameterSets.ByAll)]
    [OutputType(typeof(DirectoryInfo))]
    public class ExportAzureAutomationDscNodeReportContent : AzureAutomationBaseCmdlet
    {
        /// <summary>
        /// True to overwrite the existing node report; false otherwise.
        /// </summary>        
        private bool overwriteExistingFile;

        /// <summary> 
        /// Gets or sets the node id. 
        /// </summary> 
        [Parameter(Mandatory = true, ParameterSetName = AutomationCmdletParameterSets.ByAll, ValueFromPipelineByPropertyName = true, HelpMessage = "The dsc node id.")]
        public Guid NodeId { get; set; }

        /// <summary> 
        /// Gets or sets the report id. 
        /// </summary> 
        [Parameter(Mandatory = true, ParameterSetName = AutomationCmdletParameterSets.ByAll, ValueFromPipelineByPropertyName = true, HelpMessage = "The dsc node report id.")]
        [Alias("Id")]
        public Guid ReportId { get; set; }

        /// <summary>
        /// Gets or sets the output folder for the configuration script.
        /// </summary>
        [Parameter(Mandatory = false, ValueFromPipelineByPropertyName = true, HelpMessage = "The folder where node report should be placed.")]
        public string OutputFolder { get; set; }

        /// <summary>
        /// Gets or sets switch parameter to confirm overwriting of existing node report.
        /// </summary>
        [Parameter(Mandatory = false, HelpMessage = "Forces an overwrite of an existing local file with the same name.")]
        public SwitchParameter Force
        {
            get { return this.overwriteExistingFile; }
            set { this.overwriteExistingFile = value; }
        }

        /// <summary>
        /// Execute this cmdlet.
        /// </summary>
        [PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
        public override void ExecuteCmdlet()
        {
            if (ShouldProcess(ReportId.ToString(), VerbsData.Export))
            {
                var ret = this.AutomationClient.GetDscNodeReportContent(this.ResourceGroupName,
                    this.AutomationAccountName, this.NodeId, this.ReportId, OutputFolder, overwriteExistingFile);

                this.WriteObject(ret, true);
            }
        }
    }
}
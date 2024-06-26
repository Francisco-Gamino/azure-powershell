// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701
{
    using static Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Runtime.Extensions;

    /// <summary>
    /// AgentPoolPatchParameters represents the body of the request to patch the Kubernetes cluster agent pool.
    /// </summary>
    public partial class AgentPoolPatchParameters :
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParameters,
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersInternal
    {

        /// <summary>The number of virtual machines that use this configuration.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.PropertyOrigin.Inlined)]
        public long? Count { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchPropertiesInternal)Property).Count; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchPropertiesInternal)Property).Count = value ?? default(long); }

        /// <summary>Internal Acessors for Property</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchProperties Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersInternal.Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.AgentPoolPatchProperties()); set { {_property = value;} } }

        /// <summary>Internal Acessors for UpgradeSetting</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolUpgradeSettings Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersInternal.UpgradeSetting { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchPropertiesInternal)Property).UpgradeSetting; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchPropertiesInternal)Property).UpgradeSetting = value; }

        /// <summary>Backing field for <see cref="Property" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchProperties _property;

        /// <summary>The list of the resource properties.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.PropertyOrigin.Owned)]
        internal Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchProperties Property { get => (this._property = this._property ?? new Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.AgentPoolPatchProperties()); set => this._property = value; }

        /// <summary>Backing field for <see cref="Tag" /> property.</summary>
        private Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersTags _tag;

        /// <summary>The Azure resource tags that will replace the existing ones.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.PropertyOrigin.Owned)]
        public Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersTags Tag { get => (this._tag = this._tag ?? new Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.AgentPoolPatchParametersTags()); set => this._tag = value; }

        /// <summary>
        /// The maximum number or percentage of nodes that are surged during upgrade. This can either be set to an integer (e.g. '5')
        /// or a percentage (e.g. '50%'). If a percentage is specified, it is the percentage of the total agent pool size at the time
        /// of the upgrade. For percentages, fractional nodes are rounded up. If not specified, the default is 1.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Origin(Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.PropertyOrigin.Inlined)]
        public string UpgradeSettingMaxSurge { get => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchPropertiesInternal)Property).UpgradeSettingMaxSurge; set => ((Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchPropertiesInternal)Property).UpgradeSettingMaxSurge = value ?? null; }

        /// <summary>Creates an new <see cref="AgentPoolPatchParameters" /> instance.</summary>
        public AgentPoolPatchParameters()
        {

        }
    }
    /// AgentPoolPatchParameters represents the body of the request to patch the Kubernetes cluster agent pool.
    public partial interface IAgentPoolPatchParameters :
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Runtime.IJsonSerializable
    {
        /// <summary>The number of virtual machines that use this configuration.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"The number of virtual machines that use this configuration.",
        SerializedName = @"count",
        PossibleTypes = new [] { typeof(long) })]
        long? Count { get; set; }
        /// <summary>The Azure resource tags that will replace the existing ones.</summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"The Azure resource tags that will replace the existing ones.",
        SerializedName = @"tags",
        PossibleTypes = new [] { typeof(Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersTags) })]
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersTags Tag { get; set; }
        /// <summary>
        /// The maximum number or percentage of nodes that are surged during upgrade. This can either be set to an integer (e.g. '5')
        /// or a percentage (e.g. '50%'). If a percentage is specified, it is the percentage of the total agent pool size at the time
        /// of the upgrade. For percentages, fractional nodes are rounded up. If not specified, the default is 1.
        /// </summary>
        [Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Runtime.Info(
        Required = false,
        ReadOnly = false,
        Description = @"The maximum number or percentage of nodes that are surged during upgrade. This can either be set to an integer (e.g. '5') or a percentage (e.g. '50%'). If a percentage is specified, it is the percentage of the total agent pool size at the time of the upgrade. For percentages, fractional nodes are rounded up. If not specified, the default is 1.",
        SerializedName = @"maxSurge",
        PossibleTypes = new [] { typeof(string) })]
        string UpgradeSettingMaxSurge { get; set; }

    }
    /// AgentPoolPatchParameters represents the body of the request to patch the Kubernetes cluster agent pool.
    internal partial interface IAgentPoolPatchParametersInternal

    {
        /// <summary>The number of virtual machines that use this configuration.</summary>
        long? Count { get; set; }
        /// <summary>The list of the resource properties.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchProperties Property { get; set; }
        /// <summary>The Azure resource tags that will replace the existing ones.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolPatchParametersTags Tag { get; set; }
        /// <summary>The configuration of the agent pool.</summary>
        Microsoft.Azure.PowerShell.Cmdlets.NetworkCloud.Models.Api20230701.IAgentPoolUpgradeSettings UpgradeSetting { get; set; }
        /// <summary>
        /// The maximum number or percentage of nodes that are surged during upgrade. This can either be set to an integer (e.g. '5')
        /// or a percentage (e.g. '50%'). If a percentage is specified, it is the percentage of the total agent pool size at the time
        /// of the upgrade. For percentages, fractional nodes are rounded up. If not specified, the default is 1.
        /// </summary>
        string UpgradeSettingMaxSurge { get; set; }

    }
}
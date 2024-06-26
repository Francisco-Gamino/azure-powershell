// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.Resources.Models
{
    using System.Linq;

    /// <summary>
    /// Private Link Association Properties.
    /// </summary>
    public partial class PrivateLinkAssociationPropertiesExpanded
    {
        /// <summary>
        /// Initializes a new instance of the PrivateLinkAssociationPropertiesExpanded class.
        /// </summary>
        public PrivateLinkAssociationPropertiesExpanded()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the PrivateLinkAssociationPropertiesExpanded class.
        /// </summary>

        /// <param name="privateLink">The rmpl Resource ID.
        /// </param>

        /// <param name="publicNetworkAccess">
        /// Possible values include: &#39;Enabled&#39;, &#39;Disabled&#39;</param>

        /// <param name="tenantId">The TenantID.
        /// </param>

        /// <param name="scope">The scope of the private link association.
        /// </param>
        public PrivateLinkAssociationPropertiesExpanded(string privateLink = default(string), string publicNetworkAccess = default(string), string tenantId = default(string), string scope = default(string))

        {
            this.PrivateLink = privateLink;
            this.PublicNetworkAccess = publicNetworkAccess;
            this.TenantId = tenantId;
            this.Scope = scope;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();


        /// <summary>
        /// Gets or sets the rmpl Resource ID.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "privateLink")]
        public string PrivateLink {get; set; }

        /// <summary>
        /// Gets or sets Possible values include: &#39;Enabled&#39;, &#39;Disabled&#39;
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "publicNetworkAccess")]
        public string PublicNetworkAccess {get; set; }

        /// <summary>
        /// Gets or sets the TenantID.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "tenantID")]
        public string TenantId {get; set; }

        /// <summary>
        /// Gets or sets the scope of the private link association.
        /// </summary>
        [Newtonsoft.Json.JsonProperty(PropertyName = "scope")]
        public string Scope {get; set; }
    }
}
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.

namespace Microsoft.Azure.Management.HDInsight
{
    using Microsoft.Rest.Azure;
    using Models;

    /// <summary>
    /// ConfigurationsOperations operations.
    /// </summary>
    public partial interface IConfigurationsOperations
    {
        /// <summary>
        /// Gets all configuration information for an HDI cluster.
        /// </summary>
        /// <remarks>
        /// Gets all configuration information for an HDI cluster.
        /// </remarks>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='customHeaders'>
        /// The headers that will be added to request.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        /// <exception cref="Microsoft.Rest.Azure.CloudException">
        /// Thrown when the operation returned an invalid status code
        /// </exception>
        /// <exception cref="Microsoft.Rest.SerializationException">
        /// Thrown when unable to deserialize the response
        /// </exception>
        System.Threading.Tasks.Task<Microsoft.Rest.Azure.AzureOperationResponse<ClusterConfigurations>> ListWithHttpMessagesAsync(string resourceGroupName, string clusterName, System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>> customHeaders = null, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken));

        /// <summary>
        /// Configures the HTTP settings on the specified cluster. This API is
        /// deprecated, please use UpdateGatewaySettings in cluster endpoint instead.
        /// </summary>
        /// <remarks>
        /// Configures the HTTP settings on the specified cluster. This API is
        /// deprecated, please use UpdateGatewaySettings in cluster endpoint instead.
        /// </remarks>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='configurationName'>
        /// The name of the cluster configuration.
        /// </param>
        /// <param name='parameters'>
        /// The cluster configurations.
        /// </param>
        /// <param name='customHeaders'>
        /// The headers that will be added to request.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        /// <exception cref="Microsoft.Rest.Azure.CloudException">
        /// Thrown when the operation returned an invalid status code
        /// </exception>
        System.Threading.Tasks.Task<Microsoft.Rest.Azure.AzureOperationResponse> UpdateWithHttpMessagesAsync(string resourceGroupName, string clusterName, string configurationName, System.Collections.Generic.IDictionary<string, string> parameters, System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>> customHeaders = null, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken));

        /// <summary>
        /// The configuration object for the specified cluster. This API is not
        /// recommended and might be removed in the future. Please consider using List
        /// configurations API instead.
        /// </summary>
        /// <remarks>
        /// The configuration object for the specified cluster. This API is not
        /// recommended and might be removed in the future. Please consider using List
        /// configurations API instead.
        /// </remarks>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='configurationName'>
        /// The name of the cluster configuration.
        /// </param>
        /// <param name='customHeaders'>
        /// The headers that will be added to request.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        /// <exception cref="Microsoft.Rest.Azure.CloudException">
        /// Thrown when the operation returned an invalid status code
        /// </exception>
        /// <exception cref="Microsoft.Rest.SerializationException">
        /// Thrown when unable to deserialize the response
        /// </exception>
        System.Threading.Tasks.Task<Microsoft.Rest.Azure.AzureOperationResponse<System.Collections.Generic.IDictionary<string, string>>> GetWithHttpMessagesAsync(string resourceGroupName, string clusterName, string configurationName, System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>> customHeaders = null, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken));

        /// <summary>
        /// Configures the HTTP settings on the specified cluster. This API is
        /// deprecated, please use UpdateGatewaySettings in cluster endpoint instead.
        /// </summary>
        /// <remarks>
        /// Configures the HTTP settings on the specified cluster. This API is
        /// deprecated, please use UpdateGatewaySettings in cluster endpoint instead.
        /// </remarks>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='configurationName'>
        /// The name of the cluster configuration.
        /// </param>
        /// <param name='parameters'>
        /// The cluster configurations.
        /// </param>
        /// <param name='customHeaders'>
        /// The headers that will be added to request.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        /// <exception cref="Microsoft.Rest.Azure.CloudException">
        /// Thrown when the operation returned an invalid status code
        /// </exception>
        System.Threading.Tasks.Task<Microsoft.Rest.Azure.AzureOperationResponse> BeginUpdateWithHttpMessagesAsync(string resourceGroupName, string clusterName, string configurationName, System.Collections.Generic.IDictionary<string, string> parameters, System.Collections.Generic.Dictionary<string, System.Collections.Generic.List<string>> customHeaders = null, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken));

    }
}
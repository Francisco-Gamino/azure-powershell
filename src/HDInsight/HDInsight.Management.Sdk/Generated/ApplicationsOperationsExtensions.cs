// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for license information.
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is regenerated.
namespace Microsoft.Azure.Management.HDInsight
{
    using Microsoft.Rest.Azure;
    using Models;

    /// <summary>
    /// Extension methods for ApplicationsOperations
    /// </summary>
    public static partial class ApplicationsOperationsExtensions
    {
        /// <summary>
        /// Lists all of the applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        public static Microsoft.Rest.Azure.IPage<Application> ListByCluster(this IApplicationsOperations operations, string resourceGroupName, string clusterName)
        {
                return ((IApplicationsOperations)operations).ListByClusterAsync(resourceGroupName, clusterName).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Lists all of the applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<Microsoft.Rest.Azure.IPage<Application>> ListByClusterAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.ListByClusterWithHttpMessagesAsync(resourceGroupName, clusterName, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
        /// <summary>
        /// Gets properties of the specified application.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        public static Application Get(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName)
        {
                return ((IApplicationsOperations)operations).GetAsync(resourceGroupName, clusterName, applicationName).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Gets properties of the specified application.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<Application> GetAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.GetWithHttpMessagesAsync(resourceGroupName, clusterName, applicationName, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
        /// <summary>
        /// Creates applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        public static Application Create(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, Application parameters)
        {
                return ((IApplicationsOperations)operations).CreateAsync(resourceGroupName, clusterName, applicationName, parameters).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Creates applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<Application> CreateAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, Application parameters, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.CreateWithHttpMessagesAsync(resourceGroupName, clusterName, applicationName, parameters, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
        /// <summary>
        /// Deletes the specified application on the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        public static void Delete(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName)
        {
                ((IApplicationsOperations)operations).DeleteAsync(resourceGroupName, clusterName, applicationName).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Deletes the specified application on the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task DeleteAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            (await operations.DeleteWithHttpMessagesAsync(resourceGroupName, clusterName, applicationName, null, cancellationToken).ConfigureAwait(false)).Dispose();
        }
        /// <summary>
        /// Gets the async operation status.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='operationId'>
        /// The long running operation id.
        /// </param>
        public static AsyncOperationResult GetAzureAsyncOperationStatus(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, string operationId)
        {
                return ((IApplicationsOperations)operations).GetAzureAsyncOperationStatusAsync(resourceGroupName, clusterName, applicationName, operationId).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Gets the async operation status.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='operationId'>
        /// The long running operation id.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<AsyncOperationResult> GetAzureAsyncOperationStatusAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, string operationId, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.GetAzureAsyncOperationStatusWithHttpMessagesAsync(resourceGroupName, clusterName, applicationName, operationId, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
        /// <summary>
        /// Creates applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        public static Application BeginCreate(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, Application parameters)
        {
                return ((IApplicationsOperations)operations).BeginCreateAsync(resourceGroupName, clusterName, applicationName, parameters).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Creates applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<Application> BeginCreateAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, Application parameters, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.BeginCreateWithHttpMessagesAsync(resourceGroupName, clusterName, applicationName, parameters, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
        /// <summary>
        /// Deletes the specified application on the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        public static void BeginDelete(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName)
        {
                ((IApplicationsOperations)operations).BeginDeleteAsync(resourceGroupName, clusterName, applicationName).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Deletes the specified application on the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='resourceGroupName'>
        /// The name of the resource group.
        /// </param>
        /// <param name='clusterName'>
        /// The name of the cluster.
        /// </param>
        /// <param name='applicationName'>
        /// The constant value for the application name.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task BeginDeleteAsync(this IApplicationsOperations operations, string resourceGroupName, string clusterName, string applicationName, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            (await operations.BeginDeleteWithHttpMessagesAsync(resourceGroupName, clusterName, applicationName, null, cancellationToken).ConfigureAwait(false)).Dispose();
        }
        /// <summary>
        /// Lists all of the applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='nextPageLink'>
        /// The NextLink from the previous successful call to List operation.
        /// </param>
        public static Microsoft.Rest.Azure.IPage<Application> ListByClusterNext(this IApplicationsOperations operations, string nextPageLink)
        {
                return ((IApplicationsOperations)operations).ListByClusterNextAsync(nextPageLink).GetAwaiter().GetResult();
        }

        /// <summary>
        /// Lists all of the applications for the HDInsight cluster.
        /// </summary>
        /// <param name='operations'>
        /// The operations group for this extension method.
        /// </param>
        /// <param name='nextPageLink'>
        /// The NextLink from the previous successful call to List operation.
        /// </param>
        /// <param name='cancellationToken'>
        /// The cancellation token.
        /// </param>
        public static async System.Threading.Tasks.Task<Microsoft.Rest.Azure.IPage<Application>> ListByClusterNextAsync(this IApplicationsOperations operations, string nextPageLink, System.Threading.CancellationToken cancellationToken = default(System.Threading.CancellationToken))
        {
            using (var _result = await operations.ListByClusterNextWithHttpMessagesAsync(nextPageLink, null, cancellationToken).ConfigureAwait(false))
            {
                return _result.Body;
            }
        }
    }
}

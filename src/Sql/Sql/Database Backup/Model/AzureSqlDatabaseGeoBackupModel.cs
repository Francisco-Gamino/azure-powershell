// ----------------------------------------------------------------------------------
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

using System;
using System.Collections.Generic;

namespace Microsoft.Azure.Commands.Sql.Backup.Model
{
    /// <summary>
    /// Represents an Azure Sql Database geo backup
    /// </summary>
    public class AzureSqlDatabaseGeoBackupModel
    {
        /// <summary>
        /// Gets or sets the name of the resource group
        /// </summary>
        public string ResourceGroupName { get; set; }

        /// <summary>
        /// Gets or sets the name of the server
        /// </summary>
        public string ServerName { get; set; }

        /// <summary>
        /// Gets or sets the name of the database
        /// </summary>
        public string DatabaseName { get; set; }

        /// <summary>
        /// Gets or sets the edition of the backup
        /// </summary>
        public string Edition { get; set; }

        /// <summary>
        /// Gets or sets a unique ID incorporating name and deletion date
        /// </summary>
        public string EntityId { get; set; }

        /// <summary>
        /// Gets or sets UTC time of the last available backup
        /// </summary>
        public DateTime LastAvailableBackupDate { get; set; }

        /// <summary>
        /// Gets or sets the resource ID
        /// </summary>
        public string ResourceId { get; set; }

        /// <summary>
        /// Gets or sets the list of database AKV keys.
        /// </summary>
        public string[] Keys { get; set; }
    }
}

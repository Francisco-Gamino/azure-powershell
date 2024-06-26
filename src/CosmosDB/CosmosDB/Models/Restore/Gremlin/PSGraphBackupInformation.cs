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

using Microsoft.Azure.Management.CosmosDB.Models;

namespace Microsoft.Azure.PowerShell.Cmdlets.CosmosDB.Models.Restore
{
    public class PSGraphBackupInformation
    {
        public PSGraphBackupInformation()
        {
        }

        public PSGraphBackupInformation(BackupInformation backupInformation)
        {
            if (backupInformation == null || backupInformation.ContinuousBackupInformation == null)
                return;

            LatestRestorableTimestamp = backupInformation.ContinuousBackupInformation.LatestRestorableTimestamp;
        }

        //
        // Summary:
        //     Gets latest restorable timestamp.
        public string LatestRestorableTimestamp { get; set; }
    }
}

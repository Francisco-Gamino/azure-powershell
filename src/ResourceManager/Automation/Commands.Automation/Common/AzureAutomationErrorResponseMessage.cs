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

namespace Microsoft.Azure.Commands.Automation.Common
{
    using Newtonsoft.Json;

    /// <summary>
    /// The error response message.
    /// </summary>
    public class AzureAutomationErrorResponseMessage
    {
        // Gets or sets the error code.
        [JsonProperty(Required = Required.Default)]
        public string Code { get; set; }

        // Gets or sets the error message.
        [JsonProperty(Required = Required.Default)]
        public string Message { get; set; }

        // Initializes a new instance of the class.
        public AzureAutomationErrorResponseMessage(string code, string message)
        {
            this.Code = code;
            this.Message = message;
        }
    }
}

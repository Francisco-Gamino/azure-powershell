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

using System;
using Microsoft.Azure.Batch;
using Microsoft.Azure.Commands.Batch.Models;
using Microsoft.Azure.Test;
using Microsoft.WindowsAzure.Commands.ScenarioTest;
using System.Collections.Generic;
using System.Management.Automation;
using Xunit;
using Constants = Microsoft.Azure.Commands.Batch.Utils.Constants;

namespace Microsoft.Azure.Commands.Batch.Test.ScenarioTests
{
    public class ComputeNodeTests : WindowsAzure.Commands.Test.Utilities.Common.RMTestBase
    {
        private const string poolId = ScenarioTestHelpers.SharedPool;
        private const string iaasPoolId = ScenarioTestHelpers.SharedIaasPool;

        [Fact]
        public void TestGetComputeNodeById()
        {
            BatchController controller = BatchController.NewInstance;
            controller.RunPsTest(string.Format("Test-GetComputeNodeById '{0}'", poolId));
        }

        [Fact]
        public void TestListComputeNodesByFilter()
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string state = "idle";
            int matches = 0;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-ListComputeNodesByFilter '{0}' '{1}' '{2}'", poolId, state, matches) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    matches = ScenarioTestHelpers.GetPoolCurrentDedicated(controller, context, poolId);
                },
                null,
                TestUtilities.GetCallingClass(),
                TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestGetAndListComputeNodesWithSelect()
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-GetAndListComputeNodesWithSelect '{0}' '{1}'", poolId, computeNodeId) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId);
                },
                null,
                TestUtilities.GetCallingClass(),
                TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestListComputeNodesWithMaxCount()
        {
            BatchController controller = BatchController.NewInstance;
            int maxCount = 1;
            controller.RunPsTest(string.Format("Test-ListComputeNodesWithMaxCount '{0}' '{1}'", poolId, maxCount));
        }

        [Fact]
        public void TestListAllComputeNodes()
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            int computeNodeCount = 0;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-ListAllComputeNodes '{0}' '{1}'", poolId, computeNodeCount) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeCount = ScenarioTestHelpers.GetPoolCurrentDedicated(controller, context, poolId);
                },
                null,
                TestUtilities.GetCallingClass(),
                TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestListComputeNodePipeline()
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            int computeNodeCount = 0;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-ListComputeNodePipeline '{0}' '{1}'", poolId, computeNodeCount) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeCount = ScenarioTestHelpers.GetPoolCurrentDedicated(controller, context, poolId);
                },
                null,
                TestUtilities.GetCallingClass(),
                TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestRemoveComputeNodeById()
        {
            TestRemoveComputeNode(false, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestRemoveComputeNodePipeline()
        {
            TestRemoveComputeNode(true, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestRemoveMultipleComputeNodes()
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;
            string computeNodeId2 = null;
            int originalDedicated = 3;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-RemoveMultipleComputeNodes '{0}' '{1}' '{2}'", poolId, computeNodeId, computeNodeId2) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    originalDedicated = ScenarioTestHelpers.GetPoolCurrentDedicated(controller, context, poolId);
                    ScenarioTestHelpers.WaitForSteadyPoolAllocation(controller, context, poolId);
                    ScenarioTestHelpers.ResizePool(controller, context, poolId, originalDedicated + 2);
                    ScenarioTestHelpers.WaitForSteadyPoolAllocation(controller, context, poolId);
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId);
                    ScenarioTestHelpers.WaitForIdleComputeNode(controller, context, poolId, computeNodeId);
                    computeNodeId2 = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId, 1);
                    ScenarioTestHelpers.WaitForIdleComputeNode(controller, context, poolId, computeNodeId2);
                },
                null,
                TestUtilities.GetCallingClass(),
                TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestRebootComputeNodeById()
        {
            TestRebootComputeNode(false, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestRebootComputeNodePipeline()
        {
            TestRebootComputeNode(true, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestReimageComputeNodeById()
        {
            TestReimageComputeNode(false, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestReimageComputeNodePipeline()
        {
            TestReimageComputeNode(true, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestDisableAndEnableComputeNodeSchedulingById()
        {
            TestDisableAndEnableComputeNodeScheduling(false, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestDisableAndEnableComputeNodeSchedulingPipeline()
        {
            TestDisableAndEnableComputeNodeScheduling(true, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestGetComputeNodeRemoteLoginSettingsById()
        {
            TestGetComputeNodeRemoteLoginSettings(false, TestUtilities.GetCurrentMethodName());
        }

        [Fact]
        public void TestGetComputeNodeRemoteLoginSettingsPipeline()
        {
            TestGetComputeNodeRemoteLoginSettings(true, TestUtilities.GetCurrentMethodName());
        }

        private void TestRemoveComputeNode(bool usePipeline, string testMethodName)
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;
            int originalDedicated = 3;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-RemoveComputeNode '{0}' '{1}' '{2}'", poolId, computeNodeId, usePipeline ? 1 : 0) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    originalDedicated = ScenarioTestHelpers.GetPoolCurrentDedicated(controller, context, poolId);
                    ScenarioTestHelpers.WaitForSteadyPoolAllocation(controller, context, poolId);
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId);
                    ScenarioTestHelpers.WaitForIdleComputeNode(controller, context, poolId, computeNodeId);
                },
                () =>
                {
                    ScenarioTestHelpers.WaitForSteadyPoolAllocation(controller, context, poolId);
                    ScenarioTestHelpers.ResizePool(controller, context, poolId, originalDedicated);
                },
                TestUtilities.GetCallingClass(),
                testMethodName);
        }

        private void TestRebootComputeNode(bool usePipeline, string testMethodName)
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-RebootComputeNode '{0}' '{1}' '{2}'", poolId, computeNodeId, usePipeline ? 1 : 0) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId);
                    ScenarioTestHelpers.WaitForIdleComputeNode(controller, context, poolId, computeNodeId);
                },
                null,
                TestUtilities.GetCallingClass(),
                testMethodName);
        }

        private void TestReimageComputeNode(bool usePipeline, string testMethodName)
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-ReimageComputeNode '{0}' '{1}' '{2}'", poolId, computeNodeId, usePipeline ? 1 : 0) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId);
                    ScenarioTestHelpers.WaitForIdleComputeNode(controller, context, poolId, computeNodeId);
                },
                null,
                TestUtilities.GetCallingClass(),
                testMethodName);
        }

        private void TestDisableAndEnableComputeNodeScheduling(bool usePipeline, string testMethodName)
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;
            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-DisableAndEnableComputeNodeScheduling '{0}' '{1}' '{2}'", poolId, computeNodeId, usePipeline ? 1 : 0) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, poolId);
                    ScenarioTestHelpers.WaitForIdleComputeNode(controller, context, poolId, computeNodeId);
                },
                null,
                TestUtilities.GetCallingClass(),
                testMethodName);
        }

        private void TestGetComputeNodeRemoteLoginSettings(bool usePipeline, string testMethodName)
        {
            BatchController controller = BatchController.NewInstance;
            BatchAccountContext context = null;
            string computeNodeId = null;

            controller.RunPsTestWorkflow(
                () => { return new string[] { string.Format("Test-GetComputeNodeRemoteLoginSettings '{0}' '{1}' '{2}'", iaasPoolId, computeNodeId, usePipeline ? 1 : 0) }; },
                () =>
                {
                    context = new ScenarioTestContext();
                    computeNodeId = ScenarioTestHelpers.GetComputeNodeId(controller, context, iaasPoolId);
                },
                null,
                TestUtilities.GetCallingClass(),
                testMethodName);
        }
    }
}

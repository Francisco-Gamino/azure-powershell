$TestRecordingFile = Join-Path $PSScriptRoot 'Get-AzFunctionApp.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Get-AzFunctionApp' {
    It 'All' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ByName' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'BySubscriptionId' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ByResourceGroupName' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ByLocation' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

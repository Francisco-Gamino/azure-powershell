$TestRecordingFile = Join-Path $PSScriptRoot 'New-AzFunctionApp.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'New-AzFunctionApp' {
    It 'ByAppServicePlan' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Consumption' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

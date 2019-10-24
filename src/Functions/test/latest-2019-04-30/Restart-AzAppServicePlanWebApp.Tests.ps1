$TestRecordingFile = Join-Path $PSScriptRoot 'Restart-AzAppServicePlanWebApp.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Restart-AzAppServicePlanWebApp' {
    It 'Restart' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'RestartViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

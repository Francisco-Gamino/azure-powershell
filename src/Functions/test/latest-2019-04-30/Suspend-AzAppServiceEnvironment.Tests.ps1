$TestRecordingFile = Join-Path $PSScriptRoot 'Suspend-AzAppServiceEnvironment.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Suspend-AzAppServiceEnvironment' {
    It 'Suspend' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SuspendViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

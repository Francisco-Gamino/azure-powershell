$TestRecordingFile = Join-Path $PSScriptRoot 'Sync-AzWebAppFunctionTriggerSlot.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Sync-AzWebAppFunctionTriggerSlot' {
    It 'Sync' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'SyncViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

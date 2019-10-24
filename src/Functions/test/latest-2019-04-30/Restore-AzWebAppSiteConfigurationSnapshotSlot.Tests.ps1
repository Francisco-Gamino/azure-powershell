$TestRecordingFile = Join-Path $PSScriptRoot 'Restore-AzWebAppSiteConfigurationSnapshotSlot.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Restore-AzWebAppSiteConfigurationSnapshotSlot' {
    It 'Recover' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'RecoverViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

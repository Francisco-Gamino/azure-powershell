$TestRecordingFile = Join-Path $PSScriptRoot 'Backup-AzWebAppSlot.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Backup-AzWebAppSlot' {
    It 'BackupExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'Backup' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'BackupViaIdentityExpanded' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'BackupViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

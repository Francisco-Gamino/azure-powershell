$TestRecordingFile = Join-Path $PSScriptRoot 'Start-AzWebAppTriggeredWebJobSlot.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Start-AzWebAppTriggeredWebJobSlot' {
    It 'Run' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'RunViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

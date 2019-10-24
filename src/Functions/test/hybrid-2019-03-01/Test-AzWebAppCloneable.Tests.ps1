$TestRecordingFile = Join-Path $PSScriptRoot 'Test-AzWebAppCloneable.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Test-AzWebAppCloneable' {
    It 'Is' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'IsViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

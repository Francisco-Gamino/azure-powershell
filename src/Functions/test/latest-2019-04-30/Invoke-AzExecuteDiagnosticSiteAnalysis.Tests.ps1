$TestRecordingFile = Join-Path $PSScriptRoot 'Invoke-AzExecuteDiagnosticSiteAnalysis.Recording.json'
$currentPath = $PSScriptRoot
while(-not $mockingPath) {
    $mockingPath = Get-ChildItem -Path $currentPath -Recurse -Include 'HttpPipelineMocking.ps1' -File
    $currentPath = Split-Path -Path $currentPath -Parent
}
. ($mockingPath | Select-Object -First 1).FullName

Describe 'Invoke-AzExecuteDiagnosticSiteAnalysis' {
    It 'Execute' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }

    It 'ExecuteViaIdentity' {
        { throw [System.NotImplementedException] } | Should -Not -Throw
    }
}

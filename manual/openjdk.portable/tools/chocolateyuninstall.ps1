if (Test-ProcessAdminRights) {
    $pathType = 'Machine'
} else {
    $pathType = 'User'
}
Uninstall-ChocolateyEnvironmentVariable -VariableName 'JAVA_HOME' -VariableType $pathType

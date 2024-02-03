# Initialize an empty array to store the initial state of the UDP endpoints
$initialEndpoints = @()

while ($true) {
    # Retrieve the current state of the UDP endpoints
    $currentEndpoints = Get-NetUDPEndpoint

    # Compare the current state with the initial state
    foreach ($endpoint in $currentEndpoints) {
        if ($initialEndpoints -notcontains $endpoint) {
            # A new UDP endpoint is detected
            Write-Output "New UDP endpoint detected:"
            Write-Output "Local Address: $($endpoint.LocalAddress)"
            Write-Output "Local Port: $($endpoint.LocalPort)"
            Write-Output "--------------------------------------"
        }
    }

    # Update the initial state with the current state
    $initialEndpoints = $currentEndpoints

    # Wait for 5 seconds before checking again
    Start-Sleep -Seconds 5
}

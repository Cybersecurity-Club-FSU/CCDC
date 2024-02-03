# Initialize an empty array to store the initial state of the TCP connections
$initialConnections = @()

while ($true) {
    # Retrieve the current state of the TCP connections
    $currentConnections = Get-NetTCPConnection

    # Compare the current state with the initial state
    foreach ($connection in $currentConnections) {
        if ($initialConnections -notcontains $connection) {
            # A new connection is detected
            Write-Output "New connection detected:"
            Write-Output "Local Address: $($connection.LocalAddress)"
            Write-Output "Local Port: $($connection.LocalPort)"
            Write-Output "Remote Address: $($connection.RemoteAddress)"
            Write-Output "Remote Port: $($connection.RemotePort)"
            Write-Output "State: $($connection.State)"
            Write-Output "--------------------------------------"
        }
    }

    # Update the initial state with the current state
    $initialConnections = $currentConnections

    # Wait for 5 seconds before checking again
    Start-Sleep -Seconds 5
}

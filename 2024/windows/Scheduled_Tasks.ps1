while($true) {
    Start-Sleep -Seconds 30

    $tasks = Get-ScheduledTask

    foreach($task in $tasks) {
        $info = Get-ScheduledTaskInfo -InputObject $task

        if($info.State -eq 'Running') {
            Stop-ScheduledTask -TaskName $task.TaskName

            $message = "The task '$($task.TaskName)' was running and has been stopped."
            Add-Content -Path "C:\TasksReport.txt" -Value $message

            # Uncomment the following lines to send an email instead of writing to a text file
            # Send-MailMessage -To "youremail@example.com" -From "youremail@example.com" -Subject "Task Stopped" -Body 			$message -SmtpServer "your.smtp.server"
        }
    }
}
<#
This script will run indefinitely, checking the status of all scheduled tasks every 30 seconds. If it finds a task that is currently running, it will stop the task and write a message to a text file at C:\TasksReport.txt. If you want to send an email instead, you can uncomment the Send-MailMessage line and fill in the appropriate fields.

Please note that this script needs to be run with administrative privileges to access and control scheduled tasks. Also, replace "your.smtp.server" with your SMTP server details.
#>
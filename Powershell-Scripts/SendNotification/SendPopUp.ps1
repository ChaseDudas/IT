$name = read-host "Enter computer name "
$msg = read-host "Enter your message "
Invoke-WmiMethod -Path Win32_Process -Name Create -ArgumentList "msg * $msg" -ComputerName $name
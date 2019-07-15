function Get-ADPSystemInfo
{
    <#
    .SYNOPSIS
    Retrieves key system version and model info from one to ten computers
    .DESCRIPTION
    Get-ADprofiles uses WMI to retrieve info from 1 to 10 computers.
    Specify by name or IP address
    .PARAMETER ComputerName
    Computer's name or IP address, up to 10
    .PARAMETER LogErrors
    Specify this switch to create a text log file of computers that could not be queried
    .PARAMETER ErrorLog
    Specifies the file path and name to which failed computer names will be written. Default: c:\Retry.txt
    .EXAMPLE
    Get-Content names.txt | Get-ADPSystemInfo
    .EXAMPLE
    Get-ADPSystemInfo -ComputerName SERVER1, SERVER2
    #>

    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$True,
        ValueFromPipeline = $True,
        HelpMessage="Computer name or IP address")]
        [ValidateCount(1,10)]
        [Alias('hostname')]
        [string[]]$ComputerName,

        [string]$ErrorLog = 'c:\retry.txt',

        [switch]$LogErrors
    )
    BEGIN
    {
        Write-Verbose "Error log will be $ErrorLog"
    }
    PROCESS
    {
        Write-Verbose "Beggining process block"
        foreach($computer in $computername)
        {
            Write-Verbose "Querying $computer"
            Try
            {
                $everything_ok = $true
                $os = Get-WmiObject -class Win32_OperatingSystem`
                -computerName $computer`
                -erroraction Stop
            }
            Catch
            {
                $everything_ok = $false
                Write-Warning "$computer failed"
                if($LogErrors)
                {
                    $computer | Out-File $ErrorLog -Append
                    Write-Warning "Logged to $ErrorLog"
                }
            }
            if($everything_ok)
            {
                $os = Get-WmiObject -class Win32_OperatingSystem -computerName $computer
                $comp = Get-WmiObject -class Win32_ComputerSystem -computerName $computer
                $bios = Get-WmiObject -class Win32_BIOS -computerName $computer
                $props = @{ 'ComputerName' = $computer;
                'OSVersion' = $os.version;
                'SPVersion' = $os.servicepackmakorversion;
                'BIOSSerial' = $bios.serialnumber;
                'Manufactuer' = $comp.manufactuer;
                'Model' = $comp.model}
                Write-Verbose "WMI queries complete"
                $obj = New-Object -TypeName PSObject -Property $props
                $obj.PSObject.TypeNames.Insert(0, 'MOL.SystemInfo')
                Write-Output $obj
            }
        }
    }
    END
    {

    }
}
Get-ADPSystemInfo -ComputerName localhost | Get-Member

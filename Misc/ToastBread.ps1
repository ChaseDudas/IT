function ToastBread
{
    [CmdletBinding(
        SupportsShouldProcess = $true,
        ConfirmImpact = "High",
        DefaultParameterSetName = "",
        HelpURI = "https:\\google.com",
        SupportsPaging = $false,
        PositionalBinding = $true)]
    Param([Boolean]$Toasted)

    Process
    {
        if($pscmdlet.ShouldProcess($Toasted)) #{"on"}
        {
            Write-Host "A figure prepares its offering for the toaster `n"
            Sleep 5
            Write-Host "*crisp sizling* The figure remarks how fast the bread is turning `n"
            Sleep 5
            Write-Host "It cheers the bread on as it scorches its firm fibers `n"
            Sleep 5
            Write-Host "Demonicly, the figure begins to sing: Bread Bread Cant you seeee    youre the best in my tummyyyyyyyy `n"
            Sleep 5
            Write-Host "*Bing* The toaster presents its offering `n"
            Sleep 5
            Write-Host "The outline drops from the celing to recieve the toasters gracious offering `n"
            Sleep 5
            Write-Host "The figure becomes submissive to the toast `n"
            Sleep 5
            Write-Host "OWowoowowoososos...The figure screams `n"
            Sleep 5
            Write-Host "The bread lords are pleased `n"
            Sleep 5
            Write-Host "*shwizle boop bap* And the pringles man disappears into thin air. `n"
            Sleep 5
        }
        else #{"off"}
        {
            Write-Host " A figure stares at a flimsy piece of bread `n"
        }
    }
}

ToastBread -Toasted $false
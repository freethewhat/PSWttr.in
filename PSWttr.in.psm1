<#
.SYNOPSIS
    Returns weather report information.
.DESCRIPTION
    Console-oriented weather forecast the returns weather information for specified paremeters
.EXAMPLE
    Get-Weather

    Returns full weather information based on the lcoation of you IP with all defaults.
.EXAMPLE
    Get-Weather -City 'Missoula'

    Returns the full weather information for the city of Missoula.
.PARAMETER City
    The city you would like to get the weather from. If not specified the city of your IP is used.
.PARAMETER Units
    Units to display metric vs United States customary units.
.PARAMETER Narrow
    Narrow version (Only displays day and night)
.PARAMETER Forcast
    The amount of days you would like to forcast.

    0 - Current weather
    1 - Current weather + Today's Forecast
    3 - Current weather + today's forecast, and tomorrow's forecast
.OUTPUTS
    System.String
.NOTES
    https://freethewhat.github.com
#>
function Get-Weather {
    [CmdletBinding()]
    param (
        [string]
        $City,

        [ValidateSet('Metric', 'USCS')]
        [string]
        $Units = "USCS",

        [switch]
        $Short,

        [switch]
        $Narrow,

        [ValidateSet(0, 1, 2, 4, 5, 6)]
        [string]
        $Forecast
    )

    $uri = 'https://wttr.in/'

    if ($City) {
        $uri += "$City"
    }

    switch ($Units) {
        'Metric' {
            $uri += "?m"
        }
        'USCS' {
            $uri += "?u"
        }
    }

    if ($Short) {
        $uri += "&format=4"
    }

    if($Narrow) {
        $uri += "&n"
    }

    if($Forecast) {
        $uri += "&$Forecast"
    }

    $uri += "&F"

    Write-Verbose "URI: $uri"
    Write-Verbose -Message "Getting weather from $uri"

    try {
        $invokeRestMethodSplat = @{
            Uri = $uri
            ErrorAction = 'Stop'
        }
        $weather = Invoke-RestMethod @invokeRestMethodSplat
    }
    catch {
        Write-Error $_
    }

    return $weather
}

Export-ModuleMember -Function Get-Weather
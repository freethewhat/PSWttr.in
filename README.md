# PSWttr.in

This is a module that will interface with the http://wttr.in api interface and display the weather forecast on PowerShell.

## Installation

To install please download the package and extract it in your PowerShell modules folder. I have plans to make this available in the PowerShell Gallery in the near future.

## Usage

Get weather using your current IP Address Information.
```Powershell
Get-Weather
```
Get weather for a specific location in metric.
```Powershell
Get-Weather -City 'London' -Units Metric
```

## Contributing

Feel free to put in a PR if you add a feature. If you have any feature requests please let me know in the issues, and I can look at adding them.
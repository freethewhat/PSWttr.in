# PSWttr.in

This is a module that will interface with the http://wttr.in api and display the weather forecast on PowerShell.

## Installation

This package is hosted on the [Powershell Gallery](https://www.powershellgallery.com/packages/PSWttr.in/0.0.1) and can be installed using powershell.

```Powershell
Install-Module -Name PSWttr.in
```

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
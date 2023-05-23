# EPP
https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows

```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```

| # | Configuration Name |
| :-- | :-- |
| 1 | Real-time protection |
| 2 | Cloud protection |

# EPP
https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows

```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```

| # | Configuration Name | memo |
| :-- | :-- | :-- | 
| 1 | Real-time protection | - Turn on real-time protection <br> - Turn on behavior monitoring <br> - Scan all downloaded files and attachments .... etc |
| 2 | Cloud protection | ***Block at first sight*** <br> - Turn on cloud-delivered protection <br> - Cloud-delivered protection level <br> - Defender cloud extended timeout in seconds |
| 3 | Submit Samples Consent | ***Block at first sight*** |
| 4 | PUA Protection |
| 5 | Tamper Protection | 

# EPP
https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows

```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```

| # | Configuration Name | memo |
| :-- | :-- | :-- | 
| 1 | Real-time protection | - Turn on real-time protection <br> - Turn on behavior monitoring <br> - Scan all downloaded files and attachments .... etc |
| 2 | Cloud protection | ***Block at first sight*** <br> - Turn on cloud-delivered protection <br> - Cloud-delivered protection level <br> - Defender cloud extended timeout in seconds <br> - Submit Samples Consent |
| 3 | Submit Samples Consent |  |
| 4 | PUA Protection |
| 5 | Tamper Protection | 
| 6 | Scan type - Quick scan |
| 7 | Security intelligence updates |
| 8 | Antivirus network connections|

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/b9b85c50-abdd-431c-a762-333482ee702f)

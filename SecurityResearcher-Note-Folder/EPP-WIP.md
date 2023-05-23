# Microsoft Defender Antivirus config ?



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

#### KQL - confirm antivirus configuration
```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```
[DeviceTvmSecureConfigurationAssessmentKB table in the advanced hunting schema](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-devicetvmsecureconfigurationassessmentkb-table?view=o365-worldwide)

#### Reference
[Windows Antivirus policy settings for Microsoft Defender Antivirus for Intune](https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows)



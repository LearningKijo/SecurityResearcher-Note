# Microsoft Defender Antivirus config ?


## Recommendations & Tips (consideration)
| # | Configuration Name | Comment |
| :-- | :-- | :-- | 
| 1 | Real-time protection | Recommend turning on real-time protection. |
| 2 | Cloud protection | Recommend turning on cloud protection. <br> - [Block at First Sight(BAFS)](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-block-at-first-sight-microsoft-defender-antivirus?view=o365-worldwide) |
| 3 | Sample submission | Recommend turning on submit samples consent. <br> - prerequisite for using BAFS |
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



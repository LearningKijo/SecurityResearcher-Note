# Microsoft Defender Antivirus config ?


## Recommendations & Tips (consideration)
| # | Configuration Name | Comment |
| :-- | :-- | :-- | 
| 1 | Real-time protection | Recommend turning on real-time protection. |
| 2 | Cloud protection | Recommend turning on cloud protection. <br> - [Block at First Sight(BAFS)](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-block-at-first-sight-microsoft-defender-antivirus?view=o365-worldwide) |
| 3 | Sample submission | Recommend turning on submit samples consent. <br> - prerequisite for using BAFS |
| 4 | PUA Protection | Recommend turning on PUA Protection.
| 5 | Tamper Protection | Highly recommend turning on Tamper Protection and here are some blogs that discuss this feature. <br> - [Make sure Tamper Protection is turned on](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/make-sure-tamper-protection-is-turned-on/ba-p/2695568) <br> - [Hunting down LemonDuck and LemonCat attacks](https://www.microsoft.com/en-us/security/blog/2021/07/29/when-coin-miners-evolve-part-2-hunting-down-lemonduck-and-lemoncat-attacks/) |
| 6 | Scan type - Quick scan | In most cases, a quick scan is sufficient and is the recommended option for scheduled scans. <br> - [Schedule regular quick and full scans with Microsoft Defender Antivirus](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/schedule-antivirus-scans?view=o365-worldwide)|
| 7 | Security intelligence updates |
| 8 | Antivirus network connections|

#### KQL - confirm antivirus configuration
```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```
[DeviceTvmSecureConfigurationAssessmentKB table in the advanced hunting schema](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-devicetvmsecureconfigurationassessmentkb-table?view=o365-worldwide)

## Microsoft Defender Antivirus engines
![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/da052b9d-cf65-47da-9727-eff144aff868)
> Defender Antivirus engines - [In hot pursuit of elusive threats: AI-driven behavior-based blocking stops attacks in their tracks](https://www.microsoft.com/en-us/security/blog/2019/10/08/in-hot-pursuit-of-elusive-threats-ai-driven-behavior-based-blocking-stops-attacks-in-their-tracks/) 


#### Reference
[Windows Antivirus policy settings for Microsoft Defender Antivirus for Intune](https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows)



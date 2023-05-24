# Microsoft Defender Antivirus config ?

#### Microsoft Defender Antivirus engines
![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/da052b9d-cf65-47da-9727-eff144aff868)
> Defender Antivirus engines - [In hot pursuit of elusive threats: AI-driven behavior-based blocking stops attacks in their tracks](https://www.microsoft.com/en-us/security/blog/2019/10/08/in-hot-pursuit-of-elusive-threats-ai-driven-behavior-based-blocking-stops-attacks-in-their-tracks/) 

## Recommendations & Tips (consideration)
#### Recommendations
| # | Configuration Name | Comment |
| :-- | :-- | :-- | 
| 1 | Real-time protection | Recommend turning on real-time protection. |
| 2 | Cloud protection | Recommend turning on cloud protection. <br> - [Block at First Sight(BAFS)](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-block-at-first-sight-microsoft-defender-antivirus?view=o365-worldwide) |
| 3 | Sample submission | Recommend turning on submit samples consent - it's a prerequisite for using BAFS. |
| 4 | PUA Protection | Recommend turning on PUA Protection.
| 5 | Tamper Protection | Highly recommend turning on Tamper Protection and here are some blogs that discuss this feature. <br> - [Make sure Tamper Protection is turned on](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/make-sure-tamper-protection-is-turned-on/ba-p/2695568) <br> - [Hunting down LemonDuck and LemonCat attacks](https://www.microsoft.com/en-us/security/blog/2021/07/29/when-coin-miners-evolve-part-2-hunting-down-lemonduck-and-lemoncat-attacks/) |

#### Tips (consideration)
| # | Configuration Name | Comment |
| :-- | :-- | :-- | 
| 6 | Scan type - Quick scan | In most cases, a quick scan is sufficient and is the recommended option for scheduled scans. <br> - [Schedule regular quick and full scans with Microsoft Defender Antivirus](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/schedule-antivirus-scans?view=o365-worldwide)|
| 7 | Antivirus protection updates |Keeping your antivirus protection up to date is critical - Fallback order. <br> - [Manage the sources for Microsoft Defender Antivirus protection updates](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/manage-protection-updates-microsoft-defender-antivirus?view=o365-worldwide)<br> - [Microsoft Defender Antivirus updates - Previous versions for technical upgrade support](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/msda-updates-previous-versions-technical-upgrade-support?view=o365-worldwide) |
| 8 | Antivirus network connections | To ensure Microsoft Defender Antivirus cloud-delivered protection works properly, your security team must configure your network to allow connections between your endpoints and certain Microsoft servers. <br> - [Configure and validate Microsoft Defender Antivirus network connections](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-network-connections-microsoft-defender-antivirus?view=o365-worldwide) | 

#### Antivirus misconfiguration and vulnerable configuration
By filtering antivirus in TVM and MDE, you can identify any antivirus misconfigurations and vulnerable configurations in your tenant. 
Using KQL with Advanced Hunting, you can also identify these configurations by using the following KQL query.

```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```
[DeviceTvmSecureConfigurationAssessmentKB table in the advanced hunting schema](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-devicetvmsecureconfigurationassessmentkb-table?view=o365-worldwide)



#### Reference
[Windows Antivirus policy settings for Microsoft Defender Antivirus for Intune](https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows)



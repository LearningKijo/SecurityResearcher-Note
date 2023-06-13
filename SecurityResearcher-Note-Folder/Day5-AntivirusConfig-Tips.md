# Day5 - Microsoft Defender Antivirus - Recommendations & Tips
Firstly, Microsoft Defender Antivirus is not just EPP which is designed to only prevent known threats. It includes various feature engines to detect and protect against threats in both **pre-execution and post-execution stages**.
In this blog, I would like to share recommended configurations and tips for Microsoft Defender Antivirus. I hope that these insights will be helpful for configuring the antivirus in the future.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/da052b9d-cf65-47da-9727-eff144aff868)
> Defender Antivirus engines - [In hot pursuit of elusive threats: AI-driven behavior-based blocking stops attacks in their tracks](https://www.microsoft.com/en-us/security/blog/2019/10/08/in-hot-pursuit-of-elusive-threats-ai-driven-behavior-based-blocking-stops-attacks-in-their-tracks/) 

## Recommendations & Tips (consideration)
Regarding Microsoft Defender Antivirus(MDAV) configuration, there is **no one-size-fits-all recommendation** due to the evolving nature of cyber attacks. 
However, there are certain features that ***you should enable and consider when deploying MDAV solution.***

This is the great example story I received from a senior colleague whom I deeply respect. When the air conditioner is turned on, everyone has a different comfort level in terms of temperature. This means that the preferred temperature can vary among individuals, ranging from 18°C to 28°C, or even higher. Therefore, in the context of antivirus configuration, while there are certain features that are generally recommended to enable for MDAV, the specific settings, such as scan time, day, update frequency, and others, can vary depending on the organization's needs and business requirements.

#### Recommendations
| # | Configuration Name | Comment |
| :-- | :-- | :-- | 
| 1 | Real-time protection | Recommend turning on real-time protection. |
| 2 | Cloud protection | Recommend turning on cloud protection.<br> - [Block at First Sight(BAFS)](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-block-at-first-sight-microsoft-defender-antivirus?view=o365-worldwide) |
| 3 | Sample submission | Recommend turning on submit samples consent. <br>  Since it's a prerequisite for using BAFS, you need to select one of the options below: <br> - ***Send safe samples automatically (default)*** <br> - Always Prompt  <br> - Send all samples automatically|
| 4 | PUA Protection | Recommend turning on PUA Protection.
| 5 | Tamper Protection | Highly recommend turning on Tamper Protection and here are some blogs that discuss this feature. <br> - [Make sure Tamper Protection is turned on](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/make-sure-tamper-protection-is-turned-on/ba-p/2695568) <br> - [Hunting down LemonDuck and LemonCat attacks](https://www.microsoft.com/en-us/security/blog/2021/07/29/when-coin-miners-evolve-part-2-hunting-down-lemonduck-and-lemoncat-attacks/) |

#### Tips (consideration)
| # | Configuration Name | Comment |
| :-- | :-- | :-- | 
| 6 | Scan type  | In most cases, **a quick scan** is sufficient and is the recommended option for scheduled scans. <br> - [Schedule regular quick and full scans with Microsoft Defender Antivirus](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/schedule-antivirus-scans?view=o365-worldwide)|
| 7 | Antivirus protection updates |Keeping your antivirus protection up to date is critical - Fallback order. <br> - [Manage the sources for Microsoft Defender Antivirus protection updates](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/manage-protection-updates-microsoft-defender-antivirus?view=o365-worldwide)<br> - [Microsoft Defender Antivirus updates - Previous versions for technical upgrade support](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/msda-updates-previous-versions-technical-upgrade-support?view=o365-worldwide) |
| 8 | Antivirus network connections | To ensure Microsoft Defender Antivirus cloud-delivered protection works properly, your security team must configure your network to allow connections between your endpoints and certain Microsoft servers. <br> - [Configure and validate Microsoft Defender Antivirus network connections](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-network-connections-microsoft-defender-antivirus?view=o365-worldwide) | 

#### Antivirus misconfiguration and vulnerable configuration
By filtering antivirus in Microsoft Defender Vulnerability Management, MDE, you can identify any antivirus misconfigurations and vulnerable configurations in your tenant. 
Using KQL with Advanced Hunting, you can also identify these configurations by using the following KQL query.

```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```

- [What is Microsoft Defender Vulnerability Management](https://learn.microsoft.com/en-us/microsoft-365/security/defender-vulnerability-management/defender-vulnerability-management?view=o365-worldwide)
- [DeviceTvmSecureConfigurationAssessmentKB table in the advanced hunting schema](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-devicetvmsecureconfigurationassessmentkb-table?view=o365-worldwide)


## Note
#### Cloud block timeout period
According to [Microsoft docs](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-cloud-block-timeout-period-microsoft-defender-antivirus?view=o365-worldwide), when Microsoft Defender Antivirus finds a suspicious file, it can prevent the file from running while it queries the Microsoft Defender Antivirus cloud service. The default period that the file is blocked is 10 seconds. That sounds great but cloud block timeout period can potentially impact files or programs that require more time to complete their operations. In such cases, if the file or program exceeds the maximum timeout of 60 seconds, it may be interrupted or prevented from executing, which could lead to functionality issues. Therefore, generally speaking, ***a 10-second timeout is recommended***.

#### CPU performance
If you have any concerns about CPU performance, please check the following parameters:
 
1. ***CPU usage limit per scan (CSP: AvgCPULoadFactor)*** <br>
This policy setting allows you to configure the maximum percentage CPU utilization permitted during a scan. The default value is 50.
2. ***Use low CPU priority for scheduled scans (CSP: EnableLowCPUPriority)***<br>
This policy setting allows you to enable or disable low CPU priority for scheduled scans.

#### Exclusions
If you have any concerns regarding Windows Server or misconfigurations related to exclusions, these documents can be helpful. In particular, they provide well-written guidance on paths, extensions, and processes that are ***Not recommended to be excluded due to the potential for attacks.***
1. [Configure Microsoft Defender Antivirus exclusions on Windows Server](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/configure-server-exclusions-microsoft-defender-antivirus?view=o365-worldwide)
2. [Common mistakes to avoid when defining exclusions](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/common-exclusion-mistakes-microsoft-defender-antivirus?view=o365-worldwide)



## Reference
1. [Defender Policy CSP - Windows Client Management](https://learn.microsoft.com/en-us/windows/client-management/mdm/policy-csp-defender?WT.mc_id=Portal-fx)
2. [Windows Antivirus policy settings for Microsoft Defender Antivirus for Intune](https://learn.microsoft.com/en-us/mem/intune/protect/antivirus-microsoft-defender-settings-windows)
3. [MDE Antivirus Configuration Common Mistakes and Best Practice](https://techcommunity.microsoft.com/t5/core-infrastructure-and-security/mde-antivirus-configuration-common-mistakes-and-best-practice/ba-p/2127405)
4. [In hot pursuit of elusive threats: AI-driven behavior-based blocking stops attacks in their tracks](https://www.microsoft.com/en-us/security/blog/2019/10/08/in-hot-pursuit-of-elusive-threats-ai-driven-behavior-based-blocking-stops-attacks-in-their-tracks/)
5. [Inside out: Get to know the advanced technologies at the core of Microsoft Defender ATP next generation protection](https://www.microsoft.com/en-us/security/blog/2019/06/24/inside-out-get-to-know-the-advanced-technologies-at-the-core-of-microsoft-defender-atp-next-generation-protection/)
6. [How artificial intelligence stopped an Emotet outbreak](https://www.microsoft.com/en-us/security/blog/2018/02/14/how-artificial-intelligence-stopped-an-emotet-outbreak/)
7. [Out of sight but not invisible: Defeating fileless malware with behavior monitoring, AMSI, and next-gen AV](https://www.microsoft.com/en-us/security/blog/2018/09/27/out-of-sight-but-not-invisible-defeating-fileless-malware-with-behavior-monitoring-amsi-and-next-gen-av/)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.



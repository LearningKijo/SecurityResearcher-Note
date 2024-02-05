# XDR Insights, Microsoft Security in 2024
[Date : 2024-02-05]

Hello, all defenders !! Thank you for visiting security research note. 
As we have seen a number of updates about XDR at Microsoft Ignite last year, at this time, I would like to introduce new features and share insights about XDR, specifically what we can do by leveraging these powerful tools.

By the way, this is the updated XDR blog. If you want to see the previous one, you can also check here.

👉 [Day09-XDR-Insights-part1.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day09-XDR-Insights-part1.md)

Before we delve deeper into XDR... for those who are hearing this term for the first time, 

> [!Important]
> **What is XDR ?**
> 
> Extended Detection and Response (XDR) describes ***a unified security incident detection and response platform that automatically collects and correlates data from multiple proprietary security components***,
as recognized by Gartner® Innovation Insight for Extended Detection and Response.

#### Microsoft Defender XDR ?
Microsoft Security provides XDR solution – ***Microsoft Defender XDR*** (formerly Microsoft 365 Defender). To avoid any confusion for those familiar with Microsoft 365 Defender, let me take a moment to explain its history and provide the latest update.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/ac502e17-c76e-4531-bda4-c48f1304c9a5)
> Microsoft Security with XDR solution

## Gartner® Magic Quadrant™
Recently, Microsoft announced a blog about the market research results for Endpoint Protection (including XDR)[^1] - naming it ***Leader position*** again. 
As shown in the results over the past three years, Microsoft has consistently maintained its position as a Leader[^2][^3].

[^1]: [Microsoft is named a Leader in the 2023 Gartner® Magic Quadrant™ for Endpoint Protection Platforms](https://www.microsoft.com/en-us/security/blog/2024/01/12/microsoft-is-named-a-leader-in-the-2023-gartner-magic-quadrant-for-endpoint-protection-platforms/)
[^2]: [Gartner names Microsoft a Leader in the 2021 Endpoint Protection Platforms Magic Quadrant](https://www.microsoft.com/en-us/security/blog/2021/05/11/gartner-names-microsoft-a-leader-in-the-2021-endpoint-protection-platforms-magic-quadrant/)
[^3]: [Microsoft is named a Leader in the 2022 Gartner® Magic Quadrant™ for Endpoint Protection Platforms](https://www.microsoft.com/en-us/security/blog/2023/03/02/microsoft-is-named-a-leader-in-the-2022-gartner-magic-quadrant-for-endpoint-protection-platforms/)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/433e2d01-c8bc-4e23-8596-fe2c54ece314)

> Gartner® Magic Quadrant™ 2021 - 2023

## Combined incidents queue, XDR
Thanks to the power of XDR, Microsoft Defender XDR incidents continuously provide excellent correlation capabilities, consolidating multiple Defender alerts and all affected entities into a cohesive view - ***a single unified incident***. 
The update to the XDR, especially in the incident section, is as follows: 
Last year, Microsoft announced at Ignite that Microsoft Defender XDR would incorporate cloud workload alerts, signals, and asset information from Microsoft Defender for Cloud[^4]. Now, as of January 2024, this integration is ***generally available***.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/31ad8d4d-946a-4860-8fe9-1f41183f325e)
> Detection of cryptojacking in Microsoft Defender XDR

> [!Important]
> **(GA)** Microsoft Defender for Cloud alerts integration with Microsoft Defender XDR is ***now generally available*** - [January 2024](https://learn.microsoft.com/en-us/microsoft-365/security/defender/whats-new?view=o365-worldwide#january-2024).
> Learn more about the integration in Microsoft Defender for Cloud in Microsoft Defender XDR. 

[^4]: [Ignite news: XDR in an era of end-user-to-cloud cyberattacks and securing the use of AI](https://techcommunity.microsoft.com/t5/microsoft-defender-xdr-blog/ignite-news-xdr-in-an-era-of-end-user-to-cloud-cyberattacks-and/ba-p/3982002)

## Automatic attack disruption
Automatic attack disruption in Microsoft Defender XDR uses XDR signals from different sources (endpoints, email, identity, data) to ***automatically contain compromised assets and stop ongoing cyber attacks, minimizing their impact on organizations***.

> [!Note]
> What is the objective of attack disruption? - 
> The main objective of this feature is to achieve ***containment*** during the incident response phase. In terms of automatic disruption, there are three actions that can be taken:
> | Source                          | Action                           |
> |:--------------------------------|:---------------------------------|
> | Microsoft Defender for Identity | - [Disable user in Active Directory](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions) |
> | Microsoft Defender for Endpoint | - [Contain devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#contain-devices-from-the-network) <br> - [Contain user from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#contain-user-from-the-network) - ***(NEW ACTION)*** |

Microsoft Defender XDR provides coverage for the following three advanced attacks to disrupt further progression.

| Advanced attack | Microsoft Security blog |
|:----------------|:------------------------|
| Adversary-in-the-middle attacks (AiTM) | [Automatically disrupt adversary-in-the-middle (AiTM) attacks with XDR](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatically-disrupt-adversary-in-the-middle-aitm-attacks-with/ba-p/3821751)| 
| Business email compromise (BEC) | [XDR attack disruption in action – Defending against a recent BEC attack](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/xdr-attack-disruption-in-action-defending-against-a-recent-bec/ba-p/3749822) | 
| Human-operated ransomware attacks | [Automatic disruption of Ransomware and BEC attacks with Microsoft 365 Defender](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatic-disruption-of-ransomware-and-bec-attacks-with/ba-p/3738294) | 
| SAP financial process manipulation ***(NEW)*** | [Gaining control of SAP applications security and automatic attack disruption](https://www.youtube.com/live/-ijnGxRnwks?si=wcoSa2LHFGJlhW9G) | 

As there have been various SAP-related breaches during Covid-19, and it's quite challenging to identify them without correlation with other product signals, the SAP connector was released in Microsoft Sentinel[^5]. 
This helps in visualizing SAP activities and detection, providing out-of-the-box detection as well as customizable detection for SOC personnel.
***Additionally, SAP financial process manipulation has been added to scenarios in Automatic Attack Disruption in Microsoft Defender XDR !!***

> [!Important]
> SAP financial process manipulation is currently in private preview.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/89880caa-474f-4df7-8ba0-5f5c3d1bff66)
> SAP financial process manipulation, Incident page in Microsoft Defender XDR

[^5]: [Protecting your SAP environment from threats | Microsoft Sentinel in the Field #8](https://youtu.be/Yhc8vtiU0bo?si=uyDysgDjdTtmCKce)

## Deception
Deception is a new capability in XDR, and personally, the Ignite event left me both confused and pleasantly surprised. 
Deception's objective is to deceive someone, and in this case, the target is an attacker. However, this is not only to deceive them but specifically to ***visualize the attacker's footprint***. 
Microsoft Defender XDR achieves this by creating ***fake accounts, devices, and content strategically designed to entice and provoke, providing insights into the attacker's actions.***

To do the deception, "decoys" and "lures" are super important....

***What are decoys and lures ?....***
|  Type  | Details  |
|:-------|:---------|
| Decoys | These are ***fake devices and accounts*** that appear to belong to your network. When an attacker engages with decoys, alerts will be generated, and you will be able to see the activities in the Incident page of the Microsoft Defender XDR portal. | 
| Lures | These are ***fake contents, such as documents and batch files***, strategically planted on specific devices or accounts to attract an attacker. |

**👉 These are great resources to catch up on deception features.**
1. [Manage the deception capability in Microsoft Defender XDR](https://learn.microsoft.com/en-us/microsoft-365/security/defender/deception-overview?view=o365-worldwide)
2. [Ignite News: Augment your EDR with deception tactics to catch adversaries early](https://techcommunity.microsoft.com/t5/microsoft-defender-for-endpoint/ignite-news-augment-your-edr-with-deception-tactics-to-catch/ba-p/3982253)
3. [Virtual Ninja Training : Microsoft Defender for Endpoint deception](https://www.youtube.com/live/k2QxyVH--vU?si=_UT46YWTDPS6wyTZ)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/b4a0b1f9-1d32-49ad-a79f-9ef6f8cdd625)
> Deception technology, through high confidence detections of human-operated lateral movement, alerts security teams when an attacker interacts with fake hosts or lure

##  Security Copilot
We have been seeing a number of updates and enhancements regarding Microsoft Defender XDR, and additionally, Microsoft Security Copilot is coming soon. 
What I can say is only this is a ***game-changer***.

At first, there are two different experiences you will see in Security Copilot.
- [x] **Standalone** : This includes experiences such as asking questions across security products in the Security Copilot portal.
- [x] **Embedded** : This is literally Security Copilot embedded into the Microsoft Defender XDR portal, and security teams can leverage this for dealing with day-to-day security incidents and responses.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/58a7b75e-909d-4f0e-9529-44db2773e440)
> Security Copilot : Standalone & Embedded
> 
> 👉 Check this out !! [Microsoft Security Copilot drives new product integrations at Microsoft Ignite to empower security and IT teams](https://www.microsoft.com/en-us/security/blog/2023/12/06/microsoft-security-copilot-drives-new-product-integrations-at-microsoft-ignite-to-empower-security-and-it-teams/)

 Here are some things you can leverage Microsoft Security Copilot !!
1.  Summarize incidents quickly
2.  Take action on incidents through guided responses
3.  Get results fast when analyzing scripts and codes
4.  Generate KQL queries from natural-language input
5.  Write incident reports efficiently

For more details, you can explore several resources to understand how Security Copilot works. However, I would like to emphasize the following five points that highlight how our SOC world is changing, as I mentioned – **"truly a game-changer"**.

***Before Security Copilot.....***

1. The SOC team has triaged an incident and identified what is happening across multiple domains, including email, endpoint, identity, data, and more.
   ***Now, Security Copilot helps us understand incidents right away without spending additional time[^6].***

2. The SOC team investigates incidents and makes decisions for each asset based on the type of attacks.
   Sometimes, this can be challenging. However, Security Copilot helps by ***suggesting recommendations such as Triage, Containment, Investigation, and Remediation for each specific attack[^7]***.

3. The SOC team also needs to analyze scripts to determine the type of command executed, and decryption/decoding may be required depending on the attacks.
   While Microsoft Defender for Endpoint excels in capturing script execution, understanding the content still requires specific skills and knowledge.
   However, Security Copilot ***immediately analyzes the code written in the script and informs us about what is exactly happening.*** This helps the SOC team save time in script analysis[^8].

4. KQL in Advanced Hunting is the most powerful tool in Microsoft Defender XDR, allowing us to view activities as raw data by controlling KQL.
   However, writing a query from scratch can be a challenge, especially for those unfamiliar with Microsoft.
   Security Copilot ***addresses this issue by assisting in generating KQL queries through questions or requests made to the tool[^9]***.

5. The SOC team usually writes incident reports in the form of logs, which can be time-consuming.
  Security Copilot streamlines this process by ***generating incident reports and even creating PowerPoint slides in standalone portal[^10]***.

[^6]: [Summarize an incident with Microsoft Security Copilot in Microsoft Defender XDR](https://learn.microsoft.com/en-us/microsoft-365/security/defender/security-copilot-m365d-incident-summary?view=o365-worldwide)
[^7]: [Use guided responses with Microsoft Security Copilot in Microsoft Defender XDR](https://learn.microsoft.com/en-us/microsoft-365/security/defender/security-copilot-m365d-guided-response?view=o365-worldwide)
[^8]: [Analyze scripts and codes with Microsoft Security Copilot in Microsoft Defender XDR](https://learn.microsoft.com/en-us/microsoft-365/security/defender/security-copilot-m365d-script-analysis?view=o365-worldwide)
[^9]: [Microsoft Security Copilot in advanced hunting](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-security-copilot?view=o365-worldwide)
[^10]: [Create an incident report with Microsoft Security Copilot in Microsoft Defender XDR](https://learn.microsoft.com/en-us/microsoft-365/security/defender/security-copilot-m365d-create-incident-report?view=o365-worldwide)

## What's next ?
Unified XDR & SIEM is coming soon !! As of now, this is still in private preview, but I hope the public preview is coming soon.
- [Microsoft Defender XDR, Security Copilot & Microsoft Sentinel now in one portal](https://youtu.be/snV2joMnSlc?si=5NCzOqppxtubZQsr)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

# Day9 - XDR Incident Response insights
When organizations purchase E5 security, their first challenge is often product deployment. However, ***the next significant challenge arises in "security operations"***, particularly dealing with daily incident response. While Microsoft provides detailed insights and various features, SOC teams might feel overwhelmed when alerts and incidents are generated in their environment. 

When alerts/incidents were generated in your tenant, it is possible that some individuals may have the following concerns and challenges.

1. ***No idea where to start the investigation...***
2. ***Where exactly do I have to look ?***
3. ***What kind of options do I have ?***
4. ***What capabilities can I leverage in XDR ?***


In light of this, I aim to expand their understanding in ***XDR*** and ***Microsoft 365 Defender*** to help them overcome these challenges.
Therefore, in this blog, I am going to explore the power of XDR, Microsoft 365 Defender.

| #    | Title | About | 
|:-----|:----- |:------|
|1     | XDR overview  ***<we are here !!>*** | This blog is for people who are not aware of XDR. <br> It aims to start the journey of exploring XDR, specifically Microsoft 365 Defender. |
|2     | XDR Incident Response | WIP |


## What is XDR ?
Extended detection and response describes ***a unified security incident detection and response platform*** that automatically collects and ***correlates data from multiple proprietary security components***. 
> Gartner® Innovation Insight for Extended Detection and Response

## Gartner® Magic Quadrant™
Before we dive into the power of XDR and Microsoft 365 Defender in this blog, let's take a fascinating look at the market research results for Endpoint Protection/XDR over the past 2 years. 
As shown in the results over the past two years, Microsoft has consistently stayed its position as ***a Leader***. 

> According to [the Gartner report](https://www.gartner.com/doc/reprints?id=1-2AJ91JO6&ct=220707&st=sb) in 2022, Microsoft's highest scores are for its market understanding and overall viability. This reflects the strong performance of its security business and an early move to define and ***evolve the emerging XDR category***. Microsoft achieved this through ***deep integration and automation between Microsoft Defender for Endpoint and other Microsoft products***, particularly Azure Active Directory, enabling an emerging identity threat detection and response (ITDR) capability.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/b4039697-5aec-4d5d-a710-a7fa5310ada6)

- [Microsoft is named a Leader in the 2022 Gartner® Magic Quadrant™ for Endpoint Protection Platforms](https://www.microsoft.com/en-us/security/blog/2023/03/02/microsoft-is-named-a-leader-in-the-2022-gartner-magic-quadrant-for-endpoint-protection-platforms/)
- [Gartner names Microsoft a Leader in the 2021 Endpoint Protection Platforms Magic Quadrant](https://www.microsoft.com/en-us/security/blog/2021/05/11/gartner-names-microsoft-a-leader-in-the-2021-endpoint-protection-platforms-magic-quadrant/)

## XDR, Microsoft 365 Defender
In Microsoft Security, we have an XDR solution called ***Microsoft 365 Defender***, which provides a wide range of protection, including the following:

| Product | Protection   |
|:--------|:--------|
| Microsoft Defender fot Office 365 (MDO) | Email security | 
| Microsoft Defender for Cloud Apps (MDA) | App & Data security |
| Microsoft Defender for Endpoint (MDE)   | Endpoint security |
| Microsoft Defender for Identity (MDI)   | On-premise-based identity security  |
| Azure Active Directory Identity Protection (AADID) | Cloud-based identity security |

> [What is Microsoft 365 Defender?](https://learn.microsoft.com/en-us/microsoft-365/security/defender/microsoft-365-defender?view=o365-worldwide)

### XDR advantages in Microsoft 365 Defender
1. Combined incidents queue
2. Automatic attack disruption
3. Automated investigation and response
4. Threat Hunting, KQL

## Combined incidents queue, XDR
Thanks to the power of XDR, Microsoft 365 Defender incident correlates multiple defender alerts and all affected entities into a cohesive view - ***a single unified incident***.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/23388f31-bcd3-443a-a6f0-290d89248bc3)
>  Peach Sandstorm (HOLMIUM) techniques, [Inside Microsoft 365 Defender: Mapping attack chains from cloud to endpoint](https://www.microsoft.com/en-us/security/blog/2020/06/18/inside-microsoft-threat-protection-mapping-attack-chains-from-cloud-to-endpoint/)

## Automatic attack disruption
Automatic attack disruption in Microsoft 365 Defender uses XDR signals from different sources (endpoints, email, identity, data) to ***automatically contain compromised assets and stop ongoing cyber attacks, minimizing their impact on organizations***.

> **Note**
> 
> What is the objective of attack disruption? - 
> The main objective of this feature is to achieve ***containment*** during the incident response phase. In terms of automatic disruption, there are two actions that can be taken: ***"device contain"*** by Microsoft Defender for Endpoint and ***"disable user"*** by Microsoft Defender for Identity.

Microsoft 365 Defender XDR provides coverage for the following three advanced attacks to disrupt further progression.

| Advanced attack | Microsoft Security blog |
|:----------------|:------------------------|
| Adversary-in-the-middle attacks (AiTM) | [Automatically disrupt adversary-in-the-middle (AiTM) attacks with XDR](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatically-disrupt-adversary-in-the-middle-aitm-attacks-with/ba-p/3821751)| 
| Business email compromise (BEC) | [XDR attack disruption in action – Defending against a recent BEC attack](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/xdr-attack-disruption-in-action-defending-against-a-recent-bec/ba-p/3749822) | 
| Human-operated ransomware attacks | [Automatic disruption of Ransomware and BEC attacks with Microsoft 365 Defender](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatic-disruption-of-ransomware-and-bec-attacks-with/ba-p/3738294) | 

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/8097addd-e570-4bf9-a8f1-be3fa6f456ff)
> Incident view showing the yellow bar where [automatic attack disruption](https://learn.microsoft.com/en-us/microsoft-365/security/defender/automatic-attack-disruption?view=o365-worldwide) took action

## Automated investigation and response

## Threat Hunting with KQL


#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

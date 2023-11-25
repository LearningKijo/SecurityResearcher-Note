# Day 9 - XDR Incident Response insights
When organizations purchase E5 security, their first challenge is often product deployment. However, ***the next significant challenge arises in "security operations"***, particularly dealing with daily incident response. While Microsoft provides detailed insights and various features, SOC teams might feel overwhelmed when alerts and incidents are generated in their environment. 

When alerts/incidents were generated in your tenant, some people may have the following concerns and challenges.

1. ***No idea where to start the investigation...***
2. ***Where exactly do I have to look ?***
3. ***What kind of options do I have ?***
4. ***What capabilities can I leverage in XDR ?***


In light of this, I aim to expand their understanding in ***XDR*** and ***Microsoft 365 Defender*** to help them overcome these challenges.
Therefore, in this blog, I am going to explore the power of XDR, Microsoft 365 Defender and now let's start with Part 1.

| #    | Title | About | 
|:-----|:----- |:------|
|1     | XDR overview ***<we are here !!>*** | This blog is for people who are not aware of XDR. <br> It aims to start the journey of exploring XDR, specifically Microsoft 365 Defender. |
|2     | [XDR Incident Investigation](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day10-XDR-Insights-part2.md) | This blog focuses on Incident Response in the Microsoft 365 Defender portal. <br> Part 1 covers the fundamentals, while ***Part 2 delves into core incident investigation.*** |
 


## What is XDR ?
Extended detection and response describes ***a unified security incident detection and response platform*** that automatically collects and ***correlates data from multiple proprietary security components***. 
> Gartner® Innovation Insight for Extended Detection and Response

## Gartner® Magic Quadrant™
Before we dive into the power of XDR and Microsoft 365 Defender in this blog, let's take a fascinating look at the market research results for Endpoint Protection/XDR over the past 2 years. 
As shown in the results over the past two years, Microsoft has consistently stayed its position as ***a Leader***. 
> [!Important]
> According to [the Gartner report](https://www.gartner.com/doc/reprints?id=1-2AJ91JO6&ct=220707&st=sb) in 2022, Microsoft's highest scores are for its market understanding and overall viability. This reflects the strong performance of its security business and an early move to define and ***evolve the emerging XDR category***. Microsoft achieved this through ***deep integration and automation between Microsoft Defender for Endpoint and other Microsoft products***, particularly Azure Active Directory, enabling an emerging identity threat detection and response (ITDR) capability.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/b4039697-5aec-4d5d-a710-a7fa5310ada6)

- [Microsoft is named a Leader in the 2022 Gartner® Magic Quadrant™ for Endpoint Protection Platforms](https://www.microsoft.com/en-us/security/blog/2023/03/02/microsoft-is-named-a-leader-in-the-2022-gartner-magic-quadrant-for-endpoint-protection-platforms/)
- [Gartner names Microsoft a Leader in the 2021 Endpoint Protection Platforms Magic Quadrant](https://www.microsoft.com/en-us/security/blog/2021/05/11/gartner-names-microsoft-a-leader-in-the-2021-endpoint-protection-platforms-magic-quadrant/)


## XDR, Microsoft 365 Defender
In Microsoft Security, we have an XDR solution called [Microsoft 365 Defender](https://learn.microsoft.com/en-us/microsoft-365/security/defender/microsoft-365-defender?view=o365-worldwide)
, which provides a wide range of protection, including the following Defender suite:

| Product | Protection   |
|:--------|:--------|
| Microsoft Defender fot Office 365 (MDO) | Email security | 
| Microsoft Defender for Cloud Apps (MDA) | App & Data security |
| Microsoft Defender for Endpoint (MDE)   | Endpoint security |
| Microsoft Defender for Identity (MDI)   | On-premise-based identity security  |
| Microsoft Entra ID Protection | Cloud-based identity security |

### XDR advantages in Microsoft 365 Defender
Firstly, there are a number of great features in Microsoft 365 Defender, and I would like to spotlight four pivotal attributes that have the potential to optimize your security operations, as outlined below:
1. Combined incidents queue
2. Automatic attack disruption
3. Automated investigation and response
4. Threat Hunting, KQL

## Combined incidents queue, XDR
Thanks to the power of XDR, Microsoft 365 Defender incident correlates multiple defender alerts and all affected entities into a cohesive view - ***a single unified incident***.

[Peach Sandstorm](https://www.microsoft.com/en-us/security/blog/2020/06/18/inside-microsoft-threat-protection-mapping-attack-chains-from-cloud-to-endpoint/) (previously HOLMIUM) attack is the great example of how Microsoft 365 Defender efficiently detects individual alerts and seamlessly correlates them into a single incident, showcasing the power of XDR.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/23388f31-bcd3-443a-a6f0-290d89248bc3)
>  Peach Sandstorm attack techniques with Microsoft 365 Defender 

As evidenced by the incident below, Microsoft 365 Defender successfully captured HOLMIUM activities and consolidated 10 alerts into a single incident. This streamlined approach empowers the SOC team to readily comprehend affected assets and promptly implement containment measures. Additionally, the Incident view presents the 10 alerts chronologically, enabling the SOC team to discern the attack's progression and origin.

![3m0twjyu](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/c4525b0a-1d6b-49e7-90de-08cb07d9f009)
> Peach Sandstorm detection & incident page in Microsoft 365 Defender

## Automatic attack disruption
Automatic attack disruption in Microsoft 365 Defender uses XDR signals from different sources (endpoints, email, identity, data) to ***automatically contain compromised assets and stop ongoing cyber attacks, minimizing their impact on organizations***.

> [!Note]
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


[Automated investigation and response](https://learn.microsoft.com/en-us/microsoft-365/security/defender/m365d-autoir?view=o365-worldwide) (AIR) in Microsoft 365 Defender significantly enhances security team efficiency by automatically investigating generated incidents and responding to malicious entities. This automated process resolves numerous incidents without any interaction from the security team.

Once alerts are generated in Microsoft 365 Defender, AIR triggers a playbook, initiates the investigation process, and takes remediation actions for both devices and emails.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/536b3cef-c0c7-4d57-b7a3-2df762b14596)
>  Automated Investigation and Response page in Microsoft 365 Defender portal

## Threat Hunting with KQL
[Advanced Hunting](https://learn.microsoft.com/en-us/microsoft-365/security/defender/advanced-hunting-overview?view=o365-worldwide) is an incredible XDR feature within Microsoft 365 Defender. This capability enables us to analyze vast amounts of security-related data across their organization's endpoints, identities, applications, emails, and more by leveraging ***Kusto Query Language*** (KQL).

> [!Warning]
> The data from all tables remains available for up to **30 days** in Advanced Hunting, Microsoft 365 Defender. If you wish to retain raw data (logs) for more than 30 days, I recommend utilizing [Microsoft Sentinel](https://learn.microsoft.com/en-us/azure/sentinel/overview), which allows you to keep the data for up to **2 years**.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/e890a657-829d-444d-a369-cceb8b37862f)
>  Advanced Hunting page in Microsoft 365 Defender portal

By combining two different tables from different products, you can gain additional insights. 
For instance, when you merge email and identity tables, you can obtain not only information about email cases classified as malware/phishing but also relevant user account details, including city, country, job title, and more.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/541ad329-b435-45f8-a874-24b37c4ac874)


For those interested in learning KQL, recommend the following webinars

- #### Microsoft 365 Defender / KQL Webcast 
  This webinar is an excellent resource for those who are new to KQL in Microsoft 365 Defender. Each webinar in the series covers the fundamentals of KQL and demonstrates great use cases. As my work mainly focuses on XDR in Microsoft 365 Defender, I found these webinars particularly helpful and informative.

  1. [M365 Defender (MTP) webinar: Tracking the Adversary E1: KQL Fundamentals](https://www.youtube.com/watch?v=0D9TkGjeJwM).
  2. [M365 Defender (MTP) webinar: Tracking the Adversary E2: Joins](https://www.youtube.com/watch?v=LMrO6K5TWOU).
  3. [M365 Defender (MTP) webinar: Tracking the Adversary E3: Summarizing, Pivoting, and Visualizing Data](https://www.youtube.com/watch?v=UKnk9U1NH6Y).
  4. [M365 Defender (MTP) webinar: Tracking the Adversary E4 Let’s hunt! Applying KQL to incident tracking](https://www.youtube.com/watch?v=2EUxOc_LNd8&list=RDCMUCGTUbqE3SJiLgtvWjIkSQuQ&index=3). <br>

- #### Microsoft Sentinel webinar / KQL part 1-3 
  After attending the Microsoft 365 Defender Webcast, I continued to explore KQL in greater depth. For those using Microsoft Sentinel and Azure Data Explorer, these webinars can provide an excellent starting point for learning KQL.

  1. [Azure Sentinel webinar: KQL part 1 of 3 - Learn the KQL you need for Azure Sentinel!](https://www.youtube.com/watch?v=EDCBLULjtCM)
  2. [Azure Sentinel webinar: KQL part 2 of 3 - KQL hands-on lab exercises!](https://www.youtube.com/watch?v=YKD_OFLMpf8)
  3. [Azure Sentinel webinar: KQL part 3 of 3 - Optimizing Azure Sentinel KQL queries performance!](https://www.youtube.com/watch?v=jN1Cz0JcLYU)
 
#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

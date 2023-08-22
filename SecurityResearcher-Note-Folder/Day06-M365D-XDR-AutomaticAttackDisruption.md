# Day 6 - XDR automatic attack disruption  
Automatic attack disruption in Microsoft 365 Defender uses XDR signals from different sources (endpoints, email, identity, data) to ***automatically contain compromised assets and stop ongoing cyber attacks, minimizing their impact on organizations***.
#### What is the objective of attack disruption?
The main objective of this feature is to achieve ***containment*** during the incident response phase. In terms of automatic disruption, there are two actions that can be taken: ***"device contain"*** by Microsoft Defender for Endpoint and ***"disable user"*** by Microsoft Defender for Identity.

## Advanced attacks vs XDR attack disruption
Microsoft 365 Defender XDR provides coverage for the following three advanced attacks to disrupt further progression.

1. Adversary-in-the-middle attacks (AiTM)
2. Business email compromise (BEC)
3. Human-operated ransomware attacks

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/4a26dc22-2a5a-4197-b000-8ceaa44f2111)
>  Automatic attack disruption, [Microsoft 365 Defender Blog](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatic-disruption-of-ransomware-and-bec-attacks-with/ba-p/3738294)

##  AiTM insights
AiTM attack refers to ***"Adversary-in-The-Middle"*** phishing technique where attackers intercept communication between a user and a legitimate website, stealing passwords and session cookies to gain unauthorized access and perform fraudulent activities.

#### MS security blogs : AiTM timeline

- July 12, 2022, [From cookie theft to BEC: Attackers use AiTM phishing sites as entry point to further financial fraud](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)
- November 16, 2022, [Token tactics: How to prevent, detect, and respond to cloud token theft](https://www.microsoft.com/en-us/security/blog/2022/11/16/token-tactics-how-to-prevent-detect-and-respond-to-cloud-token-theft/)
- March 13, 2023, [DEV-1101 enables high-volume AiTM campaigns with open-source phishing kit](https://www.microsoft.com/en-us/security/blog/2023/03/13/dev-1101-enables-high-volume-aitm-campaigns-with-open-source-phishing-kit/)
- June 8, 2023, [Detecting and mitigating a multi-stage AiTM phishing and BEC campaign](https://www.microsoft.com/en-us/security/blog/2023/06/08/detecting-and-mitigating-a-multi-stage-aitm-phishing-and-bec-campaign/)

## BEC insights
Business Email Compromise (BEC) is a cyberattack where attackers deceive organizations through fraudulent emails. They impersonate trusted individuals to trick employees into taking unauthorized actions, such as transferring money or revealing sensitive information. BEC attacks can lead to financial losses and reputational damage for businesses.

- May 6, 2021, [Business email compromise: How Microsoft is combating this costly threat](https://www.microsoft.com/en-us/security/blog/2021/05/06/business-email-compromise-how-microsoft-is-combating-this-costly-threat/)

## Human-operated ransomware insights
Human-operated ransomware attacks, also known as ***"hands-on-keyboard"*** attack, refer to a specific type of ransomware attack where skilled human attackers actively participate in various stages of the attack rather than relying solely on automated tools or malware.

- [Human-operated ransomware | Microsoft Learn](https://learn.microsoft.com/en-us/security/ransomware/human-operated-ransomware)
- March 5, 2020, [Human-operated ransomware attacks: A preventable disaster](https://www.microsoft.com/en-us/security/blog/2020/03/05/human-operated-ransomware-attacks-a-preventable-disaster/)

## MS blog - automatic attack disruption  
1. [Automatic attack disruption in Microsoft 365 Defender](https://learn.microsoft.com/en-us/microsoft-365/security/defender/automatic-attack-disruption?view=o365-worldwide)
2. Feb 22 2023, [Automatic disruption of Ransomware and BEC attacks with Microsoft 365 Defender](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatic-disruption-of-ransomware-and-bec-attacks-with/ba-p/3738294)
3. Mar 08 2023, [XDR attack disruption in action – Defending against a recent BEC attack](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/xdr-attack-disruption-in-action-defending-against-a-recent-bec/ba-p/3749822)
4. May 17 2023, [Automatically disrupt adversary-in-the-middle (AiTM) attacks with XDR](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatically-disrupt-adversary-in-the-middle-aitm-attacks-with/ba-p/3821751)



#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

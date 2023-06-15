# Day 6 - XDR attack disruption  
Automatic attack disruption in Microsoft 365 Defender uses XDR signals from different sources (endpoints, email, identity, data) to ***automatically contain compromised assets and stop ongoing cyber attacks, minimizing their impact on organizations***.
#### What is the objective of attack disruption?
The main objective of this feature is to achieve ***containment*** during the incident response phase. In terms of automatic disruption, there are two actions that can be taken: ***"device contain"*** by Microsoft Defender for Endpoint and ***"disable user"*** by Microsoft Defender for Identity.

## Advanced attacks vs XDR attack disruption
Microsoft 365 Defender XDR provides coverage for the following three advanced attacks to disrupt further progression.
1. Human-operated ransomware
2. Business email compromise (BEC)
3. Adversary-in-the-middle attacks (AiTM)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/4a26dc22-2a5a-4197-b000-8ceaa44f2111)
>  Automatic attack disruption, [Microsoft 365 Defender Blog](https://techcommunity.microsoft.com/t5/microsoft-365-defender-blog/automatic-disruption-of-ransomware-and-bec-attacks-with/ba-p/3738294)

##  AiTM insights
AiTM attack refers to ***"Adversary-in-The-Middle"*** phishing technique where attackers intercept communication between a user and a legitimate website, stealing passwords and session cookies to gain unauthorized access and perform fraudulent activities.

#### MS security blogs : AiTM timeline
- July 12, 2022, [From cookie theft to BEC: Attackers use AiTM phishing sites as entry point to further financial fraud](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)
- November 16, 2022, [Token tactics: How to prevent, detect, and respond to cloud token theft](https://www.microsoft.com/en-us/security/blog/2022/11/16/token-tactics-how-to-prevent-detect-and-respond-to-cloud-token-theft/)
- March 13, 2023, [DEV-1101 enables high-volume AiTM campaigns with open-source phishing kit](https://www.microsoft.com/en-us/security/blog/2023/03/13/dev-1101-enables-high-volume-aitm-campaigns-with-open-source-phishing-kit/)
- June 8, 2023, [Detecting and mitigating a multi-stage AiTM phishing and BEC campaign](https://www.microsoft.com/en-us/security/blog/2023/06/08/detecting-and-mitigating-a-multi-stage-aitm-phishing-and-bec-campaign/)


![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/f6e7664e-398b-4fe9-be2e-643132bc8448)
> Figure 1. AiTM attack kill chain, [MS security blog](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/060e4e7e-d6e7-4bca-91bf-e7b0a7dc4c94)
> Figure 2. AiTM phishing process, [MS security blog](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)

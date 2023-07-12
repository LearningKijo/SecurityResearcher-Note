# Day 7 - AiTM attack insights

AiTM attack refers to ***"Adversary-in-The-Middle"*** phishing technique where attackers intercept communication between a user and a legitimate website, stealing passwords and session cookies to gain unauthorized access and perform fraudulent activities.

## AiTM - "From cookie theft to BEC" 
As part of the "From cookie theft to BEC" attack, the attacker initiates the process by sending phishing emails to the target. Upon clicking a link in the email, the user is directed to a fake website. At this point, the attackers establish a proxy server between the target user and the intended website. This setup allows the attacker to intercept and capture the user's password and session cookie, providing them with the means to authenticate and access the user's session on the website. After successfully authenticating, for example, to Outlook, they can read email content or create a forwarding rule to identify the target of the fraud. Once they have identified the target, they take action to initiate multiple fraud attempts.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/10b9b7d8-f1bf-4c73-9259-7d1455c07a0d)

> Figure 1. AiTM attack kill chain, [MS security blog, July 12, 2022](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)


### Open-source AiTM phishing toolkits
As there are tools available on the internet, attackers utilize them for conducting AiTM attacks.
- [Evilginx2](https://github.com/kgretzky/evilginx2)
- [Modlishka](https://github.com/drk1wi/Modlishka)
- [Muraena](https://github.com/muraenateam/muraena)

### Initial access - phishing email
As the attacker aims to successfully lure the target to a phishing site and avoid detection by mail security, they primarily rely on two attack techniques, as follows.
- Type Ⅰ : HTML file attachment
- Type Ⅱ : Phishing link

Based on research conducted by third parties, it has been observed that attackers commonly employ the technique of ***window.location.replace()*** to redirect users to phishing sites.

### Phishing mail pattern

## KQL : Hunting

1. [13-kql-AiTM-HuntingInsight-Part1.pdf](https://github.com/LearningKijo/KQL/blob/main/KQL-Effective-Use/13-kql-AiTM-HuntingInsight-Part1.pdf)
2. [13-kql-AiTM-HuntingInsight-Part2.pdf](https://github.com/LearningKijo/KQL/blob/main/KQL-Effective-Use/13-kql-AiTM-HuntingInsight-Part2.pdf)
3. [13-kql-AiTM-HuntingInsight-Part3.pdf](https://github.com/LearningKijo/KQL/blob/main/KQL-Effective-Use/13-kql-AiTM-HuntingInsight-Part3.pdf)
4. [13-kql-AiTM-HuntingInsight-Part4.pdf](https://github.com/LearningKijo/KQL/blob/main/KQL-Effective-Use/13-kql-AiTM-HuntingInsight-Part4.pdf)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/cee2680e-f8be-41a0-b24f-18c0c96acfd3)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/cec632df-c9f7-4a74-b0a4-11eea8ef5d72)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/79617151-c385-4bf9-8b04-ea57a24318db)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/462a2a68-c945-4e58-8e37-b3de6bb4659d)

## MS security blogs : AiTM attack timeline

- July 12, 2022, [From cookie theft to BEC: Attackers use AiTM phishing sites as entry point to further financial fraud](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)
- November 16, 2022, [Token tactics: How to prevent, detect, and respond to cloud token theft](https://www.microsoft.com/en-us/security/blog/2022/11/16/token-tactics-how-to-prevent-detect-and-respond-to-cloud-token-theft/)
- March 13, 2023, [DEV-1101 enables high-volume AiTM campaigns with open-source phishing kit](https://www.microsoft.com/en-us/security/blog/2023/03/13/dev-1101-enables-high-volume-aitm-campaigns-with-open-source-phishing-kit/)
- June 8, 2023, [Detecting and mitigating a multi-stage AiTM phishing and BEC campaign](https://www.microsoft.com/en-us/security/blog/2023/06/08/detecting-and-mitigating-a-multi-stage-aitm-phishing-and-bec-campaign/)

## Other blogs
- August 02, 2022, [Large-Scale AiTM Attack targeting enterprise users of Microsoft email services](https://www.zscaler.com/blogs/security-research/large-scale-aitm-attack-targeting-enterprise-users-microsoft-email-services) (Zscaler)
- August 09, 2022, [AitM Phishing Attack Targeting Enterprise Users of Gmail](https://www.zscaler.jp/blogs/security-research/aitm-phishing-attack-targeting-enterprise-users-gmail) (Zscaler)
- November, 09, 2022, [Trellix Insights: Large-Scale AiTM Attack Targeting Enterprise Users](https://kcm.trellix.com/corporate/index?page=content&id=KB96139&locale=en_US) (Trellix)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

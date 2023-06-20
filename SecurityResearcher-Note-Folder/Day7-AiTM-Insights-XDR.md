# Day 7 - AiTM attack insights

AiTM attack refers to ***"Adversary-in-The-Middle"*** phishing technique where attackers intercept communication between a user and a legitimate website, stealing passwords and session cookies to gain unauthorized access and perform fraudulent activities.

## MS security blogs : AiTM attack timeline

- July 12, 2022, [From cookie theft to BEC: Attackers use AiTM phishing sites as entry point to further financial fraud](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)
- November 16, 2022, [Token tactics: How to prevent, detect, and respond to cloud token theft](https://www.microsoft.com/en-us/security/blog/2022/11/16/token-tactics-how-to-prevent-detect-and-respond-to-cloud-token-theft/)
- March 13, 2023, [DEV-1101 enables high-volume AiTM campaigns with open-source phishing kit](https://www.microsoft.com/en-us/security/blog/2023/03/13/dev-1101-enables-high-volume-aitm-campaigns-with-open-source-phishing-kit/)
- June 8, 2023, [Detecting and mitigating a multi-stage AiTM phishing and BEC campaign](https://www.microsoft.com/en-us/security/blog/2023/06/08/detecting-and-mitigating-a-multi-stage-aitm-phishing-and-bec-campaign/)

## AiTM - "From cookie theft to BEC" 
As part of the "From cookie theft to BEC" attack, the attacker initiates the process by sending phishing emails to the target. Upon clicking a link in the email, the user is directed to a fake website. At this point, the attackers establish a proxy server between the target user and the intended website. This setup allows the attacker to intercept and capture the user's password and session cookie, providing them with the means to authenticate and access the user's session on the website. After successfully authenticating, for example, to Outlook, they can read email content or create a forwarding rule to identify the target of the fraud. Once they have identified the target, they take action to initiate multiple fraud attempts.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/10b9b7d8-f1bf-4c73-9259-7d1455c07a0d)

> Figure 1. AiTM attack kill chain, [MS security blog, July 12, 2022](https://www.microsoft.com/en-us/security/blog/2022/07/12/from-cookie-theft-to-bec-attackers-use-aitm-phishing-sites-as-entry-point-to-further-financial-fraud/)



## AiTM - "Multi-stage AiTM phishing and BEC campaign"


The initial AiTM attack begins when a compromised trusted vendor clicks on a suspicious link in an email. Through this attack, the attacker steals the vendor's password and session, allowing them to gain unauthorized access to various cloud resources. They may manipulate the MFA settings and create forwarding rules. Additionally, utilizing common BEC tactics, they extend their phishing campaign to target both internal and external users.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/0ffdec7b-fd2e-45d1-bb00-81305187fa6b)

> Figure 2. AiTM attack kill chain, [MS security blog, June 8, 2023](https://www.microsoft.com/en-us/security/blog/2023/06/08/detecting-and-mitigating-a-multi-stage-aitm-phishing-and-bec-campaign/)

# Day 10 - XDR Incident Investigation insights
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
|1     | [XDR overview](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day9-XDR-Insights-part1.md)  | This blog is for people who are not aware of XDR. <br> It aims to start the journey of exploring XDR, specifically Microsoft 365 Defender. |
|2     | XDR Incident Investigation ***<we are here !!>***  | This blog focuses on Incident Response in the Microsoft 365 Defender portal. <br> Part 1 covers the fundamentals, while ***Part 2 delves into core incident investigation.*** |
|3     | XDR  Incident Response | This blog focuses on Incident Response in the Microsoft 365 Defender portal. <br> Part 1 covers the fundamentals, while ***Part 3 delves into core incident response.*** | 

## Incident Investigation in Microsoft 365 Defender 

To effectively utilize Microsoft 365 Defender, please keep in mind the following two concepts when you receive alerts and incidents in your tenant.

| #    | Step        |     ToDo                                                    |
|:-----|:------------|:------------------------------------------------------------| 
|  1   | Investigate | - Contain compromised assets <br> - Investigate incidents | 
|  2   | Response    | - Eradication & Recovery <br> - Extend investigation      | 
> **Important**
> Step 2, Response part, will be covered in Part 3. [SOON]

###  1. Investigate
When alerts/incidents were generated in your tenant, firstly what you have to do is to understand ***a holistic view of the generated incident***.
- [ ] Confirm how and where the attack started.
- [ ] How far the attack has gone into your tenant.
- [ ] Identify & Contain compromised assets, such as devices, users, mailboxes, apps and more.

  
>**Warning**
> Instead of looking at the alert page initially, focus on ***the incident page***. This is because numerous alerts may not be mapped as a single incident, potentially overwhelming the SOC team.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/7df02513-bc93-430b-8aac-a4f57b4287fb)

#### @ Confirm how and where the attack started ? 
#### @ How far the attack has gone into your tenant ?

When it comes to **"Investigation"**, it's important to grasp a holistic view of the generated incident.
***In other words, you don't need to deeply understand the detailed information of processes, files, registries, and device activities originating from individual alerts at this stage.***
This provides preliminary and useful information before proceeding with actions in the containment process.

The following are important checkpoints to understand the holistic view of the incident.


| Points         | Details     |
|:---------------|:------------|
| Incident Title |Title is the primary element that helps you upon opening an incident. It assists in grasping a concise overview of the incident. For instance, 'Multi-stage incident involving initial access & Command and Control on Multiple endpoints.' This title helps you envision a scenario where two attack techniques are observed on multiple devices.|
| Alerts         |This is the best place for tracking the timeline of alerts within the incident, particularly when investigating the breach's initiation. These alerts offer insights into the initial stages of the breach, including details about how and where the compromise originated.|
| Incident graph |This incident graph visualizes the maximum level of relationships, such as alerts associated with the incident and entities linked to those alerts. Therefore, by simultaneously viewing this incident graph along with incident titles and alerts, it helps in comprehending and understanding the overall picture of what is happening within the incident. |

 ![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/9024828f-ae49-42d4-b19f-37c01f7badfe)
> Incidents page -> [Attack story]

> Incidents page -> [Summary]

| Points                | Details     |
|:----------------------|:------------|
| Alerts and categories | Alerts and categories provide you not only with alerts in chronological order, but also with MITRE ATT&CK tactics. Thanks to MITRE ATT&CK, the SOC team can envision the scope of this attack and more, including how it has spread across different areas.|
| Scope                 | Within the scope, this provides information about impacted assets, such as devices, user accounts, mailboxes, and applications. This information aids in determining the subsequent steps, such as containment to stop the ongoing attack and mitigate its impact.|

#### @ Identify & Contain compromised assets, such as devices, users, mailboxes, apps and more
Once you find the compromised asset, you have to take containment actions to stop the ongoing attack. I have summarized several containment-related actions within Microsoft 365 Defender as follows.

| Asset   | Action  | 
|:--------|:--------|
| Device  | - [Initiate Live Response Session](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/live-response?view=o365-worldwide) <br> - ***[Isolate Device](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#isolate-devices-from-the-network)*** <br> - ***[Contain Device](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#contain-devices-from-the-network)***  | |
| User Accounts | [- Suspend user in Azure AD <br> - Disable user in Active Directory <br> - Reset user password](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions) |

> **Important**
> #### Automatic attack disruption
> While the above actions are performed manually, in cases where advanced attacks such as AiTM, BEC, and Human-operated ransomware are detected in Microsoft 365 Defender, [Automatic attack disruption feature](https://learn.microsoft.com/en-us/microsoft-365/security/defender/automatic-attack-disruption?view=o365-worldwide) designed for containment will help you stop the ongoing breach.
> #### Automated investigation and response (AIR)
> As [AIR](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/automated-investigations?view=o365-worldwide) is enabled by default, certain alerts & incidents will be automatically investigated and remediated. This process is primarily triggered when an alert is detected in your tenant, but there is also a manual option. If needed, you can initiate AIR.


![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/3379a4c5-7a86-45fb-9176-88344aceefe5)
> e.g. Device actions 


Isolating the device from the internet is highly critical to minimize the impact on the endpoint. Once the internet connection is disabled, the SOC team can allocate time for in-depth investigation and proceed with eradication tasks, such as removing malicious files, deleting registry keys, terminating processes, and more.

Resetting passwords is a highly effective method to prevent unauthorized access by attackers. Additionally, disabling Azure AD user accounts and on-premises AD accounts are powerful actions that effectively cut off access to their associated resources.


In the beginning, we usually initiate the process of identifying the incident to classify whether it is a false positive or true positive. If it is indeed a true positive, we delve into the incident to gain a comprehensive overview and identify compromised assets before moving on to containment. Following containment, we isolate or shut down the asset to halt the ongoing attack. The subsequent steps involve further investigation, eradication, remediation, and more. I hope I can share a story about further investigation and eradication in the next part of the blog.

## Reference

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

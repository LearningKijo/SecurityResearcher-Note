# Cloud-Based Identity to Exfiltration Attack (Part2)
This blog  is a part 2. If you haven't seen part 1, I highly recommend visiting [Day16-CloudId-Exfiltration-AttackReport-Part1.md
](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day16-CloudId-Exfiltration-AttackReport-Part1.md).

#### Background
Identity attacks have been increasing every single day. Over the past few years, attackers have been observed attempting to transition from on-premise to cloud environments for further exploitation. 
Today, I would like to showcase some detection insights regarding attacks, starting from cloud-based identity attacks and extending to compromised Office 365 environment.

Here is the complete attack scenario that I simulated manually, step by step.

"Assuming the attacker has obtained the email address information and requires a password to log in to Office 365/Outlook, they begin by attempting to access it with various easily guessable passwords at random. 
After a few attempts, they manage to guess the password, but their access is blocked by MFA (Multi-Factor Authentication). 
Subsequently, they resort to repeatedly requesting MFA approval to exhaust the targeted user, a technique known as MFA fatigue. 
Eventually, after 10-15 attempts, the user approves access due to exhaustion."

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/3354a892-e4a3-4ac0-a126-cb6abd3f3421)
> Cloud-Based Identity to Exfiltration : Attack flow

## Attack Simulation : Part 2
As I've divided this attack insight into two parts, I would like to focus on the activity after the attacker successfully logs into Office 365.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/14c3faa8-06af-48fb-ae15-c61785083e85)


### Suspicious Forwarding rules
After successful login, we observed the creation of forwarding rules in the alert and attack story. 
Additionally, as depicted in the incident graph, we can discern the impacted user account and email account. 
Moreover, we identified the IP address the attacker used and captured the forwarded email account, potentially revealing the attacker's email address for information leakage through Outlook.

In terms of the alert timeline, Microsoft Defender for Cloud Apps initially detected suspicious activity from a captured Tor IP address, which included the creation of a forwarding rule with a Tor IP address originating from Germany.Continuously generated was "Suspicious Email Forwarding Rule" alert. 
Additionally, Microsoft Defender XDR correlated "Impossible Travel activity" alert from [Part 1](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day16-CloudId-Exfiltration-AttackReport-Part1.md) with "Suspicious Inbox Forwarding Rule", ultimately identifying ***"Suspicious email forwarding rule"*** as the XDR source

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/da5a1f43-dc95-4fc4-8657-a309477aabc9)


In order to view detailed values from forwarding rule creation, we can utilize Microsoft Defender for Cloud Apps, App Connector, Office 365, and access raw data with JSON data / values. 
Here are examples from two alerts.
```
<Create Forwarding inbox rule : Source, App Connector, View raw data>
      "Name" : "ForwardTo",               "Name" : "SubjectContainsWords"
      "Value": "xxxxxxxxxxx@outlook.com", "Value": "Info;Data;Important"
      --------------------------------------------------------------------
      "Name" : "ForwardTo",               "Name" : "SubjectContainsWords"
      "Value": "xxxxxxxxxxx@outlook.com", "Value": "Payment;Money;Invoice"
```

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/4a9648e2-066f-467e-abab-d1ec6ff9feb8)
> Alert page / Source / App Connector / View raw data

### Mass Download
After creating the forwarding rules, we observed the attacker moving to a SharePoint site to conduct further activities. 
Based on the generated alerts, it appears that the attacker is attempting to download a number of files from the SharePoint site, ***possibly for the purpose of file exfiltration***.

The key information is to examine related activities on the alert page.
```
1. Activitiy   - Download file : SharePoint site url
2. User        - Darol, compromised user account
3. App         - SharePoint
4. IP address  - Attacker/ Tor IP address
5. Location    - Germany, using a Tor browser
```

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/e68b06d4-1be6-47ad-9992-d9554d049044)

By selecting [Investigate in activity log], you can view all downloading file activities initiated by the attacker using the Tor browser. 
We confirmed ***a total of 54 download activities*** in the end.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/c382f3d8-c89b-4ea5-bfe3-cd89a36122b7)
> Alert page / Investigate in activity log / Activity log

Additionally, "Anonymous IP address" was captured in a previous suspicious login phase. 
Microsoft Defender XDR correlated "Mass download" activities and integrated them into a new alert - ***"Suspicious behavior: Mass download"***.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/dd3a5da6-4be7-45f1-ba3e-a1d565ebf40f)


### Mass Delete
The final activity involved deleting files in SharePoint site, categorizing it as 'Impact' and ['Data Destruction'](https://attack.mitre.org/techniques/T1485/) in MITRE ATT&CK. 
Similar to the download activity, Microsoft Defender for Cloud Apps monitored these deletion activities, capturing IP addresses, locations, file activity, user accounts, and related applications.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/7a520fcd-eb90-4e46-8618-b8f2c7cc9e4f)

By selecting [Investigate in activity log], you can view all deleting file activities initiated by the attacker using the Tor browser. We confirmed ***a total of 206 delete activities*** in the end.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/01dae4cc-0930-4f6a-b7ed-2502cf1d0020)
> Alert page / Investigate in activity log / Activity log

Similar to the downloading activity, ***the deletion activity is also correlated into one alert, "Suspicious behavior: Mass delete", by Microsoft Defender XDR***. 
XDR was looking at two alerts : "Anonymous IP addresses" and "Mass deletion" activities.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/3c3522c1-fcd5-405b-b677-fe154ace958d)

I hope this simulation and detection insight were helpful for you. This time, we focused on showcasing an attack - identity-based cloud breach and the subsequent move to further attack in Office 365. 
If you are interested in this simulation, please take a look at [DEV05-CloudID-Exfiltration.md](https://github.com/LearningKijo/ResearchDev/blob/main/DEV/DEV05-CloudID-Exfiltration/DEV05-CloudID-Exfiltration.md).

Thank you, Kijo Ninja

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

# Day 2 - APT29, NOBELIUM, MDE Evaluation Lab WIP
In Microsoft Defender for Endpoint's [Evaluation Lab(MDE)](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/evaluation-lab?view=o365-worldwid), Solorigate attack simulation(NOBELIUM) is covered. During this time, I will mainly focus on demonstrating MDE detection capabilities and how MDE captures the attack as EDR, XDR. Additionally, the available response capabilities of the product will be presented.


![image](https://user-images.githubusercontent.com/120234772/231689408-6805a007-69c2-46db-a834-f11e7a5d1870.png)
> Solorigate in MDE Evaluation Lab

## Incident response with Microsoft 365 Defender
During incident response, there are various approaches and scenarios, and Microsoft offers comprehensive documentation on incident response for Microsoft 365 Defender. At this time, I would like to focus on **containment** and **investigation**, as highlighted in the blue line below:
![image](https://user-images.githubusercontent.com/120234772/231698357-8ba1ef53-4c19-4ca8-9eba-0aba46681b06.png)
> incident response workflow, [Incident response with Microsoft 365 Defender](https://learn.microsoft.com/en-us/microsoft-365/security/defender/incidents-overview?view=o365-worldwide)


## Incident response, investigation

Here are some important points to consider during [the investigation](https://learn.microsoft.com/en-us/microsoft-365/security/defender/incidents-overview?view=o365-worldwide)
.
1. Where the attack started.
2. What tactics were used.
3. How far the attack has gone into your tenant.
4. The scope of the attack, such as how many devices, users, and mailboxes were impacted.
5. All of the data associated with the attack.

>**Note** : When starting an investigation, it's important to navigate to **the incident page** instead of the alert page. This is because there can be a large volume of alerts and people may become lost or unsure of what they need to find.


| [Summary] | Check points |
|:---|:---|
| MITRE ATT&CK tactics | Analyze the full scope of attack using the MITRE ATT&CK framework. |
| Scope | Check the impacted assets such as devices, users, mailboxes, and apps.|
| Evidence | Ensure that any suspicious activities related to the incident are identified. |
| Alerts | Check the timeline of those alerts. |

![image](https://user-images.githubusercontent.com/120234772/231705669-82ce321d-d4c2-41df-ada8-43662ddf604d.png)
> Summary, Incident page

| [Attack story] | Check points |
|:----|:----|
| Incident graph | Check how your assets are related to suspicious entities and activities using a graph.  |
| Alerts (Timeline) | Check how many alerts associated with an incident, as well as the timeline of those alerts. | 

![image](https://user-images.githubusercontent.com/120234772/231706242-4623984f-8853-48e5-8e02-6e71c4ad3f91.png)
> Attack story, Incident page


![image](https://user-images.githubusercontent.com/120234772/231714249-885594bd-be8b-439a-a2e1-863dffd3b04a.png)

![image](https://user-images.githubusercontent.com/120234772/231755283-0036cd31-c5aa-4755-a3f1-349d6cac4515.png)


## Incident response, containment
Regarding containment of ***the impacted device***, MDE has the capability to remotely isolate the network from the device.
- [Isolate devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#isolate-devices-from-the-network)
- [Contain devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#contain-devices-from-the-network)

Also, if ***the user account*** has an impact on the breach, then other response options are available.
- [Reset user account password](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions)
- [Disbale AD user / Azure AD user](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions)


![image](https://user-images.githubusercontent.com/120234772/231706957-6b6e2e71-ed9c-4d02-afbf-06a59f9c9825.png)
> e.g. Isolate devices from the network 

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

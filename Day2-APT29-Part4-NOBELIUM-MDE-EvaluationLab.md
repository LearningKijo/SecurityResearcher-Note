# Day 2 - APT29, NOBELIUM, MDE Evaluation Lab
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

### [Summary]
- MITRE ATT&CK tactics
- Scope
- Alerts

![image](https://user-images.githubusercontent.com/120234772/231705669-82ce321d-d4c2-41df-ada8-43662ddf604d.png)


### [Attack story]
- Incident graph
- Alerts (Timeline)

![image](https://user-images.githubusercontent.com/120234772/231706242-4623984f-8853-48e5-8e02-6e71c4ad3f91.png)


## Incident response, containment
![image](https://user-images.githubusercontent.com/120234772/231706957-6b6e2e71-ed9c-4d02-afbf-06a59f9c9825.png)




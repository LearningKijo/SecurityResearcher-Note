# MDE + MDI better together - Reconnaissance
Hello all defenders and threat hunters, and thank you for visiting my product research note. 
In this blog series, I would like to zero in on Microsoft Defender for Endpoint (MDE) + Microsoft Defender for Identity (MDI) better together, showcasing the various advantages of deploying both products together.
Let's start by looking at reconnaissance in Part 1.

### Reconnaissance ? 
Reconnaissance is the initial phase in which attackers gather information about the target network or system, identify vulnerabilities, and collect information. 
This collected data will be used by the adversary to aid in other phases of the attack, such as initial access and credential theft.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/ea593e3e-d171-4101-80b6-48e80a0aa0eb)

## Detection, XDR

The attacker wants to collect on-premise Active Directory (AD) information initially, and they executed some 'net' commands on the compromised device. 
The significant aspect of deploying MDI is the ability to visualize the detection of what is happening on the compromised device in terms of identity. 
However, if you have MDE (endpoint protection), it is also possible to see all commands that were executed by attackers. In the end, you will be able to see alerts generated by MDI and MDE.

At this time, I simulated [a ninja.ps1](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/ProductResearch-Note-Folder/Day01-MDE-MDI-BetterTogether-Part1.md#simulation) script that executed some 'net' commands with base64 encoding on a compromised device, 
which is already a domain-joined device managed by on-premises AD and protected by MDE. 
After a few minutes, 1 incident (which is correlated with 3 alerts generated from MDE & MDI) appeared on Incident page on Microsoft Defender XDR portal and let’s take a look each important points.

#### Incident, XDR correlation
| Alert title | Source   | Description |
|:------------|:---------|:------------|
| User and group membership reconnaissance (SAMR) | MDI | David Ninja on Win11CC sent suspicious SAMR queries to Svr2016, searching for: all users and all groups in mdipoc.com, and also 2 sensitive groups. |
| Anomalous account lookups | MDE | An anomalous chain of attempts to look up user account information has been observed. An attacker might be gathering information about potential targets.| 
| Suspicious sequence of exploration activities | MDE| A process called a set of windows commands. These commands can be used by attackers in order to identify assets of value and coordinate lateral movement after compromising a machine.| 
> Details of the generated alerts in the incident

Notably, the capability to correlate alerts from different Defender products into a single incident is one of the powerful features in Microsoft Defender XDR. 
Thanks to this capability, the page provides information on how many alerts were generated in this attack and displays related entities with a comprehensive graph. 
Furthermore, for taking further actions, Microsoft Defender XDR captures all related assets, such as accounts and devices involved in this attack.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/5c2ebf8f-09ab-4336-838c-301da379eb75)
> Incident page : Discovery incident on one endpoint reported by multiple sources 

#### MDI alert
Regarding identity detection, MDI generated an alert related to reconnaissance, providing a high-level overview, attack details, and a graph. 
The attacker (from the compromised device) executed suspicious SAMR queries to the server, searching all users, groups, Domain Admins, and Schema Admins

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/562f108f-c254-404f-a9c7-0f51d62b0e9a)
> MDI alert : User and group membership reconnaissance (SMAR)

#### MDE alerts
Another benefit of deploying MDE is the ability to capture device-level activities. Unlike MDI alerts, MDE alerts provide details of executed commands on the compromised device. 
This capability allows for the visualization of all command activities chronologically in the alert story and the mapping of all related entities, such as a suspicious PowerShell script, as highlighted in 'Ninja.ps1'.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/641c457c-9dd6-4dba-a921-901b2cb6d3cd)
> MDE alert : Anomalous account lookups, executed commands

MDE can capture a PowerShell script mapping to MITRE ATT&CK™ techniques. 
During my simulation, specifically focused on reconnaissance, we observed several tactics of discovery and a few executions.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/189ca17a-bc7f-40c8-9cd1-464a0002cee8)
> MDE alert: Suspicious sequence of exploration activities

## Hunting with KQL
Because the compromised device was protected by MDE, it captured net command activities and stored them in the DeviceProcessEvents table. In the end, by writing a query, you can see all net command activities in Advanced Hunting.

```kusto
DeviceProcessEvents
| where Timestamp > ago(7d)
| where FileName == "net.exe"
| where ProcessCommandLine has_any ("/domain", "user", "group")
| summarize CmdList = make_set(strcat(format_datetime(Timestamp,'yyyy-M-dd H:mm:ss'), " : ", ProcessCommandLine)) by DeviceId, DeviceName
| extend Case = array_length(CmdList)
| project DeviceId, DeviceName, Case, CmdList
| order by Case desc 
```
> GitHub : LearningKijo/KQL - [Endpoint-NetExeListing-Reconnaissance.yaml](https://github.com/LearningKijo/KQL/blob/main/KQL-XDR-Hunting/Endpoint-Microsoft-Defender-for-Endpoint/Endpoint-NetExeListing-Reconnaissance.yaml)

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/8aefd6d0-2c15-432a-9f49-2db312203136)
>  Advanced Hunting :  tracking net command activities

## Simulation 
```powershell
# Run net user /domain
Invoke-Expression ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("bmV0IHVzZXIgL2RvbWFpbg==")))

# Run net group /domain
Invoke-Expression ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("bmV0IGdyb3VwIC9kb21haW4=")))

# Run net group "Domain Admins" /domain
Invoke-Expression ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("bmV0IGdyb3VwICJEb21haW4gQWRtaW5zIiAvZG9tYWlu")))

# Run net group "Enterprise Admins" /domain
Invoke-Expression ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("bmV0IGdyb3VwICJFbnRlcnByaXplIEFkbWlucyIgL2RvbWFpbg==")))

# Run net group "Schema Admins" /domain
Invoke-Expression ([System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String("bmV0IGdyb3VwICJTY2hlbWEgQWRtaW5zIiAvZG9tYWlu")))
```


#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

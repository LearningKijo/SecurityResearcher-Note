# Day 4 - Mango Sandstorm Attack techniques & insights

While I am tracing back the history of Mango Sandstorm, formerly known as MERCURY, I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response.

|#|Title|About|
|:---|:---|:---|
| Part 1 | [Day4-Mango-Sandstorm-Part1-Overview.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part1-Overview.md)   | Mango Sandstorm overview |
| Part 2 | [ Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md)  |August 25, 2022, Mango Sandstorm |
| Part 3 | Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md |April 7, 2023, Mango Sandstorm & Storm-1084 |

## April 7, 2023, Mango Sandstorm

#### Short Summary

Mango Sandstorm, previously known for using Log4j 2 exploits and targeting on-premises environments, has now expanded its focus to include both on-premises and cloud environments. After gaining initial access through known vulnerabilities, the attack has been linked to Storm-1084 (formerly known as DEV-1084).

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/ee623697-5a31-48fe-933a-85fa360ef3c1)

> [!Note]
> [MERCURY and DEV-1084: Destructive attack on hybrid environment](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/)


#### How has Mango Sandstorm changed compared to its previous activities?
Previously, Mango Sandstorm was observed primarily in on-premise environments. However, they have now expanded their activities to include ***cloud environments*** as well. 
Additionally, there is strong suspicion that  Mango Sandstorm is linked to ***Storm-1084***, according to Microsoft.


####  What is Storm-1084?
According to Microsoft, DEV-1084 publicly adopted the DarkBit persona and presented itself as a criminal actor interested in extortion. 
This was likely done as an attempt to obfuscate Iran's link to and strategic motivation for the attack.
> [!Note]
> DarkBit - a new ransomware

#### Are there any evidences linking Storm-1084 to Mango Sandstorm?
- The email's IP address (146.70.106[.]89) is linked to Mango Sandstorm.
- Both were observed to use the same VPN service.
- Both were observed to use the same tools such as Rport and Ligolo.
- vatacloud[.]com, the command and control, used by Storm-1084, is controlled by Mango Sandstorm.

#### How do they conduct attacks on on-premise environments?
The initial access and lateral movement techniques employed in this attack are similar to the previous Mango Sandstorm technique. 
The attackers compromised the on-premise environment by leveraging Group Policy Objects (GPOs) to ***disable security tools like antivirus.***
They also used GPO to ***create a scheduled task for delivering ransomware.*** The ransomware payload was placed in the NETLOGON shares on domain controllers. 
Ultimately, the attackers encrypted files on targeted devices and left ransom notes.

#### What types of attacks were conducted in the cloud environment?
- Email impersonation
- Email dump using Exchange Web Server API
- Mass Azure resources deletion

## KQL : IoCs-Based Threat Hunting
Here is an out-of-the-box KQL query to hunt for Mango SandStorm with Storm-1084. IOCs are available from Microsoft blog - [MERCURY and DEV-1084: Destructive attack on hybrid environment](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/).
#### IOCs csv file : [MangoSandstorm-Storm-1084-IOCs-042023.csv](https://github.com/LearningKijo/KQL/blob/main/KQL-XDR-Hunting/ThreatHunting/IOCs-Folder/MangoSandstorm-Storm-1084-IOCs-042023.csv)
```kql
// IoCs - MERCURY and DEV-1084: Destructive attack on hybrid environment
let MangoSandstorm = externaldata(Indicator:string, Type:string, Description:string)
[@'https://raw.githubusercontent.com/LearningKijo/KQL/main/KQL-XDR-Hunting/ThreatHunting/IOCs-Folder/MangoSandstorm-Storm-1084-IOCs-042023.csv'] with (format='csv', ignorefirstrecord = true);
let Domains = (MangoSandstorm | where Type == "Domain"| project Indicator);
let IPaddress = (MangoSandstorm | where Type == "IP address"| project Indicator);
let SHA256hash = (MangoSandstorm | where Type == "SHA-256"| project Indicator);
(union isfuzzy=true
(DeviceNetworkEvents
| where Timestamp > ago(1d)
| where RemoteUrl has_any (Domains) or RemoteIP in (IPaddress) 
| project Timestamp, DeviceId, DeviceName, ActionType, RemoteUrl, RemoteIP, RemotePort, InitiatingProcessFileName
),
(DeviceFileEvents
| where Timestamp > ago(1d)
| where SHA256 in~ (SHA256hash)
| project Timestamp, DeviceId, DeviceName, ActionType, FileName, FileSize, FolderPath, SHA256
),
(DeviceProcessEvents
| where Timestamp > ago(1d)
| where SHA256 in~ (SHA256hash)
| project Timestamp, DeviceId, DeviceName, ActionType, FileName, FileSize, FolderPath, SHA256, ProcessCommandLine, InitiatingProcessCommandLine
),
(DeviceImageLoadEvents
| where Timestamp > ago(1d)
| where SHA256 in~ (SHA256hash)
| project Timestamp, DeviceId, DeviceName, ActionType, FileName, FileSize, FolderPath, SHA256, InitiatingProcessFileName, InitiatingProcessCommandLine
)
)
```

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

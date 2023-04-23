# Day 2 - APT29, Midnight Blizzard (YTTRIUM) 
> 📢 April 18, 2023 - Microsoft has changed its naming taxonomy for threat actors, moving away from using element symbols to using [weather-related names](https://www.microsoft.com/en-us/security/blog/2023/04/18/microsoft-shifts-to-a-new-threat-actor-naming-taxonomy/). APT29 attack was named Midnight Blizzard in Microsoft's new naming taxonomy for threat actors. In this blog, I will use the name "YTTRIUM" instead of Midnight Blizzard.


## What is YTTRIUM ? 
YTTRIUM is a codename that Microsoft has given to a specific activity group believed to be part of APT29 or Cozy Bear, a Russian state-sponsored advanced persistent threat group known for its cyber espionage activities. This group is known for using advanced hacking techniques, including spear phishing, zero-day exploits, and social engineering tactics to target government agencies, critical infrastructure, and other high-profile organizations.

> **Note** : Microsoft Security blog - "Third-party security researchers have attributed the attack to a threat actor named APT29 or CozyBear, which largely overlaps with the activity group that Microsoft calls YTTRIUM"

### What is the difference between Yttrium and Nobelium?
Yttrium and Nobelium are two separate threat groups that have been linked to **APT29 (Cozy Bear) in the past**, but they are not the same group. Also, the two groups are believed to have different tactics, techniques, and procedures (TTPs) and may target different types.


## YTTRIUM Attack Chain 
APT29, also known as YTTRIUM, initiated their cyber attack through a combination of **spear-phishing email attacks** and **social engineering**. The malicious links in the emails, if clicked by the recipients, led to a series of exploits that ultimately resulted in the installation of a DLL backdoor. This backdoor gave the attackers remote access to the victims' machines.
  
<img src="https://user-images.githubusercontent.com/120234772/228781349-a582f5e1-9721-404f-ae49-b15787592d64.png" width="70%">

> [Analysis of cyberattack on U.S. think tanks, non-profits, public sector by unidentified attackers](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/)

#### Regarding compromised website, was the email link initially not malicious?
Yes, that's correct. The attackers compromised a legitimate website that was not originally malicious. By doing so, the attackers were able to host their malicious code on the website and deliver it to unsuspecting visitors.

#### Did email security tools prevent the initial malicious link used in the APT29 attack?
Some mail security tools were able to identify the spear-phishing email used in the APT29 attack at the time, but not all security tools could do so. It depends on the specific tool being used. Nowadays, most security tools have improved their detection capabilities and would likely be able to identify similar attacks.
  
#### What is LNK file?
LNK is a file extension used for Windows Shortcut Files. It is a file format used by Windows to create shortcuts to files, folders, or programs. In APT29 attacks, attackers can craft LNK files that appear legitimate but actually point to malicious code or websites.

#### What is Cobalt Strike?
It is a penetration testing tool. In Cobalt Strike, a local named pipe is created with the format [**\\.\pipe\MSSE-<number>-server, where \<number>**] is a random number between 0 and 9897. Then, the attacker connects to the named pipe and sends global data with size 0x3FE00. Finally, the attacker uses this named pipe to implement a backdoor, giving them access to the compromised system.

![image](https://user-images.githubusercontent.com/120234772/229047009-be2be785-b3c8-4759-9960-ffc14a79b1a3.png)
> Cobalt Strike, [Analysis of cyberattack on U.S. think tanks, non-profits, public sector by unidentified attackers](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/)
  
## KQL : Hunting
In the [Microsoft Security blog](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/), they provide excellent hunting queries for APT29 (YTTRIUM). However, the tables they used appear to be outdated. Therefore, I updated these queries using the latest tables to track them down. Additionally, I highlighted some IoC that were covered in the out-of-the-box queries provided in the blog.
  
#### YTTRIUM IoC
```kql
 SHA1 = "9858d5cb2a6614be3c48e33911bf9f7978b441bf"
 SHA1 = "cd92f19d3ad4ec50f6d19652af010fe07dca55e1"
 RemoteUrl = "pandorasong.com"
 RemoteIP = "95.216.59.92"
 ProcessCommandLine contains "https://www.jmj.com/personal/nauerthn_state_gov" 
 ProcessCommandLine contains "-noni -ep bypass $zk=' JHB0Z3Q9MHgwMDA1ZTJiZTskdmNxPTB4MDAwNjIzYjY7JHRiPSJkczcwMDIubG5rIjtpZiAoLW5vdChUZXN0LVBhdGggJHRiKSl7JG9lPUdldC1DaGlsZEl0" 
```

#### Advanced hunting query 
```kql
//Query 1: Events involving the DLL container
let fileHash = "9858d5cb2a6614be3c48e33911bf9f7978b441bf";
find in (DeviceFileEvents, DeviceProcessEvents, DeviceEvents, DeviceRegistryEvents, DeviceNetworkEvents, DeviceImageLoadEvents)
where SHA1 == fileHash or InitiatingProcessSHA1 == fileHash
| where Timestamp> ago(10d)

//Query 2: C&C connection
DeviceNetworkEvents
| where Timestamp > ago(10d) 
| where RemoteUrl == "pandorasong.com"
  
//Query 3: Malicious PowerShell
DeviceProcessEvents 
| where Timestamp > ago(10d) 
| where ProcessCommandLine contains "-noni -ep bypass $zk=' JHB0Z3Q9MHgwMDA1ZTJiZTskdmNxPTB4MDAwNjIzYjY7JHRiPSJkczcwMDIubG5rIjtpZiAoLW5vdChUZXN0LVBhdGggJHRiKSl7JG9lPUdldC1DaGlsZEl0" 

//Query 4: Malicious domain in default browser commandline
DeviceProcessEvents 
| where Timestamp > ago(10d) 
| where ProcessCommandLine contains "https://www.jmj.com/personal/nauerthn_state_gov" 
  
//Query 5: Events involving the ZIP
let fileHash = "cd92f19d3ad4ec50f6d19652af010fe07dca55e1";
find in (DeviceFileEvents, DeviceProcessEvents, DeviceEvents, 
DeviceRegistryEvents, DeviceNetworkEvents, DeviceImageLoadEvents)
where SHA1 == fileHash or InitiatingProcessSHA1 == fileHash
| where Timestamp > ago(10d)

// Reference :
// https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/
```
## Reference

MITRE ATT&CK®, [Home > Groups > APT29](https://attack.mitre.org/groups/G0016/) <br>
Microsoft, [MITRE ATT&CK APT 29 evaluation proves Microsoft Threat Protection provides deeper end to end view of advanced threats](https://www.microsoft.com/en-us/security/blog/2020/04/21/mitre-attack-evaluation-prove-microsoft-threat-protection-against-threats/) <br>
Microsoft, [Analysis of cyberattack on U.S. think tanks, non-profits, public sector by unidentified attackers](https://www.microsoft.com/en-us/security/blog/2018/12/03/analysis-of-cyberattack-on-u-s-think-tanks-non-profits-public-sector-by-unidentified-attackers/)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

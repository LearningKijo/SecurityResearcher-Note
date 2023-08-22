# Day 2 - APT29, Midnight Blizzard (NOBELIUM)
> 📢 April 18, 2023 - Microsoft has changed its naming taxonomy for threat actors, moving away from using element symbols to using [weather-related names](https://www.microsoft.com/en-us/security/blog/2023/04/18/microsoft-shifts-to-a-new-threat-actor-naming-taxonomy/). APT29 attack was named Midnight Blizzard in Microsoft's new naming taxonomy for threat actors. In this blog, I will use the name "NOBELIUM" instead of Midnight Blizzard.


## What is NOBELIUM?
NOBELIUM is a Russian state-sponsored hacking group that conducts cyber espionage and attacks against various targets. It was previously known as APT29 or Cozy Bear and is responsible for high-profile attacks such as **the SolarWinds hack**. 

According to ***Microsoft Security blog update***,
> Microsoft continues to work with partners and customers to expand our knowledge of the threat actor behind the nation-state cyberattacks that compromised the supply chain of SolarWinds and impacted multiple other organizations. Microsoft previously used **‘Solorigate’ as the primary designation for the actor**, but moving forward, we want to place appropriate focus on the actors behind the sophisticated attacks, rather than one of the examples of malware used by the actors. **Microsoft Threat Intelligence Center (MSTIC) has named the actor behind the attack against SolarWinds, the SUNBURST backdoor, TEARDROP malware, and related components as NOBELIUM.** As we release new content and analysis, we will use NOBELIUM to refer to the actor and the campaign of attacks.

#### Key words of NOBELIUM
SolarWinds, the SUNBURST backdoor, TEARDROP malware, Supply chain attack, Solorigate 

## NOBELIUM Attack Chain
The attackers added malicious code to the SolarWinds Orion Platform DLL file, which was distributed as part of a software update. The DLL file was digitally signed, indicating that the attackers had access to the company's software development and distribution pipeline. The malicious code created a backdoor, which allowed the attackers to operate in compromised networks without being detected. The backdoor was designed to blend in with the rest of the code, making it difficult to spot. The attackers used a lengthy list of functions and capabilities to perform a wide range of actions, including reconnaissance, privilege escalation, and lateral movement. The attackers took many steps to maintain a low profile, such as using unique subdomains for each affected domain to evade detection.

![image](https://user-images.githubusercontent.com/120234772/230338300-734224cb-f248-47df-8472-18aaa4f0c662.png)
> [Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2020/12/18/analyzing-solorigate-the-compromised-dll-file-that-started-a-sophisticated-cyberattack-and-how-microsoft-defender-helps-protect/), NOBELIUM infection chain

#### The initial proncess
1. The SolarWinds.BusinessLayerHost.exe file is a legitimate file used by the SolarWinds Orion IT management software.
2. The malicious activity was not directly caused by the executable file, but rather by a compromised DLL file that was loaded into the executable.
3. The attackers were able to insert the malicious code into the DLL file during an early stage of the software build, before the final stages that would include digitally signing the compiled code.
4. The compromised DLL file is digitally signed, which enhances its ability to run privileged actions and avoid detection.
5. The malicious code is designed to be lightweight and run in the background, so as not to interfere with the normal operation of the SolarWinds software.
6. Once the malicious code is loaded, it allows the attackers to perform a wide range of actions and move laterally across the network, with the ultimate goal of achieving their objectives, which may include cyber espionage or financial gain.

## Incident Response, Containment
### What if your environment is compromised by APT29 (Nobelium)?
If your environment has been compromised by the Nobelium attack, the first step you should take is **"Containment"**.
Regarding "Containment", if you are using Microsoft Security solutions such as Microsoft Defender for Endpoint (MDE) or Microsoft Defender for Identity (MDI), then take the following actions:
- [Isolate devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#isolate-devices-from-the-network)
- [Contain devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#contain-devices-from-the-network)
- [Reset user account password](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions)
- [Disbale AD user / Azure AD user](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions)
 
If you are not using Microsoft Security solution, then take the following actions:
- Immediately isolate the affected device
- Reset passwords or decommission the accounts

![image](https://user-images.githubusercontent.com/120234772/230063443-8b3f59d1-d3b5-4e69-b667-c7b8e7c2ea21.png)
> NIST 800-61 response management phases
After the containment, move to the investigation and recovery. 

## Preparing for NOBELIUM 
These are **key messages** from Microsoft Defenders.

#### Prioritize cyber hygiene
- Vulnerability management & Patching
- Zero Trust implementation
- Protect your identity, e.g. Enable MFA
- Use secure devices for critical tasks

#### Secure your distributed estate
- Zero Trust implementation
- Need advanced monitoring system tools such as SIEM, XDR and EDR

#### Plan for your response
- Collect data for further investigaton
- Leverage Threat Intelligence for the investigation
- Need well practice/training in incident response specifically for APT29 attacks
- Think about Incident Response plan 
- Think about recovery plan


### Decoding NOBELIUM video: 
1. [Decoding NOBELIUM: When nation-states attack (Episode 1)](https://www.youtube.com/watch?v=VVKT8NehO_c)
2. [Decoding NOBELIUM: The hunt for a global threat (Episode 2)](https://www.youtube.com/watch?v=VVbSYr1cPEE)
3. [Decoding NOBELIUM: Countermeasures (Episode 3)](https://www.youtube.com/watch?v=fS97PC4FLCc)
4. [Decoding NOBELIUM: After-action report (Episode 4)](https://www.youtube.com/watch?v=wFtGD7p58cQ)


## Reference
### Microsoft Security blog -  NOBELIUM :
December 15, 2020, [Ensuring customers are protected from Solorigate](https://www.microsoft.com/en-us/security/blog/2020/12/15/ensuring-customers-are-protected-from-solorigate/)<br>
December 18, 2020, [Analyzing Solorigate, the compromised DLL file that started a sophisticated cyberattack....](https://www.microsoft.com/en-us/security/blog/2020/12/18/analyzing-solorigate-the-compromised-dll-file-that-started-a-sophisticated-cyberattack-and-how-microsoft-defender-helps-protect/)<br>
December 28, 2020, [Using Microsoft 365 Defender to protect against Solorigate](https://www.microsoft.com/en-us/security/blog/2020/12/28/using-microsoft-365-defender-to-coordinate-protection-against-solorigate/)<br>
January 20, 2021, [Deep dive into the Solorigate second-stage activation: From SUNBURST to TEARDROP and Raindrop](https://www.microsoft.com/en-us/security/blog/2021/01/20/deep-dive-into-the-solorigate-second-stage-activation-from-sunburst-to-teardrop-and-raindrop/)<br>
March 4, 2021, [GoldMax, GoldFinder, and Sibot: Analyzing NOBELIUM’s layered persistence](https://www.microsoft.com/en-us/security/blog/2021/03/04/goldmax-goldfinder-sibot-analyzing-nobelium-malware/)<br>
May 27, 2021, [New sophisticated email-based attack from NOBELIUM](https://www.microsoft.com/en-us/security/blog/2021/05/27/new-sophisticated-email-based-attack-from-nobelium/)<br>
May 28, 2021, [BNew sophisticated email-based attack from NOBELIUMreaking down NOBELIUM’s latest early-stage toolset](https://www.microsoft.com/en-us/security/blog/2021/05/28/breaking-down-nobeliums-latest-early-stage-toolset/)<br>
September 27, 2021, [FoggyWeb: Targeted NOBELIUM malware leads to persistent backdoor](https://www.microsoft.com/en-us/security/blog/2021/09/27/foggyweb-targeted-nobelium-malware-leads-to-persistent-backdoor/)<br>
October 25, 2021, [NOBELIUM targeting delegated administrative privileges to facilitate broader attacks](https://www.microsoft.com/en-us/security/blog/2021/10/25/nobelium-targeting-delegated-administrative-privileges-to-facilitate-broader-attacks/)<br>
February 8, 2023, [Solving one of NOBELIUM’s most novel attacks: Cyberattack Series](https://www.microsoft.com/en-us/security/blog/2023/02/08/solving-one-of-nobeliums-most-novel-attacks-cyberattack-series/)


### Decoding NOBELIUM blog :
1. [How nation-state attackers like NOBELIUM are changing cybersecurity](https://www.microsoft.com/en-us/security/blog/2021/09/28/how-nation-state-attackers-like-nobelium-are-changing-cybersecurity/)
2. [The hunt for NOBELIUM, the most sophisticated nation-state attack in history](https://www.microsoft.com/en-us/security/blog/2021/11/10/the-hunt-for-nobelium-the-most-sophisticated-nation-state-attack-in-history/)
3. [Behind the unprecedented effort to protect customers against the NOBELIUM nation-state attack](https://www.microsoft.com/en-us/security/blog/2021/12/02/behind-the-unprecedented-effort-to-protect-customers-against-the-nobelium-nation-state-attack/)
4. [The final report on NOBELIUM’s unprecedented nation-state attack](https://www.microsoft.com/en-us/security/blog/2021/12/15/the-final-report-on-nobeliums-unprecedented-nation-state-attack/)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

# Day 2 - APT29, NOBELIUM - WIP

### What is NOBELIUM?
NOBELIUM is a Russian state-sponsored hacking group that conducts cyber espionage and attacks against various targets. It was previously known as APT29 or Cozy Bear and is responsible for high-profile attacks such as **the SolarWinds hack**. 

According to ***MIcrosoft Security blog update***,
> Microsoft continues to work with partners and customers to expand our knowledge of the threat actor behind the nation-state cyberattacks that compromised the supply chain of SolarWinds and impacted multiple other organizations. Microsoft previously used ‘Solorigate’ as the primary designation for the actor, but moving forward, we want to place appropriate focus on the actors behind the sophisticated attacks, rather than one of the examples of malware used by the actors. **Microsoft Threat Intelligence Center (MSTIC) has named the actor behind the attack against SolarWinds, the SUNBURST backdoor, TEARDROP malware, and related components as NOBELIUM.** As we release new content and analysis, we will use NOBELIUM to refer to the actor and the campaign of attacks.

#### Key words of NOBELIUM
SolarWinds, the SUNBURST backdoor, TEARDROP malware, Supply chain attack, Solorigate 

## NOBELIUM Attack Chain
![image](https://user-images.githubusercontent.com/120234772/230338300-734224cb-f248-47df-8472-18aaa4f0c662.png)
> [Microsoft Security Blog](https://www.microsoft.com/en-us/security/blog/2020/12/18/analyzing-solorigate-the-compromised-dll-file-that-started-a-sophisticated-cyberattack-and-how-microsoft-defender-helps-protect/), NOBELIUM infection chain

## Incident Response, Containment
### What if your environment is compromised by APT29 (Nobelium)?
If your environment has been compromised by the Nobelium attack, the first step you should take is **"Containment"**.
Regarding "Containment", if you are using Microsoft Security solutions such as Microsoft Defender for Endpoint (MDE) or Microsoft Defender for Identity (MDI), then take the following actions:
- [Isolate devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#isolate-devices-from-the-network)
- [Contain devices from the network](https://learn.microsoft.com/en-us/microsoft-365/security/defender-endpoint/respond-machine-alerts?view=o365-worldwide#contain-devices-from-the-network)
- [Reset user account password](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions)
- [Disbale AD user / Azure AD user](https://learn.microsoft.com/en-us/defender-for-identity/remediation-actions)
 
If you are not using Microsoft Security solution, then take the following actions:
- Immediately isolate the affected device. 
- Reset passwords or decommission the accounts.[

![image](https://user-images.githubusercontent.com/120234772/230063443-8b3f59d1-d3b5-4e69-b667-c7b8e7c2ea21.png)


> NIST 800-61 response management phases

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

### Decoding NOBELIUM video: 
1. [Decoding NOBELIUM: When nation-states attack (Episode 1)](https://www.youtube.com/watch?v=VVKT8NehO_c)
2. [Decoding NOBELIUM: The hunt for a global threat (Episode 2)](https://www.youtube.com/watch?v=VVbSYr1cPEE)
3. [Decoding NOBELIUM: Countermeasures (Episode 3)](https://www.youtube.com/watch?v=fS97PC4FLCc)
4. [Decoding NOBELIUM: After-action report (Episode 4)](https://www.youtube.com/watch?v=wFtGD7p58cQ)

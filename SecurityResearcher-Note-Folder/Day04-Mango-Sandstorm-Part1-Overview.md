# Day 4 - Mango Sandstorm Overview
While I am tracing back the history of Mango Sandstorm, formerly known as MERCURY, I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response.

|#|Title|About|
|:---|:---|:---|
| Part 1 | Day4-Mango-Sandstorm-Part1-Overview.md **<we are here !!>**  | Mango Sandstorm overview |
| Part 2 | [Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md)  |August 25, 2022, Mango Sandstorm |
| Part 3 | [Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md) |April 7, 2023, Mango Sandstorm & Storm-1084 |

## What is Mango Sandstorm ?
Mango Sandstorm, formerly known as MERCURY, is ***an Iranian-based cyber activity group*** that specializes in sensitive data gathering through advanced cyber attacks, rather than financial gain. Their attack techniques include spear-phishing attacks, exploiting vulnerabilities, malware and social engineering.

To get the detailed insight, Microsoft Defender Threat Intelligence also covers Mango Sandstorm's description, TTP, and IOCs.

![image](https://user-images.githubusercontent.com/120234772/235598610-51723cfb-b598-43bc-ac5c-2c344a384611.png)
> Mango Sandstorm, Microsoft Defender Threat Intelligence

## Mango Sandstorm timeline
#### August 25, 2022
Mango Sandstorm, previously known for using Log4j 2 exploits to attack VMware apps, has recently been targeting SysAid apps using the same technique. Once they gain initial access, the group establishes persistence, moves laterally within the network using custom and well-known hacking tools, and dumps credentials.
> [!Note]
> [MERCURY leveraging Log4j 2 vulnerabilities in unpatched systems to target Israeli organizations](https://www.microsoft.com/en-us/security/blog/2022/08/25/mercury-leveraging-log4j-2-vulnerabilities-in-unpatched-systems-to-target-israeli-organizations/)


#### April 7, 2023
Mango Sandstorm, previously known for using Log4j 2 exploits and targeting on-premises environments, has now expanded its focus to include both on-premises and cloud environments. After gaining initial access through known vulnerabilities, the attack has been linked to Storm-1084 (formerly known as DEV-1084).
> [!Note]
> [MERCURY and DEV-1084: Destructive attack on hybrid environment](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/)

## Mango Sandstorm associated groups
There are several groups associated with APT29, and each group uses different attack techniques. 
- Earth Vetala
- Mango Sandstorm (MERCURY)
- Static Kitten
- Seedworm
- TEMP.Zagros
- MuddyWater

## Mango Sandstorm attack techniques

### The most common attack techniques
- Spear-phishing email
- Use of cloud file-sharing services
- Use of commercial remote access applications
- Tooling: Venom proxy tool, Ligolo reverse tunneling, and home-grown PowerShell programs
- Exploiting vulnerabilities
- Social engineering
- Watering hole attacks
- Backdoor installation
- Lateral movement

### MITRE ATT&CK MuddyWater attack map
![image](https://user-images.githubusercontent.com/120234772/236394767-4a35fec6-0897-48ae-bfa3-e22db9a5a7ca.png)
> MuddyWater, Techniques Used, [ATT&CK® Navigator](https://mitre-attack.github.io/attack-navigator/)


## Reference
1. August 25, 2022, [MERCURY leveraging Log4j 2 vulnerabilities in unpatched systems to target Israeli organizations](https://www.microsoft.com/en-us/security/blog/2022/08/25/mercury-leveraging-log4j-2-vulnerabilities-in-unpatched-systems-to-target-israeli-organizations/)
2. April 7, 2023, [MERCURY and DEV-1084: Destructive attack on hybrid environment](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/)
3. [What is Microsoft Defender Threat Intelligence (Defender TI)?](https://learn.microsoft.com/en-us/defender/threat-intelligence/what-is-microsoft-defender-threat-intelligence-defender-ti)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

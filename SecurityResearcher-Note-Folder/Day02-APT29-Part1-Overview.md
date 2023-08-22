# Day 2 - APT29 Overview
While I am tracing back the history of the APT29 attack(YTTRIUM), I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response. Therefore, I will cover 4 points regarding APT29 attacks, which are as follows:

1. What is APT29 attack
2. What is the main objective of APT29
3. APT29 associated groups
4. APT29 attack techniques

### APT29 attack blogs 
|# | Title| About|
|:---|:---|:---|
|1 | Day2-APT29-Overview.md  **<we are here !!>**| Talk about APT29 attack overview |
|2 | [Day2-APT29-Part2-Midnight-Blizzard.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part2-Midnight-Blizzard.md)| Talk about APT29/Midnight-Blizzard(previously YTTRIUM)  |
|3 | [Day2-APT29-Part3-Midnight-Blizzard.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part3-Midnight-Blizzard.md)| Talk about APT29/Midnight-Blizzard(previously NOBELIUM) |
|4 | [Day2-APT29-Part4-Midnight-Blizzard-MDE-EvaluationLab.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part4-Midnight-Blizzard-MDE-EvaluationLab.md) | Talk about APT29/Midnight-Blizzard with demo|

## What is APT29 attack ?
APT29 (Advanced Persistent Threat 29), also known as Cozy Bear, is a cyber espionage group believed to be operating on behalf of the Russian government
that has been involved in high-profile cyber attacks against various targets, including government agencies and critical infrastructure. The group is known for using advanced hacking techniques, such as spear phishing and zero-day exploits, as well as social engineering tactics. 

## What is the main objective of APT29 ? 
> What is the main objective of APT29 ? <br>
> Is it to break the IT environment, obtain money, or steal personal information?

Probably, the main objective of APT29, also known as Cozy Bear, is believed to be espionage and intelligence gathering for the Russian government. Their targets have included government entities, defense contractors, and research organizations, among others. While financial gain may be a secondary objective, their primary focus is on collecting sensitive information and intellectual property.

## APT29 associated groups 
There are several groups associated with APT29, and each group uses different attack techniques. 
- IRON RITUAL
- IRON HEMLOCK
- NobleBaron
- Dark Halo
- StellarParticle
- Midnight Blizzard	(NOBELIUM, YTTRIUM) 
- UNC2452 
- The Dukes 
- Cozy Bear
- CozyDuke.	
>**Note** : [MITRE ATT&CK | APT29 ](https://attack.mitre.org/groups/G0016/)

## APT29 attack techniques
### The most common attack techniques 
1. Spear-phishing emails
2. Watering hole attacks
3. Zero-day exploits
4. Remote access tools <Gh0st RAT>
5. Malware attacks <CozyDuke Hammertoss and SeaDuke>

Overall, APT29 is a highly sophisticated threat group that uses a combination of social engineering, advanced hacking techniques, and custom malware to gain access to target systems and steal sensitive information.

### MITRE ATT&CK APT29 attack map
In the Cybereason blog, APT29 attack techniques are captured very well using the MITRE ATT&CK framework.
  
![image](https://user-images.githubusercontent.com/120234772/231052172-59b042b9-996a-4539-b6f3-09f493ad936e.png)
> APT29 Evaluation: Technique scope. Credit: MITRE ATT&CK, [Cybereason](https://www.cybereason.com/blog/understanding-the-mitre-attck-apt29-round-2-evaluation)
  
#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

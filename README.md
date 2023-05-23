
![image](https://user-images.githubusercontent.com/120234772/227476104-68f94c3d-7ff9-4e69-99fb-f4828486e289.png)

### Welcome to @SecurityResearcher-Note
In this repository, I will cover various security approaches to attack techniques and share new discoveries about security breaches. Through the new discoveries and learnings shared in this repository, I hope to provide helpful insights  for those involved in security operations, hunting, incident response, and more.
## SecurityResearcher-Note
| Day | Note |
|:---|:---|
| Day1 | [Day1-Basic-Malware-Analysis.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day1-Basic-Malware-Analysis.md) |  
| Day2 | [Day2-APT29-Part1-Overview.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part1-Overview.md)<br> [Day2-APT29-Part2-Midnight-Blizzard.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part2-Midnight-Blizzard.md)<br> [Day2-APT29-Part3-Midnight-Blizzard.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part3-Midnight-Blizzard.md)<br> [Day2-APT29-Part4-Midnight-Blizzard-MDE-EvaluationLab.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day2-APT29-Part4-Midnight-Blizzard-MDE-EvaluationLab.md)  | 
| Day3 | [Day3-Microsoft-ThreatActorNamingTaxonomy.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day3-Microsoft-ThreatActorNamingTaxonomy.md) | 
| Day4 | [Day4-Mango-Sandstorm-Part1-Overview.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part1-Overview.md) <br> [Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md) <br> Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md (WIP) |
| Day5 | Day5-EPP(WIP) |

## Topics
```kql      
let SecurityResearcher-Note = datatable(id: int, value: string)
[
      1, "Malware analysis", 
      2, "Incident Response", 
      3, "Threat Hunting", 
      4, "New Attack techniques",
      5, "Critical vulnerabilities"
      6, "Kusto Query Language", 
];
SecurityResearcher-Note
| project id, value
```
#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

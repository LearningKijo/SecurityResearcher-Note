## Day 4 - Mango Sandstorm Attack techniques & insights

While I am tracing back the history of Mango Sandstorm, formerly known as MERCURY, I have a few questions, and I hope that these questions and my curiosity will help someone with their security incident response.

|#|Title|About|
|:---|:---|:---|
| Part 1 | [Day4-Mango-Sandstorm-Part1-Overview.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part1-Overview.md)   | Mango Sandstorm overview |
| Part 2 | [ Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day4-Mango-Sandstorm-Part2-AttackTechniques-Insights.md)  |August 25, 2022, Mango Sandstorm |
| Part 3 | Day4-Mango-Sandstorm-Part3-AttackTechniques-Insights.md (wip) |April 7, 2023, Mango Sandstorm & Storm-1084 |

## April 7, 2023, Mango Sandstorm

#### Short Summary

Mango Sandstorm, previously known for using Log4j 2 exploits and targeting on-premises environments, has now expanded its focus to include both on-premises and cloud environments. After gaining initial access through known vulnerabilities, the attack has been linked to Storm-1084 (formerly known as DEV-1084).

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/ee623697-5a31-48fe-933a-85fa360ef3c1)

> **Note** : [MERCURY and DEV-1084: Destructive attack on hybrid environment](https://www.microsoft.com/en-us/security/blog/2023/04/07/mercury-and-dev-1084-destructive-attack-on-hybrid-environment/)


#### How has Mango Sandstorm changed compared to its previous activities?
Previously, Mango Sandstorm was observed primarily in on-premise environments. However, they have now expanded their activities to include cloud environments as well. 
Additionally, there is strong suspicion that  Mango Sandstorm is linked to Storm-1084, according to Microsoft.

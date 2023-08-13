# Day 10 - XDR Incident Response insights
When organizations purchase E5 security, their first challenge is often product deployment. However, ***the next significant challenge arises in "security operations"***, particularly dealing with daily incident response. While Microsoft provides detailed insights and various features, SOC teams might feel overwhelmed when alerts and incidents are generated in their environment. 

When alerts/incidents were generated in your tenant, some people may have the following concerns and challenges.

1. ***No idea where to start the investigation...***
2. ***Where exactly do I have to look ?***
3. ***What kind of options do I have ?***
4. ***What capabilities can I leverage in XDR ?***


In light of this, I aim to expand their understanding in ***XDR*** and ***Microsoft 365 Defender*** to help them overcome these challenges.
Therefore, in this blog, I am going to explore the power of XDR, Microsoft 365 Defender and now let's start with Part 1.

| #    | Title | About | 
|:-----|:----- |:------|
|1     | [XDR overview](https://github.com/LearningKijo/SecurityResearcher-Note/blob/main/SecurityResearcher-Note-Folder/Day9-XDR-Insights-part1.md)  | This blog is for people who are not aware of XDR. <br> It aims to start the journey of exploring XDR, specifically Microsoft 365 Defender. |
|2     | XDR Incident Response ***<we are here !!>***  | This blog focuses on Incident Response in the Microsoft 365 Defender portal. <br> Part 1 covers the fundamentals, while ***Part 2 delves into core incident investigation.*** |
|3     | XDR  Incident Response | This blog focuses on Incident Response in the Microsoft 365 Defender portal. <br> Part 1 covers the fundamentals, while ***Part 3 delves into core incident response.*** | 

## Incident response in Microsoft 365 Defender 

To effectively utilize Microsoft 365 Defender, please keep in mind the following two concepts when you receive alerts and incidents in your tenant.

| #    | Step        |     ToDo                                                    |
|:-----|:------------|:------------------------------------------------------------| 
|  1   | Investigate | - Contain compromised assets <br> - Investigate incidents | 
|  2   | Response    | - Eradication & Recovery <br> - Extend investigation      | 
> **Note**
>
> Step 2, Response part, will be covered in Part 3. [SOON]

###  1. Investigate
When alerts/incidents were generated in your tenant, firstly what you have to do is to understand ***a holistic view of the generated incident***.
- [ ] Confirm how and where the attack started.
- [ ] How far the attack has gone into your tenant.
- [ ] Identify & Contain compromised assets, such as devices, users, mailboxes, apps and more.

  
>**Warning**
> 
> Instead of looking at the alert page initially, focus on ***the incident page***. This is because numerous alerts may not be mapped as a single incident, potentially overwhelming the SOC team.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/847ad975-76d2-4990-817e-03c569f0ba4d)

#### How far the attack has gone into your tenant 
When it comes to "Investigate", it's important to grasp a holistic view of the generated incident.
***In other words, you don't need to deeply understand the detailed information of processes, files, registries, and device activities originating from individual alerts at this stage.***
This provides preliminary and useful information before proceeding with actions in the containment process.

The following are important checkpoints to understand the holistic view of the incident.
- XXXXXX
- XXXXXX
- XXXXXX

> Pic



###  2. Response 
# MDO File Detonation & Deep Analysis insight
Hello, all defenders and threat hunters, and thank you for visiting my product research note. 
Most of the questions I receive regarding Microsoft Defender for Office 365 (MDO) relate to sandbox analysis, specifically, what we refer to as ***'File Detonation & Deep Analysis'***. 
For instance, there's curiosity about whether MDO genuinely examines an attachment within a sandbox environment, and if detonation indeed takes place. 
Additionally, there's a common inquiry about how one can test and validate that this process is functioning as intended. 
Therefore, today, I am thrilled to share insights into File Detonation & Deep Analysis, specifically focusing on Safe Attachments in MDO.

## Sample HTML Files 
To validate File Detonation & Deep Analysis initially, I created [some simple HTML-based attachments](https://github.com/LearningKijo/ResearchDev/tree/main/DEV01-RedirectAttachment). 
There are three different types of attachments, all functioning similarly — redirecting to a malicious download site after being opened for 5 seconds. 
The distinction lies in their respective HTML appearances.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/8d72c037-b3bf-4409-82ab-f7804ef0998d)

> HTML file templates

At this point, I utilized [DEV01-Attachment-Type1.html](https://github.com/LearningKijo/ResearchDev/blob/main/DEV01-RedirectAttachment/DEV01-HTML/DEV01-Attachment-Type1.html) and sent an email to the targeted user with the attachment.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/181c09a7-d0d4-476b-95cc-11449c9dc5ea)

## Result - MDO Email Entity Page 
After a few minutes, MDO successfully detected the email as suspicious and moved it to quarantine. 
When you examine the "Detection technology" section, you can see ***"File Detonation"***, confirming that the email was flagged as a result of "File Detonation". 
I would also like to share the official document here to provide the definition of "File Detonation".

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/0b1279d2-dba4-4abd-bb98-006e3467d015)

> [!Note]
> ***File detonation : Safe Attachments detected a malicious attachment during detonation within a sandbox*** <br>
> [Understanding detection technology in the email entity page of Microsoft Defender for Office 365](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/step-by-step-guides/understand-detection-technology-in-email-entity?view=o365-worldwide)

Continuously, when examining the Attachments tab in the Email Entity page, you will find detailed information about the attachment, including general details such as Verdict, Hash/File IoC, Size, Analysis time, and more. 
Moreover, you can also access 'Deep Analysis,' providing insights into how the HTML file appears after the end-user clicked on it, including captured UI snapshots.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/bcb2ece6-7754-49b1-bf3f-2f82b3e49182)

Upon scrolling down the Deep Analysis page, you'll find a detailed list of all relevant URLs, IPs, and Hashes associated with the attachment. 
It's worth mentioning that while not all observables may be flagged as suspicious, similar to the Deep Analysis feature in MDE, the file is initially treated as potentially suspicious. Therefore, we can analyze how this file is likely to behave by examining the valuable insights collected.

![image](https://github.com/LearningKijo/SecurityResearcher-Note/assets/120234772/49fbf701-f984-413f-a306-e50e9523f22c)

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.

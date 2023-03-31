## Objective for static analysis  
<!--　------------------------------------------------------------------ -->
Static Analysis is to analyze the executable file without running it and collect key information from the file such as String, Dll, Function and so on. In order to do static analysis, there are a number of useful tools and I am going to use Pestudio at this time. In addition, I found the great explanation about static analysis in SANS blog.

> Static Properties Analysis: 
> Examine metadata and other details embedded in the file (e.g., strings) without running it, 
> so you can spot the areas you might want to examine more deeply in subsequent steps. <br>
[How You Can Start Learning Malware Analysis | SANS Institute!](https://www.sans.org/blog/how-you-can-start-learning-malware-analysis/?utm_medium=Social&utm_source=LinkedIn&utm_content=CM%20DFIR%20blog&utm_campaign=FOR610&fbclid=IwAR2j69SyYXaHtrqBcoXYOqcX9YPSJs6tm-mqSqNkQ7JGw6707MZFxuEjzSg)


## Check points when you analyze PE file in Pestudio or other tools 
 ▪ Filetype <br> 
 ▪ Packers <br>
 ▪ Timestamps <br>
 ▪ Dll (Libraries) <br>
 ▪ Function (Imports / Exports) <br>
 ▪ Strings <br>

## Static Analysis Tools 
- Pestudio (https://www.winitor.com/download)
- Virtustotal (https://www.virustotal.com/gui/home/search)

## Reference
- [How You Can Start Learning Malware Analysis | SANS Institute](https://www.sans.org/blog/how-you-can-start-learning-malware-analysis/?utm_medium=Social&utm_source=LinkedIn&utm_content=CM%20DFIR%20blog&utm_campaign=FOR610&fbclid=IwAR2j69SyYXaHtrqBcoXYOqcX9YPSJs6tm-mqSqNkQ7JGw6707MZFxuEjzSg)
- [PeStudio Standard. I meant to write this post a long time… | by Matthew Aubert | Medium](https://medium.com/@aubsec/pestudio-standard-f2ada4e8564)

## Static Analysis report
### Step 1 - Download malware
At first, I downloaded a test malware - [Trojan.GenericKD.40436037] from https://das-malwerk.herokuapp.com/ <br>
After downloading it, I extracted a zip file on sandbox environment. 
![image](https://user-images.githubusercontent.com/120234772/208031055-2bea8f0a-6baa-4c84-8aa9-db09e598d56c.png) <br>
> Figure 1. extracted a zip file <br>
<br>

<!--　------------------------------------------------------------------ -->
### Step 2 - Analyze PE file format & overview 
I opened the PE file in Pestudio and found out some useful information as follows:
```
FileType   : Executable, 4D 5A MZ
Packers    : Microsoft.NET
Timestamps : Wed Aug 29 15:24:39 2018 | UTC
MD5        : 74622fbc3aae349b7771709444183314
SHA1       : 9dcada7455205b44b5fe69f765caecca4f14403c
SHA256     : 785872bbef35d86fe6ce8a53be29995cfd0f251d2a171145bd6685bebe63ebc8
```

<br>

<img src="https://user-images.githubusercontent.com/120234772/208003867-d8858bfd-584b-4c21-9bc8-b7e3e1cfb5a2.png" width="900px"> <br>
> Figure 2. PE file overview in Pestudio 
<br>

<!--　------------------------------------------------------------------ -->
### Step 3 - Analyze PE file in VirusTotal
By using Virustotal, you can confirm threat detections and compare it with various antivirus tool such as McAfee, Paloalto, Symantec and so on. In Pestudio, you can confirm the result of VirusTotal and it showed - VirusTotal (61/72).  

```
Ex) Microsoft : Trojan:Win32/Fareit!ml 
- Type : Trojan
- Platform :Win32
- Family : Fareit
- Variant : - 
- !Suffixes :  !ml
```
MS docs : https://www.microsoft.com/en-us/wdsi/threats/malware-encyclopedia-description?Name=Trojan:Win32/Fareit!ml
<br>

![image](https://user-images.githubusercontent.com/120234772/208032864-a3c45897-7d8a-4699-8ca8-62b4221989f9.png)
> Figure 3. Virustotal result (61/72) in Pestudio
<br>

<!--　------------------------------------------------------------------ -->
### Step 4 - Find out suspicious Dll and Function activities 
In order to see dll and function, go to [libraries] and [imports] in Pestudio. At this time, I found 4 interesting information as follows:
```
- mscoree.dll
- SecuritySafeCriticalAttribute
- IEvidenceFactory
- badabingboom.exe
```
Here is my observation from library, Import, .NET and Strings. At first, I can see mscoree.dll in libraries (See Figure.5) and this should be a core engine for .NET. Therefore, the malware might be created by .NET framework. Regarding imports, badabingboom.exe is suspicious (See Figure 6) and some related elements were also discovered (See Figure 6). In order to do something in badabingboom.exe, at this time, SecuritySafeCriticalAttribute and IEvidenceFactory could be used(See Figure 5).
In addition, information related to "badabingboom.exe" has been seen .NET and Strings (See Figure 7 and Figure 8).
<br>
 
 MS docs <br>
▪ [SecuritySafeCriticalAttribute Class (System.Security) | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/api/system.security.securitysafecriticalattribute?view=net-7.0) <br>
▪ [IEvidenceFactory Interface (System.Security) | Microsoft Learn!](https://learn.microsoft.com/en-us/dotnet/api/system.security.ievidencefactory?view=netframework-2.0) <br>

![image](https://user-images.githubusercontent.com/120234772/208033668-af4b7565-9e8e-42ce-8c36-82715f474c82.png)
> Figure 4. Captured Dll in Pestudio
<br>

![image](https://user-images.githubusercontent.com/120234772/208034607-986d0047-e3d3-4166-b6c7-8ed4a67faa25.png)
> Figure 5. Captured Functions in Pestudio
<br>

![image](https://user-images.githubusercontent.com/120234772/208035266-3bff3d50-29cc-486a-90b4-bfa28eb3f1cd.png)
> Figure 6. Captured Functions in Pestudio
<br>

![image](https://user-images.githubusercontent.com/120234772/208036105-7a09c796-d5b6-4f5e-8410-6e5f561495d7.png)
> Figure 7. Captured .NET in Pestudio
<br>

![image](https://user-images.githubusercontent.com/120234772/208039043-268c111c-ec60-46b5-b576-182563dcfeb7.png)
> Figure 8. Captured Strings in Pestudio
<br>

#### Disclaimer
The views and opinions expressed herein are those of the author and do not necessarily reflect the views of company.


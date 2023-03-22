
![image](https://user-images.githubusercontent.com/120234772/226846312-22db555b-1bc7-4e8f-a040-a76814a66d66.png)

```kql      
// SecurityResearcher-Note : Covering topics
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

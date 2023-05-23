# EPP

```kql
DeviceTvmSecureConfigurationAssessmentKB
| where ConfigurationSubcategory == "Antivirus"
```

| Configuration Id | Configuration Name |
| :-- | :-- |
| scid-89 | Enable scanning of removable drives during a full scan |
| scid-90 | Enable Microsoft Defender Antivirus email scanning |
| scid-91 | Enable Microsoft Defender Antivirus real-time behavior monitoring |
| scid-92 | Enable Microsoft Defender Antivirus scanning of downloaded files and attachments | 
| scid-2003 | Turn on Tamper Protection | 
| scid-2010 | Turn on Microsoft Defender Antivirus |
| scid-2011 | Update Microsoft Defender Antivirus definitions |
| scid-2012 | Turn on real-time protection |
| scid-2013 | Turn on PUA protection in block mode | 
| scid-2014 | Fix Windows Defender Antivirus cloud service connectivity |
| scid-2016 | Enable cloud-delivered protection |

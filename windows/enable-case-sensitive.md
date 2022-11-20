# Enabling case sensitive on windows

- Open powershell (as administrator)

```ps1
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

- Restart your computer

- Open command prompt (as administrator)

```bash
fsutil file SetCaseSensitiveInfo C:\<folder> enable
```
<br />
<br />

<div align="center">
  
  **Done, you have been enabled sensitive case on windows**
  
</div>
<br />
<br />

> Windows 10 April 2018 Update (version 1803), NTFS includes a new flag that you can enable on a per-folder basis allowing the file system to treat files and folders as case sensitive

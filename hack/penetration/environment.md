# 渗透环境搭建

## 测试系统
- [Metasploitable2](https://sourceforge.net/projects/metasploitable/files/Metasploitable2/)
- [OWASPBWA](https://sourceforge.net/projects/owaspbwa/files/latest/download)
  
## 渗透测试环境

### 虚拟机软件
- [VMWare](https://www.vmware.com/)
- [Virtual Box](https://www.virtualbox.org/)
  
### 渗透系统
- [Kali Linux](https://www.kali.org/)
- [Back Box](https://backbox.org/)
- [Parrot](https://www.parrotsec.org/)(个人推荐)

## 搭建Kali Linux

- 设置Metasploit数据库
```bash
service postgresql start
```
- 安装gedit软件
  
### Linux工具
- 对PE、ELF、Mach-O等二进制文件注入shellcode: 
[the-backdoor-factory](https://github.com/secretsquirrel/the-backdoor-factory.git)
- 实现屏幕截图和网页的获取: [HTTPScreenShot](https://github.com/breenmachine/httpscreenshot.git)
- 使用samba工具的一种快速psexec类型攻击: [SMBExec](https://github.com/brav0hax/smbexec.git)
- 互联网端口扫描工具: [Masscan](https://github.com/robertdavidgraham/masscan.git)
- 针对GitHub的探测工具: [Gitrob](https://github.com/michenriksen/gitrob.git)
- 基于Python开发的开源内容管理系统扫描工具, 实现对安全漏洞的自动扫描: [CMSmap](https://github.com/Dionach/CMSmap)
- WordPress漏洞扫描工具和暴力破解工具: [WPScan](https://github.com/wpscanteam/wpscan-v3.git)
- 实现网站截屏, 收集服务器包头信息和判断网站是否采用默认口令: [EyeWitness](https://github.com/FortyNorthSecurity/EyeWitness.git)
- 大量常用的打印机漏洞利用工具: [Printer Exploits](#). 没找到这个, 找了个替代的. [PRET](https://github.com/RUB-NDS/PRET)
- SQL注入工具: [SQLMap](https://github.com/sqlmapproject/sqlmap.git)
- 功能齐全的网站探测框架: [Recon-ng](https://hackertarget.com/recon-ng-tutorial/)
- 自动化处理各种渗透任务: [Discover Scripts](https://github.com/leebaird/discover.git)
- 跨站脚本攻击框架: [BeEF Exploitation Framework](#)
- 用于获取NTLM挑战/应答哈希值: [Responder](https://github.com/SpiderLabs/Responder.git)
- [cheetz脚本合集](https://github.com/cheetz)
- 从NTDSXtract中提取用户易于理解的哈希值: [DSHashes](https://github.com/bsi-group/dumpntds)
- 辅助渗透测试人员简化网站架构的渗透测试工作: [SPARTA](https://github.com/SECFORCE/sparta.git)
- 用于MongoDB数据库和网站应用程序的自动化渗透测试工具集: [NoSQLMap](https://github.com/codingo/NoSQLMap.git)
- 开源的指纹检测工具: [Spiderfoot](https://github.com/smicallef/spiderfoot.git)
- Windows凭证编辑器: [WCE](https://www.ampliasecurity.com/research/windows-credentials-editor/)
- 用于从内存从获取明文密码、金票据和万能密钥: [Mimikatz](https://github.com/gentilkiwi/mimikatz.git)
- 社会工程学工具集: [SET](https://github.com/trustedsec/social-engineer-toolkit.git)
- 规避杀毒软件检测: [Veli-Framework](https://github.com/Veil-Framework/Veil.git)
- Web渗透测试工具集: [Burp Suite](https://portswigger.net/burp/communitydownload)
- 集成渗透测试工具: [ZAP Proxy](https://github.com/zaproxy)
- 配置Burp渗透测试参数: [Fuzzing Lists](https://github.com/danielmiessler/SecLists.git)
- 分析PCAP文件, 获取用户名和密码: [Net-Creds](https://github.com/DanMcInerney/net-creds.git)
- WiFi网络攻击工具: [Wifite](https://github.com/derv82/wifite.git) [Wifite](https://github.com/derv82/wifite2.git)
- WiFi网络自动化钓鱼攻击: [WIFIPhisher](https://github.com/wifiphisher/wifiphisher.git)
- 码字典生成工具: [Wordhound](https://bitbucket.org/mattinfosec/wordhound.git)
- 更新网址: [Hacker Play Book](http://thehackerplaybook.com/updates/)
  
### Windows工具
- PowerShell脚本用户后渗透工具: [PowerSploit](https://github.com/PowerShellMafia/PowerSploit.git)
- PowerShell漏洞利用和后渗透测试脚本汇总: [Nishang](https://github.com/samratashok/nishang.git)
- 十六进制文本编辑器: [HxD](https://mh-nexus.de/en/downloads.php?product=HxD20)
- [Evade](http://blog.securepla.net/download/evade.zip)
- [Metasploit](https://www.metasploit.com/)
- [Hyperion](http://nullsecurity.net/tools/binary.html)
- c/c++编译器: [Mingw](https://sourceforge.net/projects/mingw/)
- 一款系统弱点扫描与分析软件: [Nessus](https://www.tenable.com/downloads/nessus)
- 端口扫描工具: [nmap](https://nmap.org/)
- 密码恢复工具: [oclHashcat](https://hashcat.net/hashcat/)
- 密码恢复工具, 该隐与亚伯: [Cain and Abel](https://hashcat.net/hashcat/)
- [Burp Proxy Pro](https://portswigger.net/burp)
- FireFox插件
    - Web开发人员插件
    - Tamper Data
    - Foxy Proxy
    - User Agent Switcher
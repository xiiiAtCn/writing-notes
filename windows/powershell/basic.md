# 环境变量相关

## 读取环境变量
```powershell
$env:windir

ls $env:
```
## 创建环境变量
```powershell
$env:TestVar1 = "This is a test environment variable"
```

## 删除环境变量
```powershell
del $env:TestVar1
```
> 以上操作只对当前终端生效, 关闭终端则设置消失

## 环境变量更新生效
```powershell
PS> [environment]::SetEnvironmentvariable("Path", ";c:\powershellscript", "User")
PS> [environment]::GetEnvironmentvariable("Path", "User")
;c:\powershellscript
```
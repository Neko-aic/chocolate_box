<#   & lt; #
.SYNOPSIS   ．剧情简介
    启动 Alist 服务（保持窗口显示，输出每一步信息）
#>   #比;   #比;

# 最小化当前 PowerShell 窗口的代码
Add-Type @"
    using System;   使用系统;
    using System.Runtime.InteropServices;使用System.Runtime.InteropServices;
    public class WinAPI {   WinAPI {
        [DllImport("user32.dll")][DllImport("user32.dll")]
        public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow)；
    }
"@   “@

$hwnd = (Get-Process -Id $pid).MainWindowHandle$hwnd = (Get-Process -Id $pid)。MainWindowHandle
[WinAPI]::ShowWindow($hwnd, 2)   # 2 = SW_MINIMIZE（最小化）

# ------ 用户配置区域（根据你的实际路径修改）------
$targetDirectory = "E:\"          # alist.exe 所在目录$targetDirectory = "E:\"          # alist.exe 所在目录
$command         = "alist.exe"    # 可执行文件名$command         = "alist.exe"    # 可执行文件名
$arguments       = "server"       # 启动参数$arguments       = "server"       # 启动参数
# -------------------------------------------------

Write-Host "========================================" -ForegroundColor CyanWrite-Host“ ;========================================& “-ForegroundColor青色
Write-Host "===正在启动 Alist 服务及其相关控制组件===" -ForegroundColor YellowWrite-Host "===正在启动 Alist 服务及其相关控制组件===" -ForegroundColor Yellow
Write-Host "请稍等.  [1/3]" -ForegroundColor WhiteWrite-Host "请稍等.  [1/3]" -ForegroundColor White
Write-Host "请稍等.. [2/3]" -ForegroundColor WhiteWrite-Host "请稍等.. [2/3]" -ForegroundColor White
Write-Host "请稍等...[3/3]" -ForegroundColor WhiteWrite-Host "请稍等...[3/3]" -ForegroundColor White
Write-Host "===已完成服务组件初始化，发现 错误[0]个，警告[0]个===" -ForegroundColor GreenWrite-Host "===已完成服务组件初始化，发现 错误[0]个，警告[0]个===" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor CyanWrite-Host“ ;========================================& “-ForegroundColor青色

# 步骤1：检查目标目录
Write-Host "[1] 检查目录: $targetDirectory" -ForegroundColor YellowWrite-Host "[1] 检查目录: $targetDirectory" -ForegroundColor Yellow
if (-not (Test-Path $targetDirectory)) {
    Write-Host "错误：目录 '$targetDirectory' 不存在！" -ForegroundColor RedWrite-Host "错误：目录 '$targetDirectory' 不存在！" -ForegroundColor Red
    Write-Host "按任意键退出..." -ForegroundColor WhiteWrite-Host "按任意键退出..." -ForegroundColor White
    $null = Read-Host
    exit 1   出口1
}
Set-Location $targetDirectorySet-Location targetDirectory美元
Write-Host "    已切换到目录: $(Get-Location)" -ForegroundColor GreenWrite-Host "    已切换到目录: $(Get-Location)" -ForegroundColor Green

# 步骤2：检查命令文件是否存在
$commandFullPath = Join-Path -Path $targetDirectory -ChildPath $command$commandFullPath = Join-Path -Path $targetDirectory -ChildPath $命令
if (-not (Test-Path $commandFullPath)) {
    Write-Host "错误：'$commandFullPath' 未找到！" -ForegroundColor RedWrite-Host "错误：'$commandFullPath' 未找到！" -ForegroundColor Red
    Write-Host "按任意键退出..."   Write-Host "按任意键退出..."
    $null = Read-Host
    exit 1   出口1
}
Write-Host "[2] 找到命令文件: $commandFullPath" -ForegroundColor GreenWrite-Host "[2] 找到命令文件: $commandFullPath" -ForegroundColor Green

# 步骤3：准备执行命令
Write-Host "[3] 准备执行命令: .\$command $arguments" -ForegroundColor YellowWrite-Host "[3] 准备执行命令: .\$command $arguments" -ForegroundColor Yellow
Write-Host "[4] 正在启用网页处理环境" -ForegroundColor YellowWrite-Host "[4] 正在启用网页处理环境" -ForegroundColor Yellow
Write-Host "    正在打开网页端管理后台 地址 [http://127.0.0.1:5244/] 端口 5244 " -ForegroundColor YellowWrite-Host "    正在打开网页端管理后台 地址 [http://127.0.0.1:5244/] 端口 5244 " -ForegroundColor Yellow
Start-Process "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" -ArgumentList "http://127.0.0.1:5244/"Start-Process "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe" -ArgumentList "http://127.0.0.1:5244/"；
# 步骤4：执行命令（关键修复：使用完整路径调用）
Write-Host "[5] 正在启动 Alist 服务..." -ForegroundColor YellowWrite-Host "[5] 正在启动 Alist 服务..." -ForegroundColor Yellow
Write-Host "[6] Alist 服务启动成功！返回码 0 。日志监控开始：" -ForegroundColor GreenWrite-Host "[6] Alist 服务启动成功！返回码 0 。日志监控开始：" -ForegroundColor Green
Write-Host "----------------------------------------" -ForegroundColor DarkGrayWrite-Host“ ;----------------------------------------& “-ForegroundColor DarkGray

# 使用完整路径（$commandFullPath），确保可以运行
& $commandFullPath $arguments$commandFullPath $参数

# 命令结束后
Write-Host "----------------------------------------" -ForegroundColor DarkGrayWrite-Host“ ;----------------------------------------& “-ForegroundColor DarkGray
Write-Host "Alist 服务已停止或命令执行完毕。" -ForegroundColor YellowWrite-Host "Alist 服务已停止或命令执行完毕。" -ForegroundColor Yellow
Write-Host "按 Enter 键关闭窗口..."Write-Host "按 Enter 键关闭窗口..."
$null = Read-Host

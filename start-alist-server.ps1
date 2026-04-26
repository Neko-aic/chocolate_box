<#
.SYNOPSIS
    一键启动 Alist 服务（保持窗口显示，输出每一步信息）
#>

# ------ 用户配置区域（根据你的实际路径修改）------
$targetDirectory = "E:\"          # alist.exe 所在目录
$command         = "alist.exe"    # 可执行文件名
$arguments       = "server"       # 启动参数
# -------------------------------------------------

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "一键启动 Alist 服务" -ForegroundColor Yellow
Write-Host "========================================" -ForegroundColor Cyan

# 步骤1：检查目标目录
Write-Host "[1] 检查目录: $targetDirectory" -ForegroundColor Green
if (-not (Test-Path $targetDirectory)) {
    Write-Host "错误：目录 '$targetDirectory' 不存在！" -ForegroundColor Red
    Write-Host "按任意键退出..."
    $null = Read-Host
    exit 1
}
Set-Location $targetDirectory
Write-Host "已切换到目录: $(Get-Location)" -ForegroundColor Green

# 步骤2：检查命令文件是否存在
$commandFullPath = Join-Path -Path $targetDirectory -ChildPath $command
if (-not (Test-Path $commandFullPath)) {
    Write-Host "错误：'$commandFullPath' 未找到！" -ForegroundColor Red
    Write-Host "按任意键退出..."
    $null = Read-Host
    exit 1
}
Write-Host "[2] 找到命令文件: $commandFullPath" -ForegroundColor Green

# 步骤3：准备执行命令
Write-Host "[3] 准备执行命令: $command $arguments" -ForegroundColor Green

# 步骤4：执行命令（关键修复：使用完整路径调用）
Write-Host "[4] 正在启动 Alist，日志输出如下（按 Ctrl+C 可停止服务）：" -ForegroundColor Green
Write-Host "----------------------------------------" -ForegroundColor DarkGray

# 使用完整路径（$commandFullPath），确保可以运行
& $commandFullPath $arguments

# 命令结束后
Write-Host "----------------------------------------" -ForegroundColor DarkGray
Write-Host "Alist 服务已停止或命令执行完毕。" -ForegroundColor Yellow
Write-Host "按 Enter 键关闭窗口..."
$null = Read-Host
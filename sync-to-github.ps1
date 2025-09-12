# sync-to-github.ps1
param (
  [string]$Message = "Auto sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

Write-Host "? Git Sync Started..." -ForegroundColor Cyan

# 检查是否有变更
$changes = git status --porcelain
if ($changes -eq "") {
  Write-Host "? No changes to commit." -ForegroundColor Green
  exit
}

# 添加所有变更
git add .

# 提交
git commit -m "$Message"

# 推送
git push

Write-Host "? Git Sync Completed." -ForegroundColor Green

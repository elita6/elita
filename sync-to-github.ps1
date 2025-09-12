# sync-to-github.ps1
param (
  [string]$Message = "Auto sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
)

Write-Host "? Git Sync Started..." -ForegroundColor Cyan

# ����Ƿ��б��
$changes = git status --porcelain
if ($changes -eq "") {
  Write-Host "? No changes to commit." -ForegroundColor Green
  exit
}

# ������б��
git add .

# �ύ
git commit -m "$Message"

# ����
git push

Write-Host "? Git Sync Completed." -ForegroundColor Green

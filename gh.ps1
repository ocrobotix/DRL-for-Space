
# Deactivate any active conda environment
conda deactivate

# ========= CONFIGURATION =========
$work_dir = "D:\SANDBOX\Jupyterbooks\RL_Books\DRL_in_Space"
$venv_dir = "D:\SANDBOX\Jupyterbooks\jbook_template"
$my_book = "DRL3"
$repoUrl = "https://github.com/ocrobotix/$my_book.git"

# ========= Activate jbook_template Environment =========
& "$venv_dir\Scripts\Activate.ps1"  # ✅ Correctly activates the venv

# ========= Change to Working Directory =========
Set-Location $work_dir              # ✅ Prefer Set-Location in PowerShell

# ========= Build Jupyter Book =========
jb clean .
jb build .

# ========= Create GitHub Repository =========


if (!(Test-Path ".git")) {
    Write-Host "📂 Initializing Git repo in $work_dir..."
    git init
    git branch -M main
    git add .
    git commit -m "Initial commit"
}


git config --global core.autocrlf true      # suppress warning

Write-Host "`n📦 Creating GitHub repo '$my_book'..."
gh repo create "ocrobotix/$my_book" --public --source . --remote origin --push


# ========= Confirm Remote and Push =========

git add .
git commit -m "Source commit" 2>$null  # Suppress warning if nothing to commit
git push -u origin main

# ========= Publish to GitHub Pages =========
Write-Host "`n🌍 Publishing to GitHub Pages..."
python -m ghp_import -n -p -f _build/html



# Deactivate any active conda environment
conda deactivate

# ========= CONFIGURATION =========
$work_dir = "D:\SANDBOX\Jupyterbooks\RL_Books\DRL_in_Space"
$venv_dir = "D:\SANDBOX\Jupyterbooks\jbook_template"
$my_book = "DRL3"
$repoUrl = "https://github.com/ocrobotix/$my_book.git"

# ========= Activate jbook_template Environment =========
& "$venv_dir\Scripts\Activate.ps1"

# ========= Change to Working Directory =========
Set-Location $work_dir

# ========= Build Jupyter Book =========
jb clean .
jb build .

# ========= Initialize Git Repository =========
if (!(Test-Path ".git")) {
    Write-Host "📂 Initializing Git repo in $work_dir..."
    git init
    git branch -M main
    git add .
    git commit -m "Initial commit"
}

git config --global core.autocrlf true  # Suppress CRLF warnings

# ========= Create GitHub Repository =========
if (-not (gh repo view "ocrobotix/$my_book" 2>$null)) {
    Write-Host "`n📦 Creating GitHub repo '$my_book'..."
    gh repo create "ocrobotix/$my_book" --public --source . --remote origin --push
} else {
    Write-Host "🔗 GitHub repo already exists: $repoUrl"
}

# ========= Commit and Push =========
git add .
try {
    git commit -m "Source commit"
} catch {
    Write-Host "ℹ Nothing to commit, working tree clean."
}
git push -u origin main

# ========= Publish to GitHub Pages =========
Write-Host "`n🌍 Publishing to GitHub Pages..."
python -m ghp_import -n -p -f _build/html

Write-Host "`n✅ Book built and deployed!"
Write-Host "🌐 View it at: https://ocrobotix.github.io/$my_book"

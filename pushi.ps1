# ========= Deactivate any active conda environment =========
conda deactivate

# ========= CONFIGURATION =========
$work_dir = "D:\SANDBOX\Jupyterbooks\RL_Books\DRL_in_Space"
$venv_dir = "D:\SANDBOX\Jupyterbooks\jbook_template"
$my_book = "DRL-for-Space-test"
$repoUrl = "https://github.com/ocrobotix/$my_book.git"

# ========= Activate Jupyter Book Environment =========
& "$venv_dir\Scripts\Activate.ps1"

# ========= Change to Working Directory =========
Set-Location $work_dir

# ========= Create GitHub Repository (if it doesn't exist) =========
Write-Host "`n📦 Creating GitHub repo '$my_book'..."
gh repo create "ocrobotix/$my_book" --public --source . --push 2>$null

# ========= Force-reset Git Remote =========
if (git remote get-url origin 2>$null) {
    git remote remove origin
    Write-Host "❌ Removed existing remote 'origin'."
}
git remote add origin $repoUrl
Write-Host "🔗 Added remote 'origin': $repoUrl"

# ========= Set Git Config to Suppress CRLF Warnings =========
git config --global core.autocrlf true

# ========= Build Jupyter Book =========
Write-Host "`n⚙ Building Jupyter Book..."
jb clean .
jb build .

#
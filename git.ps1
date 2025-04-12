# Deactivate any active conda environment
conda deactivate

# ========= CONFIGURATION =========
$my_book = "jb2"
$my_venv = "D:\SANDBOX\Jupyterbooks\$my_book"
$jbook_venv = "D:\SANDBOX\Jupyterbooks\jbook_template"
$repoDir = "$my_venv\$my_book"
$repoUrl = "https://github.com/ocrobotix/$my_book.git"

# ========= STEP 1: Create Virtual Environment for Kernel =========
if (!(Test-Path $my_venv)) {
    python -m venv $my_venv
}
Set-Location $my_venv
& "$my_venv\Scripts\Activate.ps1"

# ========= STEP 2: Install Kernel =========
pip install ipykernel
python -m ipykernel install --user --name=$my_book 

# ========= STEP 3: Activate jbook_template Environment =========
Set-Location $jbook_venv
& "$jbook_venv\Scripts\Activate.ps1"

# ========= STEP 4: Create Jupyter Book if it doesn't exist =========
Set-Location $my_venv
if (!(Test-Path "$repoDir")) {
    jb create $my_book
}

# ========= STEP 5: Build Jupyter Book =========
Set-Location $repoDir
jb build .

# ========= STEP 6: Init Git and Create GitHub Repository =========
Set-Location $repoDir

if (!(Test-Path ".git")) {
    Write-Host "📂 Initializing Git repo in $repoDir..."
    git init
    git branch -M main
    git add .
    git commit -m "Initial commit"
}

Write-Host "`n📦 Creating GitHub repo '$my_book'..."
gh repo create "ocrobotix/$my_book" --public --source . --remote origin --push

# ========= STEP 7: Confirm Remote and Push =========
if (-not (git remote)) {
    Write-Host "🔗 Adding remote 'origin'..."
    git remote add origin $repoUrl
} else {
    Write-Host "✅ Remote already set:"
    git remote -v
}

git add .
git commit -m "Source commit" 2>$null  # Suppress warning if nothing to commit
git push -u origin main

# ========= STEP 8: Publish to GitHub Pages =========
Write-Host "`n🌍 Publishing to GitHub Pages..."
python -m ghp_import -n -p -f _build/html

# Optional: Configure the repo to serve from gh-pages via GitHub API
Write-Host "`n⚙ Configuring GitHub Pages to serve from gh-pages..."
gh api `
  -X PUT `
  -H "Accept: application/vnd.github+json" `
  /repos/ocrobotix/$my_book/pages `
  -f source.branch='gh-pages' `
  -f source.path='/'

# ========= DONE =========
Write-Host "`n✅ Jupyter Book created, built, and published!"
Write-Host "🌐 View it live at: https://ocrobotix.github.io/$my_book"
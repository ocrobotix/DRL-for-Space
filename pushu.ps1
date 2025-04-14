
# ========= Deactivate any active conda environment =========
conda deactivate

# ========= CONFIGURATION =========
$work_dir = "D:\SANDBOX\Jupyterbooks\RL_Books\DRL_in_Space"
$venv_dir = "D:\SANDBOX\Jupyterbooks\jbook_template"
$my_book = "DRL-for-Space-test"
$repoUrl = "https://github.com/ocrobotix/$my_book.git"
# ========= Commit and Push Source =========
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

# ========= Done =========
Write-Host "`n✅ Jupyter Book '$my_book' successfully built and published!"
Write-Host "🌐 View it live at: https://ocrobotix.github.io/$my_book"

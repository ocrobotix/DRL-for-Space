
# Deactivate any active conda environment
conda deactivate

# ========= Activate jbook_template Environment =========

../../jbook_template/Scripts/activate

# ========= Build Jupyter Book =========
jb clean .
jb build .

# ========= Create GitHub Repository =========


Write-Host "`n📦 Creating GitHub repo 'DRL'..."
git config --global core.autocrlf true      # suppress warning

gh repo create "ocrobotix/DRL2" --public --source . --remote origin --push

# ========= Confirm Remote and Push =========

git add .
git commit -m "Source commit" 2>$null  # Suppress warning if nothing to commit
git push -u origin main

# ========= Publish to GitHub Pages =========
Write-Host "`n🌍 Publishing to GitHub Pages..."
python -m ghp_import -n -p -f DRL_in_Spaace/_build/html



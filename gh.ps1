# ========= Build Jupyter Book =========
../../jbook_template/Scripts/activate
jb clean .
jb build .

start _build/html/intro.html

# ========= Create GitHub Repository =========
git config --global core.autocrlf true      # suppress warning


Write-Host "`n📦 Creating GitHub repo 'DRL1'..."
gh repo create "ocrobotix/DRL1" --public --source . --remote origin --push

# ========= STEP 7: Confirm Remote and Push =========

git add .
git commit -m "Source commit" 2>$null  # Suppress warning if nothing to commit
git push -u origin main

# ========= STEP 8: Publish to GitHub Pages =========
Write-Host "`n🌍 Publishing to GitHub Pages..."
python -m ghp_import -n -p -f _build/html


# ========= DONE =========

rm -rf .git
echo "# CKAD" >> README.md
rm -rf .git
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/briancornally/CKAD.git
git pull
git branch --set-upstream-to=origin/main main
git push -u origin main

git add -A

@echo off
set PATH=%PATH%;%CD%/images
if not exist .git (
  git init
  git remote add origin git://gitcafe.com/pa001024/NekocraftS1Client.git
)
git pull
git rebase
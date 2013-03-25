@echo off
set PATH=%PATH%;%CD%/git
if not exist .git (
  git init
  git remote add origin git://gitcafe.com/pa001024/NekocraftS1Client.git
  git config user.email "reg@nekocraft.com"
  git config user.email "nekocraft"
)
git pull&
git checkout master -f
git rebase
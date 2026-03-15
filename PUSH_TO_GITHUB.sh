#!/bin/bash
# ════════════════════════════════════════════════════════════════
#  HOW TO PUSH customer-support TO GITHUB
#  Run these commands one by one in your terminal
# ════════════════════════════════════════════════════════════════
#
#  STEP 0 — Install Git (if not already installed)
#  ─────────────────────────────────────────────────
#  Windows : https://git-scm.com/download/win  → install → restart terminal
#  Mac     : git --version  (triggers install if missing)
#  Linux   : sudo apt install git   OR   sudo yum install git
#
# ════════════════════════════════════════════════════════════════

# ── STEP 1: Configure Git with your name and email ──────────────
# (Only needed once — skip if you've done this before)

git config --global user.name  "Your Name"
git config --global user.email "your@email.com"


# ── STEP 2: Navigate into the project folder ────────────────────
# Change this path to wherever you downloaded/extracted the zip

cd customer-support


# ── STEP 3: Initialize Git in the folder ────────────────────────

git init


# ── STEP 4: Stage ALL files ─────────────────────────────────────

git add .


# ── STEP 5: Make the first commit ───────────────────────────────

git commit -m "Initial commit: Customer Support — Claude Code plugin"


# ── STEP 6: Rename branch to 'main' ─────────────────────────────

git branch -M main


# ── STEP 7: Create the repo on GitHub ───────────────────────────
#
#  Open https://github.com/new in your browser
#
#  Fill in:
#    Repository name : customer-support
#    Description     : A Virtual Support Engineering Team for Claude Code
#    Visibility      : Public  ← required for claude plugin add to work
#    Initialize      : NO (leave all checkboxes unchecked)
#
#  Click "Create repository"
#  Copy the URL shown — it will look like:
#    https://github.com/priyanshu9888/customer-support.git


# ── STEP 8: Connect local repo to GitHub ────────────────────────
# Replace YOUR-USERNAME with your actual GitHub username

git remote add origin https://github.com/priyanshu9888/customer-support.git


# ── STEP 9: Push to GitHub ──────────────────────────────────────

git push -u origin main

# GitHub will ask for your username + password (or token)
# If it asks for a password, use a Personal Access Token (PAT):
#   GitHub → Settings → Developer settings → Personal access tokens
#   → Tokens (classic) → Generate new token → check "repo" → copy token
#   Paste the token as your password


# ════════════════════════════════════════════════════════════════
#  DONE! Your plugin is now live at:
#  https://github.com/priyanshu9888/customer-support
#
#  Anyone can install it with:
#  claude plugin add https://github.com/priyanshu9888/customer-support.git
# ════════════════════════════════════════════════════════════════


# ── FUTURE UPDATES (when you change any file) ───────────────────

# Stage changed files
git add .

# Commit with a message describing what changed
git commit -m "Add new runbook for database connection issues"

# Push to GitHub
git push

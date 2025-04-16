#!/bin/bash

# This script helps with deploying the website to GitHub and Vercel

# Step 1: Initialize Git repository if not already initialized
if [ ! -d .git ]; then
  echo "Initializing Git repository..."
  git init
  git add .
  git commit -m "Initial commit"
else
  echo "Git repository already initialized."
fi

# Step 2: Add remote repository (replace with your actual GitHub repository URL)
echo "Please enter your GitHub repository URL (e.g., https://github.com/username/repo.git):"
read repo_url

if [ -n "$repo_url" ]; then
  git remote add origin $repo_url
  echo "Remote repository added."
else
  echo "No repository URL provided. Skipping this step."
fi

# Step 3: Push to GitHub
echo "Do you want to push to GitHub now? (y/n)"
read push_now

if [ "$push_now" = "y" ]; then
  git push -u origin main
  echo "Code pushed to GitHub."
else
  echo "Skipping push to GitHub."
fi

# Step 4: Instructions for Vercel deployment
echo ""
echo "=== Vercel Deployment Instructions ==="
echo "1. Go to https://vercel.com and sign in"
echo "2. Click 'Add New...' > 'Project'"
echo "3. Import your GitHub repository"
echo "4. Vercel will automatically detect Vite and configure the build settings"
echo "5. Click 'Deploy'"
echo ""
echo "That's it! Your website will be deployed on Vercel."
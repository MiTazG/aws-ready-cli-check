#!/bin/bash
echo "🔍 Checking AWS CLI version..."
if command -v aws &> /dev/null; then
    aws --version
else
    echo "❌ AWS CLI not found"
fi

echo "🔍 Checking Git version..."
if command -v git &> /dev/null; then
    git --version
else
    echo "❌ Git not found"
fi

echo "🔍 Checking PowerShell availability..."
if command -v pwsh &> /dev/null; then
    pwsh -Command '$PSVersionTable.PSVersion'
else
    echo "❌ PowerShell not available in this shell"
fi

echo "🔍 Validating SSH key permissions..."
KEYS=$(ls ~/.ssh/*.pem 2>/dev/null)
if [ -z "$KEYS" ]; then
    echo "❌ No .pem keys found in ~/.ssh/"
else
    ls -l ~/.ssh/*.pem
fi

echo "🔍 Checking Zsh plugin config..."
if [ -f ~/.zshrc ]; then
    grep 'plugins=' ~/.zshrc || echo "❌ No plugins line found in .zshrc"
else
    echo "❌ .zshrc file not found"
fi
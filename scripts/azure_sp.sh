#!/bin/bash

# create a service principal and export its credentials in a format ready for GitHub Actions or CI/CD pipelines.
# Set variables
RESOURCE_GROUP_NAME="rg-webapp-deploy"
SP_NAME="github-actions-webapp"
LOCATION="eastus"

echo "🔧 Creating service principal for GitHub Actions..."
AZURE_CREDENTIALS=$(az ad sp create-for-rbac \
  --name $SP_NAME \
  --role contributor \
  --scopes /subscriptions/$(az account show --query id --output tsv)/resourceGroups/$RESOURCE_GROUP_NAME \
  --sdk-auth)

echo "✅ Service principal created."

# Save credentials to a local file (optional)
echo "$AZURE_CREDENTIALS" > azure-credentials.json
echo "📁 Credentials saved to azure-credentials.json"

# Output for GitHub Actions secret setup
echo "🔐 Paste the following into your GitHub Actions secret named AZURE_CREDENTIALS:"
echo "$AZURE_CREDENTIALS"

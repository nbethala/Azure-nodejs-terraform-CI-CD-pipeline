#!/bin/bash

# Cleanup script for Azure resource group
# Purpose: Deletes the rg-webapp-deploy resource group to avoid lingering costs

RESOURCE_GROUP="rg-webapp-deploy"

echo "⚠️  This will delete the entire resource group: $RESOURCE_GROUP"
read -p "Are you sure you want to proceed? (y/n): " confirm

if [[ "$confirm" == "y" ]]; then
    echo "Deleting resource group $RESOURCE_GROUP..."
    az group delete --name "$RESOURCE_GROUP" --yes --no-wait
    echo "✅ Cleanup initiated. Resources will be deleted asynchronously."
else
    echo "❌ Cleanup aborted."
fi

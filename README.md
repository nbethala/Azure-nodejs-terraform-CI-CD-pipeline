# CI-CD-Pipeline-Node.js-Azure-DevOps
This project demonstrates a real-world CI/CD workflow for a Node.js web application using Azure DevOps and Azure App Service. Every code push triggers automated tests and deploys directly to a live cloud environment—mirroring the practices used by professional DevOps teams.

## Why This Project?
  This project showcases a modern, cloud-native deployment pipeline with automation, reproducibility, and observability at its core:

- **🔁 Continuous Integration & Deployment**: Automatically tests and deploys on every code push using GitHub Actions.

- **🐳 Containerization**: Docker-based setup ensures consistent environments across dev, test, and production.

- **☁️ Cloud Deployment**: Seamless deployment to Azure Container Instances via scripted workflows.  
 
- **🧪 Automated Testing**: Unit tests triggered on every commit to maintain code quality and reliability. 
  
- **📊 Health Monitoring**: Built-in health checks and metrics for proactive system visibility. 
  
- **📜 Infrastructure as Code**: Azure resources provisioned and managed through declarative scripts for reproducibility and scalability.


## Prerequisites & Tech Stack
    To run, deploy, or extend this project, you'll need the following tools and technologies:

### 🔧 Prerequisites
- **Docker** – For containerization and local testing
- **Azure CLI** – To interact with Azure services and automate deployments
- **Git** – Version control and CI/CD integration
- **Terraform (optional)** – For infrastructure provisioning (if extending to IaC)
- **Python / Node.js / Go / Bun / Deno** – Depending on your chosen runtime
- **Azure** - setup a free tier account

### ⚙️ Tech Stack
- **CI/CD**: GitHub Actions  
- **Containerization**: Docker  
- **Cloud Platform**: Azure Container Instances  
- **Monitoring**: Built-in health checks and metrics endpoints  
- **Testing**: Unit tests triggered on every commit  
- **Infrastructure as Code**: Azure CLI scripts (Terraform optional)



===========================================

# 🚀 Node.js Web App Deployment on Azure with Terraform & CI/CD

This project deploys a containerized Node.js app to Azure using modular Terraform and GitHub Actions. It provisions infrastructure, bootstraps authentication via a service principal, and automates deployment through a CI/CD pipeline.

---

## 🧩 Tech Stack

- **App**: Node.js (Express)
- **Cloud**: Azure
- **IaC**: Terraform
- **CI/CD**: GitHub Actions
- **Auth**: Azure Service Principal
- **Registry**: Azure Container Registry (ACR)

---

## 📁 Project Structure

├── app/ │ ├── Dockerfile │ ├── index.js │ └── package.json ├── terraform/ │ ├── main.tf │ ├── variables.tf │ └── outputs.tf ├── scripts/ │ └── create_sp.sh ├── .github/ │ └── workflows/ │ └── deploy.yml └── README.md


---

## 🔄 CI/CD Pipeline Overview

Automated deployment is triggered on every push to `main`. GitHub Actions handles:

1. **Code Checkout**
2. **Docker Build**
3. **ACR Authentication**
4. **Image Push to Azure Container Registry**

```yaml
# .github/workflows/deploy.yml
name: CI/CD Pipeline

on:
  push:
    branches: [ main ]

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: docker/setup-buildx-action@v2
      - name: Build & Push
        run: |
          az login --service-principal -u ${{ secrets.AZURE_CREDENTIALS.clientId }} \
            -p ${{ secrets.AZURE_CREDENTIALS.clientSecret }} \
            --tenant ${{ secrets.AZURE_CREDENTIALS.tenantId }}
          az acr login --name acrwebapp123456
          docker build -t acrwebapp123456.azurecr.io/node-webapp:latest ./app
          docker push acrwebapp123456.azurecr.io/node-webapp:latest


  
  





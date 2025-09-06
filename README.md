# Scalable Azure Deployment: Node.js App with Terraform & CI/CD 
This project demonstrates end-to-end cloud deployment using Azure App Services, CI/CD automation via GitHub Actions, and modular infrastructure provisioning. It reflects reproducible engineering, cost-awareness, and production-grade delivery—ready for real-world scale.

## Why This Project?
  This project showcases a modern, cloud-native deployment pipeline with automation, reproducibility, and observability at its core:

- **🔁 Continuous Integration & Deployment**: Automatically tests and deploys on every code push using GitHub Actions.

- **🐳 Containerization**: Docker-based setup ensures consistent environments across dev, test, and production.

- **☁️ Cloud Deployment**: Finalized deployment using Azure App Services, with scripted CI/CD workflows via GitHub Actions.

- **🧪 Automated Testing**: Unit tests triggered on every commit to maintain code quality and reliability. 
  
- **📊 Health Monitoring**: Built-in health checks and metrics for proactive system visibility. 
  
- **📜 Infrastructure as Code**: Azure resources provisioned and managed via modular Terraform configurations.
                                 Service principal lifecycle automated through secure shell scripts for streamlined authentication and access control.



## Architecture

<img width="1536" height="1024" alt="architecture" src="https://github.com/user-attachments/assets/6849d5c6-4699-4335-8f16-9450aabe9e2c" />


<img width="2344" height="1469" alt="ci-cd-deploy" src="https://github.com/user-attachments/assets/8b2e7fca-5048-48fa-9c44-fc061b302e09" />



## Prerequisites & Tech Stack

    To run, deploy, or extend this project, you'll need the following tools and technologies:

### 🔧 Prerequisites
- **Docker** – For local containerization and testing
- **Azure CLI** – To manage Azure resources and automate deployments
- **Git** – Version control and CI/CD integration
- **Terraform** – For extending infrastructure as code
- **Runtime Support** - Compatible with Python, Node.js, Go, Bun, or Deno
- **Azure** - Free tier setup recommended

### ⚙️ Tech Stack
- **CI/CD**: GitHub Actions for automated build and deployment
- **Containerization**: Docker-based local development 
- **Cloud Platform**: Azure App Services
- **Monitoring**: Built-in health checks and metrics endpoints  
- **Testing**: Unit tests triggered on every commit  
- **Infrastructure as Code**: Azure CLI scripts (Terraform optional)

---

## 📁 Project Structure

```plaintext
project-root/
├── infra_terraform/           # Infrastructure as Code
│   ├── main.tf                # Core Terraform config
│   ├── variables.tf           # Input variables
│   ├── outputs.tf             # Output values
│   ├── backend.tf             # Remote state config
│   └── modules/               # Modular resource definitions
│       ├── app_service/       # Azure App Services provisioning
│       ├── acr/               # Azure Container Registry setup
│       └── networking/        # VNet and subnet configuration
├── web-app/                   # Application source code
│   ├── app.js                 # Entry point (Node.js)
│   ├── package.json           # Dependencies and scripts
│   ├── Dockerfile             # Container definition
│   ├── .env.example           # Environment variable template
│   └── README.md              # App-specific notes
├── scripts/                   # Shell automation
│   ├── create_service_plan.sh # Provision App Service Plan
│   └── cleanup_resources.sh   # Resource teardown
├── .github/                   # CI/CD workflows
│   └── workflows/
│       └── deploy.yml         # GitHub Actions pipeline
├── architecture.png           # Visual diagram of infrastructure
├── README.md                  # Project overview and documentation
└── .gitignore                 # Git exclusions

---

## **CI/CD Pipeline Overview**
On every push to main, GitHub Actions orchestrates automated deployment with the following steps:

Code Checkout – Retrieves the latest source from the repository

Docker Build – Builds the container image from the app source

ACR Authentication – Authenticates securely with Azure Container Registry

Image Push – Publishes the built image to ACR for deployment

## **Cleanup**
To avoid ongoing Azure charges, you can tear down all provisioned resources by destroying the resource group:

terraform destroy

⚠️ This will delete all resources managed by Terraform, including the App Service, ACR, and networking components. Ensure you've backed up any critical data before running this command.

# **Cloud-Native Delivery**

✅ Real Web Application – Built with Node.js and containerized for portability
✅ Automated CI/CD – GitHub Actions pipeline triggered on every push to main 
✅ Container Deployment – Dockerized workflow for consistent builds 
✅ Cloud Hosting – Deployed to Azure App Services with scripted provisioning 
✅ Live Production URL – Shareable endpoint for stakeholders 
✅ Continuous Delivery – Automatic updates with every code commit

## **Security Highlights**

Role-based access via Azure service principal

Environment variables managed via .env template

CI/CD secrets stored securely in GitHub repository settings


  
  





# Production E-Commerce Platform on Kubernetes

A complete, production-ready deployment of a full-stack e-commerce application on AWS EKS. This project demonstrates enterprise-grade Kubernetes orchestration, containerization, and DevOps practices for a complex multi-tenant web application.

![Kubernetes E-Commerce Architecture](screenshots/04-deployment/project-files-with-yaml.png)

## 🚀 Overview

This project showcases a real-world e-commerce platform deployment featuring:
- **Customer storefront** with product catalog, shopping cart, and secure checkout
- **User authentication** and account management system  
- **Admin & seller portals** for inventory and order management
- **Payment processing** integration
- **MariaDB database** with persistent storage
- **Production Kubernetes** configuration with auto-scaling and monitoring

## 🏗️ Architecture

### Application Stack
- **Frontend:** PHP 7.4, Apache, JavaScript, HTML/CSS
- **Backend:** PHP with MySQLi database layer
- **Database:** MariaDB with persistent volumes
- **Containerization:** Docker
- **Orchestration:** Kubernetes (AWS EKS)
- **Networking:** LoadBalancer services, internal service discovery

### Infrastructure Components
AWS EKS Cluster
├── Web Application (PHP/Apache)
│ ├── LoadBalancer Service
│ ├── Horizontal Pod Autoscaler
│ └── ConfigMaps & Secrets
└── Database (MariaDB)
├── Persistent Volume Claims (EBS)
├── Stateful Deployment
└── Internal ClusterIP Service

text

## 📁 Project Structure
kubernetes-resume-challenge/
├── src/ # Application Source Code
│ ├── checkout/ # Cart & payment processing (5 files)
│ │ ├── cart.php
│ │ ├── checkout.php
│ │ ├── orderPlaced.php
│ │ ├── payment_complete.php
│ │ └── payment_fail.php
│ ├── customer/ # User management (7 files)
│ │ ├── add_address.php
│ │ ├── address.php
│ │ ├── edit_address.php
│ │ ├── myac.php
│ │ ├── verify_ME.php
│ │ ├── view.php
│ │ └── wallet.php
│ ├── products/ # Catalog management (2 files)
│ │ ├── product_detail.php
│ │ └── wishlist.php
│ ├── utility/ # Processing scripts (3 files)
│ │ ├── dv_confirm.php
│ │ ├── insert.php
│ │ └── process.php
│ ├── admin/ # Administrative dashboard
│ ├── auth/ # Authentication system
│ ├── index.php # Store homepage
│ ├── health.php # Kubernetes liveness probe
│ └── ready.php # Kubernetes readiness probe
├── manifests/ # Kubernetes Infrastructure (6 files)
│ ├── mysql-deployment.yaml # Database deployment
│ ├── mysql-service.yaml # Database service
│ ├── mysql-pvc.yaml # Persistent volume claim
│ ├── website-deployment.yaml # Web application deployment
│ ├── website-service.yaml # LoadBalancer service
│ └── fast-retain-storageclass.yaml
├── database/
│ └── db-load-script.sql # Database schema & seed data
├── docker/
│ └── Dockerfile # Container image definition
├── screenshots/ # Deployment documentation (80+ images)
│ ├── 01-docker/ # Containerization process
│ ├── 02-database/ # Database setup
│ ├── 03-kubernetes-setup/ # Cluster configuration
│ ├── 04-deployment/ # Application deployment
│ ├── 05-advanced/ # Advanced features
│ ├── 06-monitoring/ # Scaling & monitoring
│ └── 07-troubleshooting/ # Issue resolution
└── README.md

text

## 🛠️ Key Features Implemented

### Production Kubernetes Configuration
- **Multi-replica deployments** for high availability
- **Liveness & Readiness probes** for application health monitoring
- **Zero-downtime rolling updates** and instant rollback capabilities
- **ConfigMap & Secret management** for environment configuration
- **Persistent Volume Claims** for database storage

### Application Features
- **User Management:** Registration, authentication, profile management
- **Product Catalog:** Browsing, detail pages, wishlists
- **Shopping Cart:** Add/remove items, quantity management
- **Checkout Process:** Address management, payment integration
- **Order Management:** Order history, status tracking
- **Admin Dashboard:** User and inventory management
- **Payment Processing:** Complete payment flow integration

## 🚀 Deployment

### Prerequisites
- AWS EKS Cluster with worker nodes
- kubectl configured for cluster access
- Docker Hub account for container registry

### Quick Deployment
```bash
# Apply all Kubernetes manifests
kubectl apply -f manifests/

# Monitor deployment progress
kubectl get pods -w

# Access the application
kubectl get svc website-service
Customization
Update environment-specific configurations in your deployment manifests and ensure database credentials are properly set in Kubernetes secrets.

📊 Monitoring & Operations
Health Checks
bash
# Check application status
kubectl get pods -l app=ecom-web

# View application logs
kubectl logs -l app=ecom-web --tail=50
Updates & Rollbacks
bash
# Deploy new version
kubectl set image deployment/ecom-web ecom-web=cameronlcleveland/ecom-web-project:v5

# Monitor rollout
kubectl rollout status deployment/ecom-web

# Rollback if needed
kubectl rollout undo deployment/ecom-web
🔧 Troubleshooting & Resolution
This project includes comprehensive documentation of real-world challenges encountered and resolved during deployment:

Documented Issues & Solutions
Database Connection Failures - Service discovery and network policy configuration

Storage Provisioning - Persistent volume claims and storage class compatibility

Health Check Configuration - Proper endpoint implementation and timing

Image Deployment - Container registry authentication and image pull policies

View complete troubleshooting documentation in the screenshots/07-troubleshooting/ directory.

🎯 Skills Demonstrated
Kubernetes & Cloud Native
Production-grade Kubernetes deployment patterns

AWS EKS cluster management and configuration

Service discovery and internal networking

Persistent storage management with EBS

Self-healing applications with health checks

DevOps & Infrastructure
Docker containerization and image management

Infrastructure as Code with Kubernetes manifests

Configuration management and secrets handling

Monitoring and health check implementation

Cloud infrastructure management

Application Development
Full-stack web application architecture

Database design and management

Payment processing integration

Multi-tenant application design

Production deployment strategies

🚀 Future Enhancements
CI/CD Pipeline - Automated testing and deployment with GitHub Actions

Horizontal Pod Autoscaling - Dynamic scaling based on load

Monitoring Stack - Prometheus/Grafana for real-time metrics

Content Delivery - CloudFront distribution for global performance

Database Optimization - Read replicas and connection pooling

📞 Contact
For questions about this implementation or to discuss Kubernetes and cloud native solutions, please connect with me on LinkedIn or explore my other projects on GitHub.

🙏 Acknowledgements
Application framework adapted from detronetdip/E-commerce

Kubernetes community documentation and best practices

AWS EKS service and operational guidance

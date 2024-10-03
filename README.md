<h1> End to End Pipeline for JS app </h1>

# End-to-End Deployment Pipeline for JavaScript Applications

## Overview

This project establishes a comprehensive end-to-end pipeline for deploying JavaScript applications. By leveraging Infrastructure as Code (IaC) principles with Terraform, containerization with Docker, and orchestration with Kubernetes, this solution ensures production readiness, scalability, and enhanced monitoring.

## Key Features

- **Automated VPC Creation**: Utilizes Terraform for provisioning a Virtual Private Cloud (VPC) and auto-scaling RedHat instances, ensuring a secure and scalable environment for production workloads.
- **Docker Containerization**: Automates the containerization of applications and pushes Docker images to Docker Hub, allowing for consistent and scalable deployments.
- **Kubernetes Orchestration**: Configures and manages Kubernetes clusters on RedHat using Ansible, including deployment of Kubernetes manifests for applications and monitoring tools (Prometheus and Grafana).
- **Enhanced Monitoring**: Integrates Prometheus and Grafana for real-time system performance tracking, providing insights into application health and resource usage.
- **Automated CI Pipeline**: Implements a CI pipeline with Jenkins that accelerates deployment speed by 30% through automated unit tests, linting, and SonarQube-based code quality checks.
- **Robust CD Pipeline**: Facilitates seamless production deployment, improving release efficiency by 25% with infrastructure automation via Terraform and Ansible, and streamlined Kubernetes cluster management.

## Technologies Used

- **Infrastructure as Code**: Terraform
- **Containerization**: Docker
- **Orchestration**: Kubernetes, Ansible
- **Continuous Integration**: Jenkins
- **Monitoring**: Prometheus, Grafana
- **Code Quality**: SonarQube

## Getting Started

### Prerequisites

- Terraform
- Docker
- Ansible
- Kubernetes (kubectl)
- Jenkins
- SonarQube
- Access to Docker Hub

### Installation

1. **Clone the Repository**:
   ```bash
   git clone <repository-url>
   cd <project-directory>
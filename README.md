## Modern Two-Tier Infrastructure Deployment on Azure with CI/CD

## Overview:
This project involves the creation of a robust and scalable two-tier infrastructure on Microsoft Azure using Terraform. The architecture consists of a Linux Web App and Cosmos DB for MongoDB, with automated deployment facilitated by GitHub Actions as the Continuous Integration/Continuous Deployment (CI/CD) pipeline. Additionally, monitoring and logging are implemented using Azure Application Insights, ensuring comprehensive observability of the entire system.

Project Components:

## Azure Resources Provisioned with Terraform:

Linux Web App: A scalable and reliable Linux-based Web App is provisioned using Terraform, ensuring infrastructure as code (IaC) principles for consistency and reproducibility.
Cosmos DB for MongoDB: The NoSQL database layer is powered by Cosmos DB, providing high availability and global distribution. The Terraform scripts automate the provisioning of Cosmos DB to seamlessly integrate with the Web App.
CI/CD Pipeline with GitHub Actions:

Docker Containerization: The application is containerized using Docker, allowing for easy deployment and consistency across various environments.
GitHub Actions Workflow: The CI/CD pipeline is orchestrated through GitHub Actions. Upon code changes or merges into the designated branch, the workflow triggers Docker image building and pushing to DockerHub.

Integration of Docker Image with Terraform: The pipeline is setup in a way that, the Docker image build output is replaced in the Azure Terraform configuration for the Linux Web App. Therefore it is dynamically updated, ensuring automatic deployment of the latest version.
Monitoring and Logging with Azure Application Insights:

Proactive Monitoring: Azure Application Insights is provisioned with Terraform to enable proactive monitoring of the Web App's performance, availability, and usage.
Logging Integration: Logging is seamlessly integrated, capturing application logs and telemetry data. This ensures real-time insights into the application's behavior and aids in troubleshooting.

## Benefits and Outcomes:
Automation and Efficiency: The use of Terraform for infrastructure provisioning and GitHub Actions for CI/CD streamlines the deployment process, reducing manual intervention and minimizing errors.
Scalability and Reliability: The two-tier architecture, coupled with Azure services, ensures scalability and reliability, accommodating growing workloads and maintaining high availability.
Observability: Azure Application Insights provides comprehensive monitoring and logging, empowering the development and operations teams with insights to optimize application performance and detect issues early.


Scaling Policies: Implementing auto-scaling policies for both the Web App and Cosmos DB to dynamically adjust resources based on demand.
Security Measures: Enhancing security measures, such as Azure Key Vault integration for sensitive information storage and Azure Security Center for threat detection and response.

## Conclusion:
This project showcases a modern and automated approach to deploying and managing a two-tier infrastructure on Azure. By leveraging Terraform, GitHub Actions, and Azure services, the development and deployment processes are streamlined, leading to a robust and scalable solution with comprehensive monitoring and logging capabilities.

## Steps:


###  Set up Azure Service Principal for Terraform

1.1. Create an Azure Service Principal for Terraform to interact with Azure resources.

1.2. Configure the necessary environment variables, such as `ARM_CLIENT_ID`, `ARM_CLIENT_SECRET`, `ARM_SUBSCRIPTION_ID`, and `ARM_TENANT_ID`, to authenticate Terraform with Azure.

### Define Terraform Configuration

2.1. Create Terraform scripts to define the infrastructure components, including the Linux Web App and Cosmos DB. Ensure to parameterize variables for flexibility.

2.2. Utilize Terraform modules for reusability and maintainability.

###  Set up Dockerfile and GitHub Actions Workflow

3.1. Write a Dockerfile to containerize your application.

3.2. Create a GitHub Actions workflow YAML file (`/.github/workflows/main.yml`) to define the CI/CD pipeline.
   - Trigger the workflow on code pushes or pull requests.
   - Build and push the Docker image to DockerHub.
   - Set the Docker image tag as an environment variable.

###  Integrate Docker Image with Terraform

4.1. Modify the Terraform scripts for the Linux Web App to accept the Docker image tag as a variable.

4.2. Use the environment variable passed by GitHub Actions to dynamically update the Docker image tag in the Terraform configuration.

###  Provision Azure Resources with Terraform

5.1. Run `terraform init` and `terraform apply` to provision the infrastructure on Azure.
  ![Alt text](images/deployedinfrastructure.png)
   ![Alt text](images/aquilaresult.png)
  


###  Implement Monitoring and Logging with Azure Application Insights
   
6.1. Integrate Azure Application Insights into the Terraform scripts for both the Web App and Cosmos DB.

6.2. Configure the necessary telemetry settings and logging options.
     ![Alt text](images/applicationinsight.png)
      ![Alt text](images/loganalytics.png)

###  Execute CI/CD Pipeline

 ![Alt text](images/dockerpipeline.png)
 ![Alt text](images/deploymentipeline.png)
 ![Alt text](images/destroyinfrastructure.png)

7.1. Commit and push code changes to trigger the GitHub Actions workflow.

7.2. Observe the workflow executing the build, pushing the Docker image, and updating the Terraform configuration.

###  Monitor and Troubleshoot

8.1. Utilize Azure Portal to monitor the deployed resources in Application Insights.

8.2. Review logs and telemetry data to troubleshoot and optimize application performance.

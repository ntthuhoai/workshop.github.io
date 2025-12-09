---
title: "Proposal"
date: 2025-11-18
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# Customer Churn Prediction Platform on AWS
## A Machine Learning Deployment for Predicting Bank Customer Attrition

### 1. Executive Summary
The Customer Churn Prediction Platform is an AWS-based solution designed to deploy and serve a Machine Learning model that predicts the likelihood of bank customers leaving (churning). The platform provides an internal web interface where analysts and bank staff can input customer information and instantly obtain churn probabilities.  

The solution leverages Amazon EC2 to host a Streamlit web application, Amazon S3 to store the ML model and related data, AWS Identity and Access Management (IAM) for secure access, Amazon CloudWatch for monitoring, and Amazon VPC with Security Groups to control network traffic. The system is intentionally simple, cost-effective, and well suited for workshops, student projects, and small-scale production use within a bank’s analytics team.

### 2. Problem Statement
### What’s the Problem?
Today, the ML churn model is usually run on local notebooks or personal machines. Business users cannot directly access the model, and results must be generated manually by data scientists. This leads to:
- No centralized, always-on environment for making predictions.  
- Inefficient collaboration between data teams and business teams.  
- Model files (.pkl / .joblib) being shared over email or chat, which is insecure and hard to manage.  
- Difficulties in demonstrating the solution to stakeholders in a professional and repeatable way.  

### The Solution
The workshop proposes deploying a churn prediction model on AWS using a simple yet realistic architecture:
- A **Streamlit** web application running on **Amazon EC2** provides the user interface and handles input/output.  
- The trained ML model is stored in **Amazon S3** and loaded into EC2 at startup for low-latency inference.  
- **AWS IAM Roles** grant the EC2 instance secure access to the S3 bucket without hard-coding credentials.  
- **Amazon CloudWatch** collects logs and metrics from the EC2 instance for observability.  
- **Amazon VPC** and **Security Groups** restrict traffic to HTTPS/HTTP or port 8501 for Streamlit.  

This design turns an offline model into an online prediction service that can be accessed from any browser within the allowed network.

### Benefits and Return on Investment
The platform enables bank teams to:
- Run churn predictions in real time to prioritize retention campaigns.  
- Reduce manual work by ~80–90% compared to running notebooks on demand.  
- Demonstrate an end-to-end ML deployment on AWS in a way that is easy to understand and extend.  

Estimated monthly cost for a small instance (e.g., t2.micro or t3.small) and light data usage is around **8–12 USD/month**, which is highly affordable compared to the value provided in terms of faster decisions, better collaboration, and a reusable ML deployment blueprint.

### 3. Solution Architecture
The solution uses a straightforward AWS architecture for serving the churn model:

![Customer Churn Prediction Architecture](/images/2-Proposal/Streamlit.png)

- **User (Web Browser)** → accesses the Streamlit app via the EC2 public endpoint.  
- **Amazon VPC + Security Group** → controls inbound traffic (e.g., HTTP/HTTPS or port 8501).  
- **Amazon EC2** → hosts the Streamlit application and loads the ML model into memory.  
- **Amazon S3** → stores the trained churn model file and optionally input/output logs.  
- **AWS IAM Role** → grants EC2 permission to read the model from S3.  
- **Amazon CloudWatch** → receives logs and metrics from EC2 for monitoring.  

### AWS Services Used
- **Amazon EC2**: Hosts the Streamlit application and runs the ML inference code.  
- **Amazon S3**: Stores the serialized ML model (.pkl/.joblib) and optional datasets or prediction logs.  
- **AWS IAM**: Provides an instance role so EC2 can securely read from S3 without static keys.  
- **Amazon CloudWatch**: Collects logs, CPU metrics, and alarms for the EC2 instance.  
- **Amazon VPC & Security Groups**: Restrict incoming and outgoing traffic to the application.  
- *(Optional)* **Amazon API Gateway + AWS Lambda**: Can be added later to expose the model as a REST API instead of (or in addition to) Streamlit.  

### Component Design
- **Web Frontend (Streamlit on EC2)**:  
  - Renders HTML forms for entering customer features (age, tenure, balance, products, etc.).  
  - Sends the input data to the backend logic in the same Streamlit app for prediction.  

- **Model Inference Layer**:  
  - Loads the saved churn model from S3 (or from disk after first download).  
  - Performs data preprocessing and predicts churn probability.  
  - Returns results to the UI with human-readable labels (e.g., “High churn risk”).  

- **Storage and Access Control**:  
  - S3 bucket holds the model file and optionally CSV/Parquet logs of predictions.  
  - IAM Role controls which EC2 instance can access which S3 resources.  

- **Monitoring and Operations**:  
  - CloudWatch Logs captures application logs (errors, prediction counts).  
  - CloudWatch Metrics monitors CPU, memory (via CloudWatch agent), and network traffic.  

### 4. Technical Implementation
**Implementation Phases**

The workshop is divided into several phases, guiding participants from a local model to a deployed AWS solution:

1. **Model Preparation and Packaging**  
   - Train a churn prediction model locally or on a notebook.  
   - Export the model to a `.pkl` or `.joblib` file.  
   - Upload the model file to an S3 bucket.  

2. **Infrastructure Setup on AWS**  
   - Launch an Amazon EC2 instance (Ubuntu / Amazon Linux).  
   - Configure the instance within a VPC and set up an appropriate Security Group.  
   - Attach an IAM Role that allows `s3:GetObject` on the model bucket.  

3. **Application Development and Deployment**  
   - Install Python, pip, and required libraries (e.g., `streamlit`, `pandas`, `scikit-learn`).  
   - Clone the workshop GitHub repository to EC2.  
   - Add code in the Streamlit app to download and load the model from S3 at startup.  
   - Expose the application on port 8501 (or 80/443 with a reverse proxy).  

4. **Testing and Hardening**  
   - Verify that predictions are correct and consistent with the local notebook.  
   - Test access from a browser using the EC2 public DNS or IP.  
   - Configure CloudWatch for logs and alerts.  

### 5. Timeline & Milestones
**Project Timeline (Workshop-Oriented)**

- **Session 1 – Introduction & Architecture (Week 1)**  
  - Overview of churn prediction and business use cases.  
  - Walkthrough of the AWS architecture and services used.  

- **Session 2 – Model & S3 (Week 2)**  
  - Train/prepare the churn model.  
  - Upload the model to S3 and test access.  

- **Session 3 – EC2 & Streamlit (Week 3)**  
  - Launch EC2, configure security, install dependencies.  
  - Deploy the Streamlit app and connect it to the model on S3.  

- **Session 4 – Monitoring & Final Demo (Week 4)**  
  - Enable CloudWatch logging and metrics.  
  - Run a full end-to-end demo and discuss improvements (e.g., API Gateway, CI/CD).  

### 6. Budget Estimation
The following cost estimation assumes low traffic and workshop/demo usage:

- **EC2 t2.micro / t3.small**: ~7–10 USD/month (on-demand).  
- **Amazon S3**: ~0.05–0.20 USD/month (model file + small datasets).  
- **Data Transfer**: ~0.02 USD/month (light inbound/outbound usage).  
- **CloudWatch Logs & Metrics**: ~0.03 USD/month (basic logging).  

**Estimated Total**: **~8–12 USD/month** for a single small environment.  

Participants can be guided to use the **AWS Pricing Calculator** to recompute these values for their own scenarios.

### 7. Risk Assessment
#### Risk Matrix
- **EC2 Downtime**: Medium impact, low probability (can be mitigated with proper instance type and health checks).  
- **High CPU/Memory Usage** during peak predictions: High impact, medium probability.  
- **Misconfiguration of IAM or Security Groups**: Medium impact, low probability.  

#### Mitigation Strategies
- Use CloudWatch alarms to detect instance issues early.  
- Scale up to a larger EC2 instance if CPU or memory usage becomes a bottleneck.  
- Follow the principle of least privilege when defining IAM roles.  

#### Contingency Plans
- Keep an AMI (snapshot) or infrastructure-as-code template to quickly recreate the environment.  
- In case of major failure, temporarily fall back to local notebook predictions while the AWS environment is restored.  

### 8. Expected Outcomes
#### Technical Improvements
- A working, browser-accessible churn prediction application deployed on AWS.  
- Participants gain hands-on experience with EC2, S3, IAM, CloudWatch, and basic ML deployment practices.  

#### Long-term Value
- A reusable reference architecture for future ML projects (credit scoring, fraud detection, recommendation, etc.).  
- A foundation that can be extended with CI/CD, API Gateway + Lambda, or containerization (ECS/EKS) in more advanced workshops.

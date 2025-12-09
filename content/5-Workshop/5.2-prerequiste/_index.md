---
title : "Prerequisites"
date : 2025-11-18
weight : 2
chapter : false
pre : " <b> 5.2. </b> "
---

#### 1. Create Key Pair
You need a Key Pair (`.pem` format) to SSH into the EC2 instance.
1. Navigate to **EC2 Console** > **Key Pairs**.
2. Click **Create key pair**.
3. Name: `workshop-aws-streamlit`.
4. File format: `.pem`.

![Key Pair List](/images/5-Workshop/5.2-Prerequisite/key-pair.png)

#### 2. Configure Security Group
To allow the application to be accessible from the internet, you must configure the Security Group (SG):

1. Go to **Security Groups** > **Create security group**.
2. Add the following **Inbound rules**:
   + **SSH (TCP 22):** Source `My IP` (For administration).
   + **Custom TCP (TCP 8501):** Source `Anywhere-IPv4` (0.0.0.0/0) (For Streamlit web access).

![Security Group Rules](/images/5-Workshop/5.2-Prerequisite/security-gr.png)

---
title : "Launch EC2 Instance"
date : 2025-11-18
weight : 3
chapter : false
pre : " <b> 5.3. </b> "
---

In this section, we will launch an EC2 virtual server to host the application.

1. Navigate to **EC2 Dashboard** and click **Launch Instance**.
2. **Name:** `workshop-aws-streamlit`.
3. **OS Images:** Choose **Ubuntu** (Ubuntu Server 20.04 or 22.04 LTS).
4. **Instance Type:** Choose `t3.micro` (or `t2.micro` for Free Tier).
5. **Key Pair:** Select `workshop-aws-streamlit` created earlier.

![Launch Instance Config](/images/5-Workshop/5.3-Launch-EC2/launch-ins.png)

6. **Network settings:**
   + Choose **Select existing security group**.
   + Select the Security Group configured in section 5.2.
7. Click **Launch instance**.

Once launched, copy the **Public IPv4 address** of the instance for the next steps.

![Instance Details](/images/5-Workshop/5.3-Launch-EC2/ins-details.png)

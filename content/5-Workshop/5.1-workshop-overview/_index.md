---
title : "Overview"
date : 2025-11-18
weight : 1
chapter : false
pre : " <b> 5.1. </b> "
---

#### Workshop Goals
In this lab, we will:
+ Launch an **EC2 (Ubuntu)** virtual server.
+ Configure the network environment (**Security Group**) to allow web access.
+ SSH connection and install **Python/Streamlit** environment.
+ Deploy source code from Github and run the prediction app.

#### Workflow
End-users will access the EC2's Public IP address via a web browser on port **8501**. Inside the EC2, the Streamlit application will process requests, invoke the model, and return visualized results.

#### Architecture Diagram
![Architecture Diagram](/images/5-Workshop/5.1-Workshop-overview/diagram.png)

---
title : "Các bước chuẩn bị"
date : 2025-11-18
weight : 2
chapter : false
pre : " <b> 5.2. </b> "
---

#### 1. Tạo Key Pair
Bạn cần có một Key Pair (định dạng `.pem`) để kết nối SSH vào EC2. 
1. Truy cập **EC2 Console** > **Key Pairs**.
2. Chọn **Create key pair**.
3. Đặt tên: `workshop-aws-streamlit`.
4. Định dạng: `.pem`.

![Key Pair List](/images/5-Workshop/5.2-Prerequisite/key-pair.png)

#### 2. Cấu hình Security Group
Để ứng dụng hoạt động và có thể truy cập từ internet, bạn cần cấu hình Security Group (SG) cho EC2:

1. Vào **Security Groups** > **Create security group**.
2. Thêm các **Inbound rules** sau:
   + **SSH (TCP 22):** Source `My IP` (Để quản trị).
   + **Custom TCP (TCP 8501):** Source `Anywhere-IPv4` (0.0.0.0/0) (Để truy cập web Streamlit).

![Security Group Rules](/images/5-Workshop/5.2-Prerequisite/security-gr.png)

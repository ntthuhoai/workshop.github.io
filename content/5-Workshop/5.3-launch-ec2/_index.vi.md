---
title : "Khởi tạo EC2 Instance"
date : 2025-11-18
weight : 3
chapter : false
pre : " <b> 5.3. </b> "
---

Trong phần này, chúng ta sẽ tạo một máy chủ ảo EC2 để host ứng dụng.

1. Truy cập **EC2 Dashboard** và chọn **Launch Instance**.
2. **Name:** Đặt tên là `workshop-aws-streamlit`.
3. **OS Images:** Chọn **Ubuntu** (Ubuntu Server 20.04 hoặc 22.04 LTS).
4. **Instance Type:** Chọn `t3.micro` (hoặc `t2.micro` nếu dùng Free Tier).
5. **Key Pair:** Chọn `workshop-aws-streamlit` đã tạo ở bước trước.

![Launch Instance Config](/images/5-Workshop/5.3-Launch-EC2/launch-ins.png)

6. **Network settings:**
   + Chọn **Select existing security group**.
   + Chọn Security Group bạn đã cấu hình ở phần 5.2.
7. Nhấn **Launch instance**.

Sau khi khởi tạo xong, hãy copy địa chỉ **Public IPv4 address** của instance để sử dụng cho bước tiếp theo.

![Instance Details](/images/5-Workshop/5.3-Launch-EC2/ins-details.png)

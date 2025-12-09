---
title : "Dọn dẹp tài nguyên"
date : 2025-11-18
weight : 6
chapter : false
pre : " <b> 5.6. </b> "
---

Để tránh phát sinh chi phí, hãy xóa các tài nguyên sau khi hoàn thành workshop:

#### 1. Terminate EC2
+ Vào **EC2 Dashboard** > **Instances**.
+ Chọn instance `workshop-aws-streamlit`.
+ Chọn **Instance State** > **Terminate instance**.
   
![Terminate EC2](/images/5-Workshop/5.6-Cleanup/stop.png)

#### 2. Xóa Security Group
(Tùy chọn) Xóa Security Group nếu không còn sử dụng.

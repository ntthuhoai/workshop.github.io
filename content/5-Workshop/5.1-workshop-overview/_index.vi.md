---
title : "Tổng quan"
date : 2025-11-18
weight : 1
chapter : false
pre : " <b> 5.1. </b> "
---

#### Mục tiêu Workshop
Trong bài lab này, chúng ta sẽ thực hiện:
+ Khởi tạo một máy chủ ảo **EC2 (Ubuntu)**.
+ Cấu hình môi trường mạng (**Security Group**) để cho phép truy cập web.
+ Kết nối SSH và cài đặt môi trường **Python/Streamlit**.
+ Triển khai source code từ Github và chạy ứng dụng dự đoán.

#### Luồng hoạt động
Người dùng cuối (User) sẽ truy cập vào địa chỉ Public IP của EC2 thông qua trình duyệt web trên port **8501**. Bên trong EC2, ứng dụng Streamlit sẽ xử lý các yêu cầu, gọi model và trả về kết quả hiển thị trực quan.

#### Sơ đồ kiến trúc
![Architecture Diagram](/images/5-Workshop/5.1-Workshop-overview/diagram.png)

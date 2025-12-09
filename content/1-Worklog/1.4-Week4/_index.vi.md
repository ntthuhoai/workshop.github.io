---
title: "Tuần 4"
date: 2025-11-18
weight: 4
chapter: false
pre: " <b> 1.4. </b> "
---

### Mục tiêu tuần 4 (từ ngày 29/09/2025 - 03/10/2025)

* Hiểu rõ các dịch vụ lưu trữ trên AWS 
* Thành thạo việc triển khai S3 và chiến lược sao lưu toàn diện với AWS Backup

### Các công việc cần triển khai trong tuần này:
| Thứ | Công việc | Nguồn tài liệu |
| :---: | :--- | :--- |
| **Thứ 2** | - Tìm hiểu về các dịch vụ lưu trữ trên AWS <br>&emsp; + Amazon Simple Storage Service - S3<br>&emsp; +  Amazon Storage Gateway <br>&emsp; +  Snow Family: Snowball, Snowball Edge, Snowmobile<br>&emsp; +  Các chiến lược phục hồi thảm họa trên AWS: sao lưu và khôi phục, pilow light, low capacity active-active, full capacity active-active<br>&emsp; +  AWS Backup |  |
| **Thứ 3** | - Thực hành trên S3 bucket <br>  &emsp; +  Chuẩn bị: tạo S3 bucket và tải dữ liệu<br>  &emsp; + Bật tính năng Static website <br>  &emsp; + Cấu hình Block Public Access và public object<br>  &emsp; + Kiểm tra web, tăng tốc static web với Cloudfront<br>  &emsp; + Di chuyển Object và sao chép S3 Object sang region khác| <https://000057.awsstudygroup.com/> |
| **Thứ 4** |- Triển khai AWS Backup vào hệ thống: chuẩn bị hạ tầng, khởi tạo Backup Plan, thiết lập Notification và kiểm tra hoạt động <br> - Thực hành VM Import/Export: chuẩn bị máy ảo, import máy ảo lên AWS và export máy ảo từ AWS |<https://000013.awsstudygroup.com/> <https://000014.awsstudygroup.com/> |
| **Thứ 5** | - Triển khai File Storage Gateway để thiết lập một File Sharing kết nối với các máy ở On-premise  <br>  &emsp; + Chuẩn bị môi trường: tạo S3 Bucket và tạo EC2 cho Storage Gateway <br>  &emsp; +  Sử dụng AWS Storage Gateway: tạo Storage Gateway, tạo File Shares, kết nối File Shares ở máy Onpremise |<https://000024.awsstudygroup.com/> |
| **Thứ 6** |- Thiết lập hệ thống lưu trữ dữ liệu chung cho cơ sở hạ tầng Windows với FSX<br>  &emsp; +  Tạo môi trường thực hành, SSD Multi-AZ file system và HDD Multi-AZ file system <br>  &emsp; + Tạo file share<br>  &emsp; +  Kiểm tra và giám sát hiệu năng <br>  &emsp; +  Quản lý session người dùng và mở tệp <br>  &emsp; + Kích hoạt hạn ngạch bộ nhớ của người dùng và kích hoạt truy cập chia sẻ liên tục <br>  &emsp; +  Mở rộng khả năng thông lượng và mở rộng dung lượng lưu trữ file    | <https://000025.awsstudygroup.com/>| 


---
title: "Bản đề xuất"
date: 2025-11-18
weight: 2
chapter: false
pre: " <b> 2. </b> "
---

# Nền tảng Dự đoán Khách hàng Rời bỏ Ngân hàng trên AWS  
## Giải pháp triển khai mô hình Machine Learning dự đoán churn khách hàng

### 1. Tóm tắt điều hành  
Nền tảng *Customer Churn Prediction* là một giải pháp trên AWS dùng để triển khai và vận hành mô hình Machine Learning dự đoán khả năng khách hàng rời bỏ ngân hàng. Hệ thống cung cấp giao diện web nội bộ để nhân viên nhập thông tin khách hàng và nhận ngay xác suất churn.  

Giải pháp tận dụng **Amazon EC2** để chạy ứng dụng web Streamlit, **Amazon S3** để lưu trữ mô hình và dữ liệu, **AWS IAM** để quản lý quyền truy cập, **Amazon CloudWatch** để giám sát, cùng **Amazon VPC** và **Security Group** để kiểm soát luồng mạng. Kiến trúc được thiết kế đơn giản, chi phí thấp, phù hợp cho workshop, đồ án sinh viên hoặc môi trường thử nghiệm/production quy mô nhỏ của đội phân tích ngân hàng.

### 2. Tuyên bố vấn đề  
*Vấn đề hiện tại*  
- Mô hình churn thường được chạy trên notebook hoặc máy cá nhân của data scientist.  
- Người dùng nghiệp vụ không có môi trường tập trung để tự tra cứu kết quả dự đoán.  
- File mô hình (.pkl / .joblib) được chia sẻ thủ công (email, chat), tiềm ẩn rủi ro bảo mật và khó quản lý phiên bản.  
- Việc demo giải pháp cho lãnh đạo/khách hàng thiếu tính chuyên nghiệp và khó lặp lại.  

*Giải pháp*  
Workshop đề xuất triển khai mô hình churn lên AWS với kiến trúc đơn giản nhưng sát thực tế:
- Ứng dụng web **Streamlit** chạy trên **Amazon EC2**, xử lý giao diện và logic dự đoán.  
- Mô hình đã huấn luyện được lưu trên **Amazon S3** và được EC2 tải về khi khởi động.  
- **IAM Role** cấp quyền cho EC2 đọc model từ S3 mà không cần hard-code access key.  
- **Amazon CloudWatch** thu thập log và metric để giám sát hệ thống.  
- **Amazon VPC** và **Security Group** giới hạn truy cập chỉ qua các port/builder được cấu hình (ví dụ HTTP/HTTPS hoặc port 8501 cho Streamlit).  

Giải pháp biến một mô hình offline thành dịch vụ dự đoán online, có thể truy cập từ trình duyệt trong phạm vi mạng được cho phép.

*Lợi ích và hoàn vốn đầu tư (ROI)*  
- Hỗ trợ đội ngũ ngân hàng ra quyết định giữ chân khách hàng nhanh hơn, dựa trên xác suất churn.  
- Giảm ~80–90% thao tác thủ công so với chạy notebook mỗi lần cần dự đoán.  
- Tạo một kiến trúc mẫu end-to-end ML trên AWS, dễ giảng dạy và tái sử dụng cho các bài toán khác.  

Chi phí hạ tầng ước tính cho 1 môi trường nhỏ khoảng **8–12 USD/tháng**, rất phù hợp cho môi trường học tập, demo hoặc PoC doanh nghiệp.

### 3. Kiến trúc giải pháp  
Giải pháp sử dụng kiến trúc AWS như sau:

![Kiến trúc dự đoán Customer Churn](/images/2-Proposal/Streamlit.png)

- **User (Web Browser)** → truy cập ứng dụng Streamlit qua endpoint public của EC2.  
- **Amazon VPC + Security Group** → kiểm soát traffic vào/ra (HTTP/HTTPS hoặc port 8501).  
- **Amazon EC2** → chạy ứng dụng Streamlit và load mô hình ML vào RAM để suy luận.  
- **Amazon S3** → lưu file mô hình churn đã huấn luyện và (tuỳ chọn) dữ liệu log dự đoán.  
- **AWS IAM Role** → cho phép EC2 đọc model từ S3 một cách bảo mật.  
- **Amazon CloudWatch** → thu thập log và metric của EC2 để giám sát vận hành.  

*Dịch vụ AWS sử dụng*  
- *Amazon EC2*: Chạy ứng dụng Streamlit và mã suy luận mô hình ML.  
- *Amazon S3*: Lưu trữ file mô hình (.pkl/.joblib) và (tuỳ chọn) dữ liệu input/output.  
- *AWS IAM*: Tạo IAM Role cho EC2, cấp quyền `s3:GetObject` tới bucket chứa model.  
- *Amazon CloudWatch*: Gom log, metric và cấu hình cảnh báo.  
- *Amazon VPC & Security Group*: Cô lập mạng và giới hạn port truy cập ứng dụng.  
- *(Tuỳ chọn)* *Amazon API Gateway + AWS Lambda*: Có thể bổ sung nếu muốn chuyển sang mô hình REST API serverless.  

*Thiết kế thành phần*  
- *Giao diện web (Streamlit trên EC2)*:  
  - Hiển thị form nhập thông tin khách hàng (tuổi, thời gian gắn bó, số dư, số sản phẩm, v.v.).  
  - Gửi dữ liệu vào logic Python trong cùng ứng dụng để xử lý và dự đoán.  

- *Lớp suy luận mô hình*:  
  - Tải model từ S3 (hoặc từ disk sau lần tải đầu).  
  - Thực hiện tiền xử lý dữ liệu và tính xác suất churn.  
  - Trả kết quả dưới dạng phần trăm và nhãn “Nguy cơ cao / trung bình / thấp”.  

- *Lưu trữ & bảo mật*:  
  - Bucket S3 chứa model, có thể thêm thư mục log dự đoán cho mục đích phân tích.  
  - IAM Role đảm bảo chỉ EC2 được quyền truy cập cần thiết.  

- *Giám sát vận hành*:  
  - CloudWatch Logs lưu log truy cập, lỗi, số lượng request.  
  - CloudWatch Metrics theo dõi CPU, network; có thể cấu hình Alarm khi vượt ngưỡng.  

### 4. Triển khai kỹ thuật  
*Các giai đoạn triển khai (theo dạng workshop)*  

1. *Chuẩn bị mô hình và đóng gói*  
   - Huấn luyện mô hình churn (Random Forest / XGBoost, v.v.).  
   - Lưu model ra file `.pkl` hoặc `.joblib`.  
   - Upload file model lên bucket S3.  

2. *Thiết lập hạ tầng AWS*  
   - Tạo EC2 (Ubuntu hoặc Amazon Linux) trong VPC.  
   - Cấu hình Security Group cho phép port 8501 (hoặc HTTP/HTTPS).  
   - Gán IAM Role cho EC2 với quyền đọc S3.  

3. *Phát triển & deploy ứng dụng*  
   - Cài Python, pip, các thư viện (`streamlit`, `pandas`, `scikit-learn`, …).  
   - Clone repository workshop từ GitHub lên EC2.  
   - Bổ sung code tải model từ S3, load vào Streamlit app.  
   - Chạy ứng dụng:  
     ```bash
     streamlit run app.py --server.port 8501
     ```  

4. *Kiểm thử & hoàn thiện*  
   - So sánh kết quả dự đoán trên EC2 với notebook local để đảm bảo tính nhất quán.  
   - Kiểm tra truy cập từ browser qua public IP/DNS.  
   - Bật CloudWatch Logs và Alarm cơ bản.  

### 5. Lộ trình & Mốc triển khai  
- *Buổi 1 – Tổng quan & Kiến trúc*:  
  - Giới thiệu bài toán churn và use case trong ngân hàng.  
  - Trình bày kiến trúc AWS sử dụng trong workshop.  

- *Buổi 2 – Mô hình & S3*:  
  - Huấn luyện/chuẩn bị mô hình churn.  
  - Upload mô hình lên S3, kiểm tra quyền truy cập.  

- *Buổi 3 – EC2 & Streamlit*:  
  - Tạo EC2, cài đặt môi trường, clone code.  
  - Kết nối Streamlit với model trên S3 và mở port cho truy cập.  

- *Buổi 4 – Giám sát & Demo*:  
  - Cấu hình CloudWatch Logs/Metrics.  
  - Chạy demo end-to-end, thảo luận hướng nâng cấp (API Gateway, CI/CD, container, …).  

### 6. Ước tính ngân sách  
*Chi phí hạ tầng ước tính*  
- EC2 t2.micro / t3.small: 7–10 USD/tháng.  
- S3: 0,05–0,20 USD/tháng (model + một ít dữ liệu).  
- Truyền dữ liệu: 0,02 USD/tháng (lưu lượng nhỏ).  
- CloudWatch Logs & Metrics: 0,03 USD/tháng (log cơ bản).  

*Tổng*: khoảng **8–12 USD/tháng** cho một môi trường workshop.  

Người tham gia có thể tự điều chỉnh và tính lại trên **AWS Pricing Calculator** tuỳ theo nhu cầu.

### 7. Đánh giá rủi ro  
*Ma trận rủi ro*  
- EC2 bị downtime: Ảnh hưởng trung bình, xác suất thấp.  
- CPU/RAM quá tải khi nhiều request: Ảnh hưởng cao, xác suất trung bình.  
- Sai cấu hình IAM/Security Group: Ảnh hưởng trung bình, xác suất thấp.  

*Chiến lược giảm thiểu*  
- Dùng CloudWatch Alarm để phát hiện sớm sự cố.  
- Tăng kích cỡ EC2 khi tải cao.  
- Thiết kế IAM theo nguyên tắc “least privilege”.  

*Kế hoạch dự phòng*  
- Tạo AMI hoặc template hạ tầng (CloudFormation/CDK) để khôi phục nhanh.  
- Trong trường hợp sự cố lớn, tạm thời dùng notebook local cho dự đoán trong khi khôi phục môi trường AWS.  

### 8. Kết quả kỳ vọng  
*Cải tiến kỹ thuật*  
- Có một ứng dụng web dự đoán churn chạy thực tế trên AWS, truy cập qua trình duyệt.  
- Học viên nắm được quy trình cơ bản đưa mô hình ML từ notebook lên môi trường cloud.  

*Giá trị dài hạn*  
- Kiến trúc mẫu có thể tái sử dụng cho nhiều bài toán ML khác (chấm điểm tín dụng, phát hiện gian lận, gợi ý sản phẩm, v.v.).  
- Là nền tảng để mở rộng sang CI/CD, serverless, container, hoặc MLOps trong các workshop nâng cao.

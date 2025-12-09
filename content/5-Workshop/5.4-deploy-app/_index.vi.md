---
title : "Triển khai ứng dụng"
date : 2025-11-18
weight : 4
chapter : false
pre : " <b> 5.4. </b> "
---

Chúng ta sẽ sử dụng Terminal trên máy cá nhân để SSH vào EC2 và cài đặt ứng dụng.

#### 1. Kết nối SSH
Mở Terminal tại thư mục chứa file key `.pem` của bạn và chạy lệnh sau (thay thế địa chỉ DNS/IP bằng địa chỉ thực tế của bạn):

```bash
# Cấp quyền cho file key (nếu dùng Linux/Mac)
chmod 400 workshop-aws-streamlit.pem

# Kết nối SSH
ssh -i "workshop-aws-streamlit.pem" ubuntu@<Public-IPv4-DNS-Của-Bạn>
```

![SSH Connection](/images/5-Workshop/5.4-Deploy-App/ssh.png)

#### 2. Cài đặt môi trường

Sau khi đã SSH thành công, chạy các lệnh sau để tải code và cài đặt thư viện:

```bash
cd ~
# Clone source code
git clone https://github.com/Ntthuhoai/Workshop-AWS.git

# Di chuyển vào thư mục dự án
cd Workshop-AWS/Credit_Card_Customers

# Tạo môi trường ảo và cài đặt thư viện
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt
```

![Install Dependencies](/images/5-Workshop/5.4-Deploy-App/install.png)

#### 3. Chạy ứng dụng

Khởi chạy Streamlit:

```bash
streamlit run app.py
```

Nếu thành công, bạn sẽ thấy thông báo `You can now view your Streamlit app in your browser.` cùng với các đường dẫn URL.

![Streamlit Running](/images/5-Workshop/5.4-Deploy-App/run-app.png)

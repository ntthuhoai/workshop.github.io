---
title: Blog 1
date: 2025-11-18
weight: 1
chapter: false
pre: " <b> 3.1. </b> "
---


# **Phiên bản Amazon EC2 M8a đa dụng mới hiện đã có sẵn**
Hôm nay, chúng tôi công bố sự ra mắt của các phiên bản [Amazon Elastic Compute Cloud (Amazon EC2)](https://aws.amazon.com/ec2/) M8a, phiên bản mới nhất trong dòng phiên bản M đa dụng. Các phiên bản này được trang bị bộ vi xử lý AMD EPYC thế hệ thứ 5 ([5th Generation AMD EPYC (codename Turin) processors](https://www.amd.com/en/products/processors/server/epyc/9005-series.html) ) với tần số tối đa 4.5GHz. Khách hàng có thể mong đợi hiệu suất cao hơn tới 30% và hiệu suất giá tốt hơn tới 19% so với phiên bản M7a. Các phiên bản này cũng cung cấp băng thông bộ nhớ cao hơn, thông lượng mạng và lưu trữ được cải thiện, cùng các tùy chọn cấu hình linh hoạt cho nhiều khối lượng công việc đa năng. general-purpose workloads.


**Những cải tiến trong M8a**  
Các phiên bản M8a mang lại hiệu suất trên mỗi vCPU tốt hơn tới 30% so với các phiên bản M7a, khiến chúng trở nên lý tưởng cho các ứng dụng yêu cầu lợi ích từ hiệu suất cao và thông lượng cao như ứng dụng tài chính, trò chơi, kết xuất (rendering), máy chủ ứng dụng, mô hình mô phỏng, kho dữ liệu cỡ vừa, môi trường phát triển ứng dụng, và các cụm bộ nhớ đệm (caching fleets).

Chúng cung cấp thêm 45% băng thông bộ nhớ so với các phiên bản M7a, tăng tốc cơ sở dữ liệu trong bộ nhớ (in-memory databases), bộ nhớ đệm phân tán (distributed caches) và phân tích thời gian thực (real-time analytics).

Đối với các khối lượng công việc có yêu cầu I/O cao, phiên bản M8a cung cấp băng thông mạng lên đến 75 Gbps và băng thông [Amazon Elastic Block Store (Amazon EBS)](https://aws.amazon.com/ebs/) lên đến 60 Gbps, cải thiện 50% so với thế hệ trước. Những cải tiến này hỗ trợ các ứng dụng hiện đại dựa trên truyền dữ liệu nhanh và giao tiếp mạng có độ trễ thấp

Mỗi vCPU trên phiên bản M8a tương ứng với một lỗi CPU vật lý, nghĩa là không có đa luồng đồng thời (simultaneous multithreading - SMT). Trong các bài kiểm tra chuẩn ứng dụng, phiên bản M8a mang lại hiệu suất nhanh hơn tới 60% cho [GroovyJVM](https://groovy-lang.org/) và hiệu suất nhanh hơn tới 39% cho [Cassandra](https://cassandra.apache.org/_/index.html) so với các phiên bản M7a.

Các phiên bản M8a hỗ trợ cấu hình băng thông phiên bản ([instance bandwidth configuration - IBC](https://docs.aws.amazon.com/ebs/latest/userguide/instance-bandwidth-configuration.html)), cung cấp sự linh hoạt trong việc phân bổ tài nguyên giữa băng thông mạng và băng thông EBS. Điều này mang lại cho khách hàng khả năng mở rộng băng thông mạng hoặc EBS lên đến 25% và cải thiện hiệu suất cơ sở dữ liệu, tốc độ xử lý truy vấn và ghi log.

Các phiên bản M8a có sẵn với mười kích cỡ ảo hóa và hai tùy chọn máy chủ vật lý bare metal (metal-24xl và metal-48xl), cung cấp nhiều lựa chọn triển khai có thể mở rộng từ các ứng dụng nhỏ đến khối lượng công việc của doanh nghiệp lớn. Tất cả những cải tiến này đều được xây dựng trên [AWS Nitro System](https://aws.amazon.com/ec2/nitro/), mang lại chi phí ảo hóa thấp, hiệu suất ổn định và bảo mật nâng cao trên mọi kích thước phiên bản. Các phiên bản này được xây dựng bằng cách sử dụng AWS Nitro Cards thế hệ thứ sáu mới nhất, giúp giảm tải và tăng tốc I/O cho các chức năng, tăng hiệu suất hệ thống tổng thể.

Các phiên bản M8a có các kích cỡ lên đến 192 vCPU với 768GiB RAM. Dưới đây là các thông số kỹ thuật chi tiết:
| Kích thước instance | vCPU | RAM (GiB) | Băng thông mạng | Băng thông EBS |
|---|---|---|---|---|
| m8a.medium | 1 | 4 | lên đến 12.5 Gbps | lên đến 10 Gbps |
| m8a.large | 2 | 8 | lên đến 12.5 Gbps | lên đến 10 Gbps |
| m8a.xlarge | 4 | 16 | lên đến 12.5 Gbps | lên đến 10 Gbps |
| m8a.2xlarge | 8 | 32 | lên đến 15 Gbps | lên đến 10 Gbps |
| m8a.4xlarge | 16 | 64 | lên đến 15 Gbps | lên đến 10 Gbps |
| m8a.8xlarge | 32 | 128 | 15 Gbps | 10 Gbps |
| m8a.12xlarge | 48 | 192 | 22.5 Gbps | 15 Gbps |
| m8a.16xlarge | 64 | 256 | 30 Gbps | 20 Gbps |
| m8a.24xlarge | 96 | 384 | 40 Gbps | 30 Gbps |
| m8a.48xlarge | 192 | 768 | 75 Gbps | 60 Gbps |
| m8a.metal-24xl | 96 | 384 | 40 Gbps | 30 Gbps |
| m8a.metal-48xl | 192 | 768 | 75 Gbps | 60 Gbps | 
Để có danh sách đầy đủ về kích thước và thông số kỹ thuật của phiên bản, tham khảo [Amazon EC2 M8a instances page](https://aws.amazon.com/ec2/instance-types/m8a).

**Khi nào nên sử dụng phiên bản M8a?**
M8a rất phù hợp với các ứng dụng đa năng cần sự cân bằng giữa tính toán, bộ nhớ và mạng. Phiên bản M8a lý tưởng cho lưu trữ web và ứng dụng, kiến trúc microservices và cơ sở dữ liệu, nơi hiệu suất có thể dự đoán được và khả năng mở rộng hiệu quả là yếu tố quan trọng.

Các phiên bản này được chứng nhận SAP và cũng rất phù hợp với các khối lượng công việc doanh nghiệp như ứng dụng tài chính và hệ thống hoạch định nguồn lực doanh nghiệp (enterprise resource planning - ERP). Chúng cũng hiệu quả tương đương cho bộ nhớ đệm trong bộ nhớ (in-memory caching) và quản lý quan hệ khách hàng (CRM), bên cạnh các môi trường phát triển và thử nghiệm đòi hỏi hiệu quả chi phí và sự linh hoạt. Với tính linh hoạt này, M8a hỗ trợ nhiều khối lượng công việc khác nhau đồng thời giúp khách hàng cải thiện hiệu suất giá.

**Hiện đã có sẵn**  
Các phiên bản Amazon EC2 M8a hiện đã có sẵn tại các khu vực [AWS](https://docs.aws.amazon.com/glossary/latest/reference/glos-chap.html#region) US East (Ohio), US West (Oregon) và Europe (Spain). Các phiên bản M8a có thể được mua dưới dạng [On-Demand](https://aws.amazon.com/ec2/pricing/on-demand/), [Savings Plans](https://aws.amazon.com/savingsplans/), và [Spot Instances](https://aws.amazon.com/ec2/spot/pricing/). Các phiên bản M8a cũng có sẵn trên [Dedicated Hosts](https://aws.amazon.com/ec2/dedicated-hosts/pricing/). Để tìm hiểu thêm, hãy truy cập trang [Amazon EC2 Pricing](https://aws.amazon.com/ec2/pricing).

Để tìm hiểu thêm, hãy truy cập trang [Amazon EC2 M8a instances](https://aws.amazon.com/ec2/instance-types/m8a) và gửi phản hồi tới [AWS re:Post for EC2](https://repost.aws/tags/TAO-wqN9fYRoyrpdULLa5y7g/amazon-ec-2/) hoặc qua các liên hệ hỗ trợ AWS thông thường của bạn.
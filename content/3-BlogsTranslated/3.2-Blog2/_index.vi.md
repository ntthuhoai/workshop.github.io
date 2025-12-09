---
title: Blog 2
date: 2025-11-18
weight: 2
chapter: false
pre: " <b> 3.2. </b> "
---


# Giới thiệu các phiên bản Amazon EC2 C8i và C8i-flex mới được tối ưu hóa khả năng tính toán

Sau khi ra mắt phiên bản [R8i và R8i-flex](https://aws.amazon.com/blogs/aws/best-performance-and-fastest-memory-with-the-new-amazon-ec2-r8i-and-r8i-flex-instances/) được tối ưu hóa bộ nhớ của [Amazon Elastic Compute Cloud (Amazon EC2)](https://aws.amazon.com/pm/ec2/?trk=7c8639c6-87c6-47d6-9bd0-a5812eecb848&sc_channel=el) và các phiên bản [M8i và M8i-flex](https://aws.amazon.com/blogs/aws/new-general-purpose-amazon-ec2-m8i-and-m8i-flex-instances-are-now-available/) đa năng, tôi vui mừng thông báo về việc ra mắt rộng rãi các phiên bản [C8i và C8i-flex](https://aws.amazon.com/ec2/instance-types/c8i/) được tối ưu hóa tính toán, chạy trên bộ xử lý Intel Xeon 6 tùy chỉnh, chỉ có trên AWS với tần số turbo tất cả các lõi duy trì ở mức 3.9 GHz và có tỷ lệ bộ nhớ so với vCPU là 2:1. Các phiên bản này mang lại hiệu suất cao nhất và băng thông bộ nhớ nhanh nhất trong số các bộ xử lý Intel tương đương trên nền tảng đám mây.

Các phiên bản C8i và C8i-flex mang lại hiệu suất giá tốt hơn tới 15% và băng thông bộ nhớ cao hơn 2.5 lần so với các phiên bản [C7i và C7i-flex](https://aws.amazon.com/ec2/instance-types/c7i/). Các phiên bản C8i và C8i-flex nhanh hơn tới 60% đối với các ứng dụng web NGINX, nhanh hơn tới 40% đối với các mô hình đề xuất học sâu AI và nhanh hơn 35% đối với các kho lưu trữ Memcached so với các phiên bản C7i và C7i-flex.

Các phiên bản C8i và C8i-flex lý tưởng để chạy các khối lượng công việc tính toán chuyên sâu (compute-intensive), chẳng hạn như máy chủ web, bộ nhớ đệm, Apache.Kafka, ElasticSearch, xử lý hàng loạt (batch processing), phân tích phân tán, điện toán hiệu suất cao (high performance computing- HPC), phân phối quảng cáo, trò chơi nhiều người chơi có khả năng mở rộng cao và mã hóa video.

Giống như các phiên bản thế hệ thứ 8 khác, các phiên bản này sử dụng thẻ [AWS Nitro Cards](https://aws.amazon.com/ec2/nitro/) thế hệ thứ sáu mới, cung cấp băng thông mạng và [Amazon Elastic Block Storage (Amazon EBS)](https://aws.amazon.com/ebs/) nhiều hơn tới hai lần so với các phiên bản thế hệ trước. Chúng cũng hỗ trợ cấu hình băng thông với khả năng điều chỉnh phân bổ 25% giữa băng thông mạng và Amazon EBS, cho phép cải thiện hiệu suất cơ sở dữ liệu, tốc độ xử lý truy vấn và ghi log tốt hơn

**Các phiên bản C8i**  
Phiên bản C8i cung cấp tối đa 384 vCPUs và 768 GiB bộ nhớ, bao gồm các phiên bản bare metal cung cấp quyền truy cập chuyên dụng vào phần cứng vật lý bên dưới. Các phiên bản này giúp bạn chạy các khối lượng công việc tính toán chuyên sâu, chẳng hạn như suy luận dựa trên CPU (CPU-based inference) và phát trực tuyến video cần kích thước phiên bản lớn nhất hoặc CPU cao liên tục.

Dưới đây là thông số kỹ thuật cho phiên bản C8i:


| Kích cỡ phiên bản  | vCPUs | Memory (GiB) | Network bandwidth (Gbps) | EBS bandwidth (Gbps) |
|--------------------|--------|---------------|----------------------------|------------------------|
| c8i.large          | 2      | 4             | lên đến 12.5               | lên đến 10             |
| c8i.xlarge         | 4      | 8             | lên đến 12.5               | lên đến 10             |
| c8i.2xlarge        | 8      | 16            | lên đến 15                 | lên đến 10             |
| c8i.4xlarge        | 16     | 32            | lên đến 15                 | lên đến 10             |
| c8i.8xlarge        | 32     | 64            | 15                         | 10                     |
| c8i.12xlarge       | 48     | 96            | 22.5                       | 15                     |
| c8i.16xlarge       | 64     | 128           | 30                         | 20                     |
| c8i.24xlarge       | 96     | 192           | 40                         | 30                     |
| c8i.32xlarge       | 128    | 256           | 50                         | 40                     |
| c8i.48xlarge       | 192    | 384           | 75                         | 60                     |
| c8i.96xlarge       | 384    | 768           | 100                        | 80                     |
| c8i.metal-48xl     | 192    | 384           | 75                         | 60                     |
| c8i.metal-96xl     | 384    | 768           | 100                        | 80                     |


**Các phiên bản C8i-flex**  
Các phiên bản C8i-flex là một biến thể chi phí thấp hơn của các phiên bản C8i, với hiệu năng cao hơn 5% và mức giá thấp hơn 5%. Các phiên bản này được thiết kế cho các khối lượng công việc được hưởng lợi từ hiệu suất thế hệ mới nhất nhưng không sử dụng hết tất cả tài nguyên tính toán. Các phiên bản này có thể đạt tới hiệu suất CPU tối đa 95% thời gian.

Dưới đây là thông số kỹ thuật của phiên bản C8i-flex:

| Kích thước phiên bản  | vCPUs | Memory (GiB) | Network bandwidth (Gbps) | EBS bandwidth (Gbps) |
|------------------------|-------|--------------|---------------------------|-----------------------|
| c8i-flex.large         | 2     | 4            | lên đến 12.5              | lên đến 10            |
| c8i-flex.xlarge        | 4     | 8            | lên đến 12.5              | lên đến 10            |
| c8i-flex.2xlarge       | 8     | 16           | lên đến 15                | lên đến 10            |
| c8i-flex.4xlarge       | 16    | 32           | lên đến 15                | lên đến 10            |
| c8i-flex.8xlarge       | 32    | 64           | lên đến 15                | lên đến 10            |
| c8i-flex.12xlarge      | 48    | 96           | lên đến 22.5              | lên đến 15            |
| c8i-flex.16xlarge      | 64    | 128          | lên đến 30                | lên đến 20            |


Nếu bạn hiện đang sử dụng các thế hệ phiên bản tối ưu hóa tính toán trước đó, bạn có thể áp dụng phiên bản C8i-flex mà không cần phải thay đổi ứng dụng hoặc khối lượng công việc của mình.

**Hiện đã có sẵn**

Các phiên bản Amazon EC2 C8i và C8i-flex hiện đã có sẵn tại các khu vực [AWS](https://docs.aws.amazon.com/glossary/latest/reference/glos-chap.html#region) US East (N. Virginia), US East (Ohio), US West (Oregon), và Europe (Spain). Các phiên bản C8i và C8i-flex có thể được mua dưới dạng [On-Demand](https://aws.amazon.com/ec2/pricing/on-demand/?trk=cf96f8ec-de40-4ee0-8b64-3f7cf7660da2&sc_channel=el), [Savings Plan](https://aws.amazon.com/savingsplans/?trk=cc9e0036-98c5-4fa8-8df0-5281f75284ca&sc_channel=el), và [Spot instances](https://aws.amazon.com/ec2/spot/pricing/?trk=307341f6-3463-47d5-ba81-0957847a9b73&sc_channel=el). Các phiên bản C8i cũng có sẵn trong [Dedicated Instances](https://aws.amazon.com/ec2/pricing/dedicated-instances/) và [Dedicated Hosts](https://aws.amazon.com/ec2/dedicated-hosts/pricing/). Để tìm hiểu thêm, hãy truy cập trang [Amazon EC2 Pricing](https://aws.amazon.com/ec2/pricing).

Hãy dùng thử các phiên bản C8i và C8i-flex trong bảng điều khiển [Amazon EC2 console](https://console.aws.amazon.com/ec2/?trk=769a1a2b-8c19-4976-9c45-b6b1226c7d20&sc_channel=el). Để tìm hiểu thêm, hãy truy cập trang [Amazon EC2 C8i instances](https://aws.amazon.com/ec2/instance-types/c8i/) và gửi phản hồi tới [AWS re:Post for EC2](https://repost.aws/tags/TAO-wqN9fYRoyrpdULLa5y7g/amazon-ec-2) hoặc qua các liên hệ hỗ trợ AWS thông thường của bạn.
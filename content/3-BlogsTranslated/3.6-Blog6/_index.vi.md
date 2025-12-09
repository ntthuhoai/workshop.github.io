---
title: Blog 6
date: 2025-11-18
weight: 6
chapter: false
pre: " <b> 3.6. </b> "
---

# Tối ưu hóa khối lượng công việc HPC với AWS Well-Architected Lens được cập nhật

![](https://d2908q01vomqb2.cloudfront.net/e6c3dd630428fd54834172b8fd2735fed9416da4/2025/06/23/HPCBlog-363-header-sm.jpeg)
Khung [Kiến trúc Tốt của AWS](https://aws.amazon.com/architecture/well-architected/) giúp bạn giải quyết những thách thức quan trọng trong việc xây dựng kiến ​​trúc đám mây bằng cách cung cấp các phương pháp thực hành kiến ​​trúc tốt nhất đã được chứng minh. Môi trường Điện toán Hiệu năng Cao (HPC) đòi hỏi những cân nhắc kiến ​​trúc chuyên biệt, khác với khối lượng công việc đám mây thông thường. Khi các tổ chức di chuyển khối lượng công việc HPC của mình sang AWS hoặc xây dựng các khả năng HPC mới trên đám mây, họ thường gặp phải những câu hỏi về phương pháp thực hành kiến ​​trúc tốt nhất:
-   Làm thế nào để đảm bảo kiến ​​trúc HPC của bạn tuân thủ các biện pháp tối ưu hóa chi phí và bảo mật?
    
-   Những mô hình nào được khuyến nghị để mở rộng tài nguyên tính toán một cách hiệu quả?
    
-   Làm thế nào để tối ưu hóa lưu trữ và mạng cho các yêu cầu cụ thể của HPC?
    
-   Dịch vụ AWS nào phù hợp nhất với các loại khối lượng công việc HPC khác nhau?
    

Cho đến nay, việc tìm kiếm câu trả lời cho những câu hỏi này thường đòi hỏi sự tư vấn trực tiếp từ các Kiến trúc sư Giải pháp AWS chuyên về HPC. Hôm nay, chúng tôi xin công bố bản cập nhật cho sách trắng [về Ống kính Điện toán Hiệu năng Cao (HPC) Kiến trúc Tốt của AWS](https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/high-performance-computing-lens.html) , cung cấp cho bạn hướng dẫn kiến ​​trúc toàn diện trong một tài nguyên duy nhất, đáng tin cậy. Ống kính mới được cập nhật này hợp nhất nhiều năm kinh nghiệm triển khai AWS HPC thành các phương pháp hay nhất có cấu trúc, giúp bạn xây dựng và tối ưu hóa khối lượng công việc HPC trên AWS.

Ống kính HPC là một phần của [Khung Kiến trúc Tốt của AWS (AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/) ), một nền tảng đã giúp khách hàng cải thiện kiến ​​trúc đám mây của họ kể từ năm 2015. Khung này giải quyết sáu trụ cột chính: [Vận hành Xuất sắc](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/welcome.html) , [Bảo mật](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html) , [Độ tin cậy](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html) , [Hiệu quả Hiệu suất](https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/welcome.html) , [Tối ưu hóa Chi phí](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/welcome.html) và [Tính bền vững](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sustainability-pillar.html) . Ống kính HPC mở rộng hướng dẫn này để giải quyết những thách thức đặc thù của khối lượng công việc HPC.

## Có gì mới ở Ống kính HPC?

Kể từ lần phát hành HPC Lens gần nhất vào năm 2019, AWS đã giới thiệu nhiều cải tiến về khả năng HPC. Bản cập nhật này tích hợp các công nghệ và bài học kinh nghiệm mới, cung cấp cho bạn những phương pháp tối ưu nhất hiện hành cho khối lượng công việc HPC. Các cập nhật chính bao gồm:

-   [Những tiến bộ của AWS ParallelCluster](https://aws.amazon.com/hpc/parallelcluster/) trong việc xây dựng và quản lý cụm HPC
    
-   Các họ phiên bản tính toán mới [được tối ưu hóa cho HPC](https://aws.amazon.com/ec2/instance-types/#:~:text=Generation%20Instances%20page.-,HPC%20Optimized,-High%20performance%20computing) được thiết kế cho các loại khối lượng công việc cụ thể
    
-   Các tùy chọn lưu trữ nâng cao và các biện pháp tốt nhất cho hệ thống tệp hiệu suất cao
    
-   Khả năng kết nối mạng tiên tiến giúp cải thiện hiệu suất ứng dụng
    
-   Hướng dẫn tích hợp cho các dịch vụ được quản lý bao gồm [AWS Batch](https://aws.amazon.com/batch/) , [Amazon FSx](https://aws.amazon.com/fsx/) và [AWS Parallel Computing Service](https://aws.amazon.com/pcs/)
    
-   Cập nhật các khuyến nghị về bảo mật và tuân thủ
    
-   Chiến lược tối ưu hóa chi phí mới cho khối lượng công việc HPC
    

Những bản cập nhật này cung cấp cho bạn hướng dẫn toàn diện để thiết kế, triển khai và tối ưu hóa khối lượng công việc HPC trên AWS, kết hợp những tiến bộ công nghệ mới nhất và các phương pháp hay nhất đã học được từ quá trình triển khai thực tế.

## Ai nên sử dụng Lens được cập nhật?

Ống kính HPC đặc biệt có giá trị nếu bạn:

-   Lên kế hoạch triển khai HPC mới trên AWS
    
-   Đánh giá kiến ​​trúc HPC hiện tại của bạn so với các phương pháp hay nhất hiện tại
    
-   Tối ưu hóa hiệu suất, bảo mật hoặc chi phí cho khối lượng công việc HPC của bạn
    
-   Chuẩn bị cho việc tăng quy mô hoặc độ phức tạp của môi trường HPC của bạn
    

Cho dù bạn là chuyên gia HPC dày dặn kinh nghiệm hay mới làm quen với HPC dựa trên đám mây, ống kính này đều cung cấp những thông tin chi tiết có giá trị để nâng cao kiến ​​trúc của bạn.

## Bắt đầu

Để bắt đầu xây dựng môi trường HPC được thiết kế tốt trên AWS:

-   Xem lại [những kiến ​​thức cơ bản về AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/?wa-lens-whitepapers.sort-by=item.additionalFields.sortDate&wa-lens-whitepapers.sort-order=desc&wa-guidance-whitepapers.sort-by=item.additionalFields.sortDate&wa-guidance-whitepapers.sort-order=desc#:~:text=AWS%20Well%2DArchitected%20and%20the%20Six%20Pillars) .
    
-   Đọc [sách trắng về AWS Well-Architected HPC Lens](https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/high-performance-computing-lens.html) .
    
-   Xem lại khối lượng công việc của bạn bằng [AWS Well-Architected Tool](https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html) , kết hợp cả các câu hỏi về Framework và HPC Lens.
    

Để tìm hiểu thêm về các tính năng của AWS HPC, hãy truy cập trang [Giải pháp AWS HPC](https://aws.amazon.com/hpc/) .

## Phần kết luận

Ống kính HPC Kiến trúc Tốt AWS (AWS Well-Architected HPC Lens) được cập nhật cung cấp cho bạn một khuôn khổ toàn diện để thiết kế, triển khai và tối ưu hóa khối lượng công việc HPC trên AWS. Bằng cách kết hợp những tiến bộ mới nhất trong công nghệ HPC và các phương pháp hay nhất, ống kính này giúp bạn xây dựng môi trường HPC hiệu quả, an toàn và tiết kiệm chi phí. Cho dù bạn mới làm quen với HPC trên AWS hay đang tìm cách cải thiện kiến ​​trúc hiện có, Ống kính HPC đều cung cấp những thông tin chi tiết giá trị để thúc đẩy dự án của bạn. Chúng tôi khuyến khích bạn tải xuống sách trắng, khám phá các tài nguyên được cung cấp và bắt đầu áp dụng những phương pháp hay nhất này vào khối lượng công việc HPC của bạn ngay hôm nay. Như thường lệ, chúng tôi hoan nghênh phản hồi của bạn và mong muốn được chứng kiến ​​các giải pháp HPC sáng tạo mà bạn xây dựng trên AWS.
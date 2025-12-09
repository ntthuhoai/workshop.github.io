---
title: Blog 4
date: 2025-11-18
weight: 4
chapter: false
pre: " <b> 3.4. </b> "
---


# Đơn giản hóa báo cáo phát triển bền vững bằng AWS và AI tạo sinh trong ngân hàng

bởi Sachin Kulkarni và Otis Antoniou vào26 THÁNG 6 NĂM 2025 trong [Amazon Bedrock](https://aws.amazon.com/blogs/architecture/category/artificial-intelligence/amazon-machine-learning/amazon-bedrock/) , [Dịch vụ tài chính](https://aws.amazon.com/blogs/architecture/category/industries/financial-services/) , [Trí tuệ nhân tạo](https://aws.amazon.com/blogs/architecture/category/artificial-intelligence/generative-ai/) , [Tính bền vững](https://aws.amazon.com/blogs/architecture/category/sustainability/)  [Liên kết cố định](https://aws.amazon.com/blogs/architecture/simplifying-sustainability-reporting-using-aws-and-generative-ai-in-banking/)  [Chia sẻ](https://aws.amazon.com/blogs/architecture/simplifying-sustainability-reporting-using-aws-and-generative-ai-in-banking/#)

Các ngân hàng châu Âu đang đối mặt với một thách thức mới khi Ủy ban châu Âu chuyển đổi từ [Chỉ thị Báo cáo Phi tài chính](https://www.europarl.europa.eu/RegData/etudes/BRIE/2021/654213/EPRS_BRI(2021)654213_EN.pdf) (NFRD) sang các quy định [của Chỉ thị Báo cáo Bền vững Doanh nghiệp](https://finance.ec.europa.eu/capital-markets-union-and-financial-markets/company-reporting-and-auditing/company-reporting/corporate-sustainability-reporting_en) (CSRD). Sự chuyển đổi này thể hiện sự mở rộng phạm vi báo cáo bền vững, ảnh hưởng đến khoảng 50.000 công ty, tăng đáng kể so với con số 11.700 công ty trước đó.

Điều này có nghĩa là bản thân các ngân hàng cần phải nộp báo cáo phát triển bền vững vì họ sẽ là một trong 50.000 công ty đó, nhưng đối với báo cáo của riêng mình, họ cũng cần đánh giá báo cáo phát triển bền vững của khách hàng vì họ cho vay hoặc tài trợ cho các công ty đó.

Trong bài viết này, bạn sẽ tìm hiểu cách sử dụng dịch vụ AI tạo sinh trên [Amazon Web Services (AWS)](https://aws.amazon.com/) để tự động hóa các yêu cầu báo cáo phát triển bền vững, giảm thiểu thao tác thủ công và cải thiện độ chính xác. Bạn thực hiện điều này bằng cách triển khai giải pháp tự động để trích xuất, xử lý và xác thực dữ liệu từ các báo cáo của doanh nghiệp.

## Thử thách

Các tổ chức tài chính và nhóm phát triển bền vững quản lý báo cáo phát triển bền vững phải đối mặt với ba thách thức quan trọng:

-   **Quy mô và độ phức tạp** : Các ngân hàng và tổ chức tài chính phải xử lý hàng nghìn báo cáo thường niên và tài liệu phát triển bền vững, mỗi báo cáo thường dài hàng trăm trang. Quy trình này đòi hỏi việc trích xuất dữ liệu chuyên sâu, tính toán căn chỉnh Phân loại EU phức tạp và các bước xác thực tốn nhiều tài nguyên. Việc xử lý thủ công tiềm ẩn rủi ro sai sót đáng kể và tiêu tốn nguồn lực quý giá của đội ngũ.
    
-   **Tuân thủ quy định** : Các ngân hàng hiện phải thực hiện các yêu cầu chi tiết về CSRD, theo dõi các chỉ số cụ thể về doanh thu, chi phí vốn (CapEx) và chi phí hoạt động (OpEx), đồng thời tính toán Tỷ lệ Tài sản Xanh (GAR) cũng như các rủi ro môi trường đi kèm với các khoản vay, nợ hoặc đầu tư vốn chủ sở hữu. Những yêu cầu mới này đòi hỏi khả năng thu thập và xử lý dữ liệu mạnh mẽ.
    
-   **Quản lý dữ liệu*8 : Việc xử lý dữ liệu phát thải khí nhà kính (GHG) thuộc các danh mục Phạm vi 1, 2 và 3 đòi hỏi phải phân tích các hoạt động cho vay và đầu tư phức tạp. Với thời hạn báo cáo nghiêm ngặt, các tổ chức cần có các công cụ hiệu quả để xử lý khối lượng dữ liệu phát triển bền vững ngày càng mở rộng này.
    

## Quan điểm của nhóm phát triển bền vững

Ngân hàng tài trợ cho nhiều đối tác và hoạt động kinh tế khác nhau. Trong khi lượng khí thải carbon của các ngân hàng chủ yếu liên quan đến lượng khí nhà kính (GHG) phát thải từ các đối tác (Phạm vi 3), thì lượng khí thải GHG trực tiếp (Phạm vi 1) của các tổ chức tài chính hoặc lượng khí thải GHG liên quan đến mức tiêu thụ năng lượng của họ (Phạm vi 2) thường bị giới hạn. Đối với các ngân hàng, chỉ số hiệu suất chính (KPI) quan trọng nhất là GAR, đo lường tỷ lệ các khoản phải thu trên bảng cân đối kế toán của ngân hàng so với tổng các khoản phải thu đủ điều kiện, như thể hiện trong hình sau. 

![](https://d2908q01vomqb2.cloudfront.net/fc074d501302eb2b93e2554793fcaf50b3bf7291/2025/06/20/arch1201-im2.png)
Để tính GAR, các ngân hàng phải thu thập và sử dụng dữ liệu bền vững từ các báo cáo thường niên hoặc báo cáo bền vững của tối đa 50.000 công ty (nhiều công ty trong số đó phải báo cáo theo NFRD và CSRD) và hiểu rõ mức độ hoạt động của họ liên quan đến Phân loại EU như thế nào.

## Quy trình thủ công

Trong ví dụ sau, chúng tôi sử dụng Báo cáo thường niên năm 2023 của Amazon. Một số dữ liệu mà các nhóm sẽ phải trích xuất thủ công bao gồm: Doanh thu, Phạm vi 1, Phạm vi 2 và Phạm vi 3.
  

![Amazon Annual Report](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2025/06/18/Annual-ML-1201.jpg)
Như bạn có thể thấy từ số trang ở đầu hình trước, những người tìm kiếm dữ liệu này theo cách thủ công sẽ phải duyệt qua 92 trang để tìm các thông số họ cần. Tiếp theo, chúng ta có thể xác định rằng một số dữ liệu cần thiết (Phạm vi 1, Phạm vi 2, Phạm vi 3) không có sẵn trong báo cáo thường niên, vì vậy chúng ta cần phân tích báo cáo phát triển bền vững. Như thể hiện trong hình sau, để truy xuất thủ công dữ liệu liên quan từ báo cáo này, chúng ta sẽ phải duyệt qua 98 trang thông tin.![amazon sustainability report](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2025/06/18/sus-ml-1201.jpg)
Để chuẩn bị GAR, chúng ta sẽ phải lặp lại quá trình này trên hàng trăm hoặc thậm chí hàng nghìn công ty.

## Một giải pháp sử dụng AWS và AI tạo ra

Để giải quyết những thách thức này, chúng tôi đề xuất một phương pháp tự động sử dụng dịch vụ AWS. Phương pháp này có thể giúp các ngân hàng tinh giản quy trình báo cáo phát triển bền vững. ![high level flow](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2025/06/18/flow-ml-1201.png)
Giải pháp này hoạt động như sau—như minh họa trong hình trước:

1.  Tải báo cáo của đối tác lên [Amazon Simple Storage Service (Amazon S3)](https://aws.amazon.com/s3) .
    
2.  [Amazon Bedrock](https://aws.amazon.com/bedrock) tự động:
    

	a. Xác định điều kiện hưởng NFRD.
	b. Trích xuất dữ liệu bền vững có liên quan.
    c. Tổ chức thông tin cho tính toán GAR.
    

3. Xem xét và xác thực dữ liệu đã trích xuất.
    
4. Tạo các báo cáo theo quy định bắt buộc.
    

### Ngành kiến ​​​​trúc

Chúng tôi chia kiến ​​trúc thành hai khu vực:

1.  Luồng thu thập dữ liệu
    
2.  Luồng tạo báo cáo
    

#### Luồng thu thập dữ liệu

Chúng tôi sử dụng [Cơ sở tri thức Amazon Bedrock](https://aws.amazon.com/bedrock/knowledge-bases) để xây dựng quy trình thu thập dữ liệu tự động. Xem [Điều kiện tiên quyết cho dữ liệu cơ sở tri thức Amazon Bedrock của bạn](https://docs.aws.amazon.com/bedrock/latest/userguide/knowledge-base-ds.html) để hiểu các định dạng tài liệu được hỗ trợ và giới hạn cho dữ liệu cơ sở tri thức.
![Data Ingestion flow](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2025/06/18/arch-ml-1201.jpg)
Quy trình làm việc được thể hiện trong hình trước là:

1.  Báo cáo thường niên hoặc báo cáo phát triển bền vững được tải lên thùng S3.
    
2.  Trên thùng S3, chúng tôi bật thông báo sự kiện cho các sự kiện như thêm, thay đổi hoặc xóa báo cáo.
    
3.  Các sự kiện này [được gửi đến Amazon Event Bridge](https://aws.amazon.com/blogs/aws/new-use-amazon-s3-event-notifications-with-amazon-eventbridge/) , kích hoạt chức năng [AWS Lambda](https://aws.amazon.com/lambda) .
    
4.  Hàm Lambda [đồng bộ hóa nguồn dữ liệu với cơ sở kiến ​​thức Amazon Bedrock.](https://docs.aws.amazon.com/bedrock/latest/userguide/kb-data-source-sync-ingest.html)
    
5.  Cơ sở tri thức Amazon Bedrock xử lý tài liệu và chuyển đổi chúng thành các vector nhúng. Để biết thêm thông tin, hãy xem [Amazon Bedrock Knowledge Bases hỗ trợ phân tích cú pháp, phân đoạn và định dạng lại truy vấn nâng cao, giúp kiểm soát độ chính xác tốt hơn trong các ứng dụng dựa trên RAG.](https://aws.amazon.com/blogs/machine-learning/amazon-bedrock-knowledge-bases-now-supports-advanced-parsing-chunking-and-query-reformulation-giving-greater-control-of-accuracy-in-rag-based-applications/)
    
6.  Cơ sở kiến ​​thức Amazon Bedrock lưu trữ các nhúng vectơ trong cơ sở dữ liệu vectơ mà bạn lựa chọn, chẳng hạn như trong bộ sưu tập Amazon OpenSearch Serverless.
    

Bây giờ dữ liệu được đọc, chia thành các khối, chuyển đổi thành dữ liệu nhúng và lưu trữ trong kho lưu trữ vector. Bạn sử dụng luồng tạo báo cáo để đặt câu hỏi về thông tin trong cơ sở kiến ​​thức.

### Luồng tạo báo cáo

Để tự động hóa việc tạo báo cáo cho các nhóm phát triển bền vững, chúng tôi đã tạo luồng tạo báo cáo như trong hình sau.
![report generation flow](https://d2908q01vomqb2.cloudfront.net/f1f836cb4ea6efb2a0b1b99f41ad8b103eff4b59/2025/06/18/generationflow-ml-1201.jpg)
Quy trình tạo báo cáo bao gồm các bước sau:

1.  Khi người dùng tải lên báo cáo thường niên, dữ liệu từ báo cáo sẽ được đưa vào cơ sở kiến ​​thức, như được hiển thị trong luồng dữ liệu.
    
2.  Hàm Lambda— Invoke Bedrock Agent—được kích hoạt để gọi tác nhân Amazon Bedrock.
    
3.  Tác nhân Amazon Bedrock xác định khả năng áp dụng NFRD hoặc CSRD dựa trên các thông số khác nhau như số lượng nhân viên và doanh thu hàng năm. Sau đó, tác nhân này sẽ chuyển loại quy định nào sẽ áp dụng cho hàm Lambda.
    
4.  Hàm Lambda Retrieve Sustainability Metrics truy xuất nhiều tham số cần thiết cho NFRD hoặc CSRD từ báo cáo thường niên.
    

  a. Chức năng này nhận khả năng áp dụng NFRD hoặc CSRD từ tác nhân Amazon Bedrock
  b. Dựa trên khả năng áp dụng NFRD hoặc CSRD, [có những chỉ số bền vững cụ thể](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX:52019XC0620(01)) cần được thu thập. Đối với NFRD, có khoảng 15 chỉ số cần được thu thập, và đối với CSRD, có khoảng 30 chỉ số.
    
   c. Hàm này sẽ gửi lặp lại {variable}đến luồng Amazon Bedrock. Ví dụ: nếu số liệu cần lấy là Scope 1 emission, thì hàm Lambda sẽ gửi variable=‘Scope 1 emission’
    
   d. Hàm này lấy giá trị số liệu từ luồng Amazon Bedrock và khi số liệu cần thiết được truy xuất, sẽ tạo tệp CSV có thông tin chi tiết.
    

5. Luồng Amazon Bedrock:
    

a. Lấy {variable}(ví dụ: ‘Scope 1 emission’) từ báo cáo thường niên. Để thực hiện việc này, chúng tôi tạo một lời nhắc như minh họa trong sơ đồ sau.
    
b. Sử dụng lời nhắc để lấy giá trị từ cơ sở kiến ​​thức.
    

-   Lời nhắc: <query> You are an intelligent agent that helps retrieve information from a knowledgebase. Please find {{variable}}. Please return only a number and  not  any additional text. I only need the value so you will return one word</query>
    

c. Trả về giá trị cho hàm Lambda ở Bước 4.
![](https://d2908q01vomqb2.cloudfront.net/fc074d501302eb2b93e2554793fcaf50b3bf7291/2025/06/20/arch1201-im1.png)
## Phân tích các thành phần chính

[Amazon S3](https://aws.amazon.com/s3/) được sử dụng để lưu trữ báo cáo thường niên và báo cáo phát triển bền vững, cung cấp khả năng lưu trữ đối tượng có độ bền cao và an toàn, giúp truy cập ngay lập tức khi cần xử lý.

[Cơ sở tri thức Amazon Bedrock](https://aws.amazon.com/bedrock/knowledge-bases/) cho phép sử dụng Retrieval-Augmented Generation ( [RAG](https://aws.amazon.com/what-is/retrieval-augmented-generation/) ) để tối ưu hóa đầu ra của một mô hình ngôn ngữ lớn bằng cách cung cấp cho nó bối cảnh báo cáo thường niên và các yêu cầu pháp lý của công ty. Công nghệ này thực hiện điều này bằng cách tạo các khối và nhúng vector từ báo cáo thường niên để cho phép truy xuất thông tin hiệu quả từ cơ sở dữ liệu vector mà bạn lựa chọn.

[Các mô hình nền tảng (FM) của Amazon Bedrock](https://docs.aws.amazon.com/bedrock/latest/userguide/models-supported.html) trích xuất thông tin từ cơ sở kiến ​​thức Amazon Bedrock và tạo báo cáo PDF chuẩn hóa cho các cơ quan quản lý, đảm bảo định dạng nhất quán và phù hợp với các yêu cầu của CSRD. Chúng tôi khuyến khích bạn [chọn mô hình nền tảng phù hợp nhất cho trường hợp sử dụng của mình](https://community.aws/content/2fKJW0z9PEIKec94DZwtYigCF7i/choose-the-best-foundational-model-for-your-ai-applications) thông qua tính linh hoạt và các biện pháp kiểm soát cấp doanh nghiệp của [Amazon Bedrock](https://aws.amazon.com/bedrock/) . Đối với giải pháp này, chúng tôi đã sử dụng Claude Sonnet 3.5 của Anthropic làm mô hình, nhưng bằng cách sử dụng Amazon Bedrock, bạn có thể lựa chọn từ hơn 50 mô hình khác nhau để xem mô hình nào phù hợp nhất với trường hợp sử dụng của mình.

[Amazon Bedrock Flows](https://aws.amazon.com/bedrock/flows/) điều phối quy trình xử lý tài liệu, phối hợp giữa các dịch vụ để tự động trích xuất các số liệu bền vững cần thiết và xác thực các yêu cầu tuân thủ. Tính năng này giúp chúng tôi quản lý quy trình làm việc từ khâu tiếp nhận tài liệu ban đầu đến khâu tạo báo cáo cuối cùng.

[Amazon Bedrock Prompt Management](https://aws.amazon.com/bedrock/prompt-management/) tạo và hỗ trợ quản lý các lời nhắc chính xác, giúp trích xuất nhiều số liệu bền vững từ báo cáo, ví dụ: dữ liệu doanh thu, Phạm vi 1, Phạm vi 2 và Phạm vi 3. Các lời nhắc có cấu trúc này hỗ trợ trích xuất dữ liệu nhất quán trên nhiều định dạng tài liệu khác nhau.

[Amazon Bedrock Agents](https://aws.amazon.com/bedrock/agents/) đánh giá từng tài liệu được tải lên để xác định tính đủ điều kiện NFRD hoặc CSRD bằng cách phân tích doanh thu công ty, số lượng nhân viên và chi tiết thành lập. Các tác nhân truy xuất các thông số này bằng cách sử dụng hàm Lambda, một phần trong các hành động mà tác nhân có thể thực hiện.

[Lambda](https://aws.amazon.com/lambda/) xử lý theo sự kiện khi tài liệu mới được tải lên. Các hàm Lambda cũng được tác nhân sử dụng để truy xuất dữ liệu từ báo cáo thường niên của công ty và kích hoạt quy trình làm việc phù hợp dựa trên loại tài liệu.

[Amazon EventBridge](https://aws.amazon.com/eventbridge/) được sử dụng để xây dựng các ứng dụng theo sự kiện ở quy mô lớn trên AWS và quản lý việc điều phối quy trình làm việc, tự động khởi tạo xử lý tài liệu khi báo cáo mới được tải lên thông qua thông báo sự kiện S3.

Kiến trúc này cho phép các ngân hàng xử lý hàng ngàn báo cáo phát triển bền vững một cách hiệu quả. Giải pháp tự động mở rộng để xử lý khối lượng tài liệu ngày càng tăng, đồng thời vẫn đặt vấn đề bảo mật lên hàng đầu.

## Những cân nhắc bổ sung

Bạn có thể sử dụng dịch vụ AWS bổ sung sau đây để giúp tăng thêm độ chính xác khi truy xuất thông tin từ các tài liệu về tính bền vững.

[Amazon Bedrock Guardrails](https://aws.amazon.com/bedrock/guardrails/) đảm bảo giải pháp đáp ứng các chính sách AI có trách nhiệm. Cụ thể, chúng tôi đã bổ sung [các kiểm tra tiếp đất theo ngữ cảnh](https://aws.amazon.com/blogs/aws/guardrails-for-amazon-bedrock-can-now-detect-hallucinations-and-safeguard-apps-built-using-custom-or-third-party-fms/) để giảm ảo giác. Điều này rất quan trọng đối với giải pháp vì chúng tôi đang cố gắng tìm một vài giá trị cụ thể trong một tài liệu lớn, và các kiểm tra này đảm bảo rằng các số liệu được truy xuất dựa trên các tài liệu đó.

[Kiểm tra suy luận tự động](https://aws.amazon.com/blogs/aws/prevent-factual-errors-from-llm-hallucinations-with-mathematically-sound-automated-reasoning-checks-preview/) giúp xác minh các số liệu do giải pháp trả về. Hãy xem xét số liệu Số lượng nhân viên . Có thể có nhiều chỗ trong báo cáo thường niên đề cập đến số lượng nhân viên; ví dụ: nhân viên tạm thời, nhân viên bán thời gian, nhân viên từ nhiều phòng ban khác nhau, nhân viên từ một công ty đã được mua lại vào năm ngoái, v.v. Để có được con số chính xác, kiểm tra suy luận tự động sẽ giúp ích.

## Những lợi ích

Giải pháp báo cáo bền vững này rút ngắn thời gian xử lý tài liệu từ 8-10 tuần xuống còn vài giờ. Các ngân hàng sẽ có được lịch sử kiểm toán rõ ràng, cho thấy chính xác cách họ trích xuất và xác thực dữ liệu bền vững. Khi các quy định được cập nhật, hệ thống sẽ tự động điều chỉnh thông qua cơ sở kiến ​​thức mà không làm gián đoạn hoạt động. Bảo mật tích hợp bảo vệ dữ liệu của công ty trong suốt quá trình. Kiểm soát truy cập và mã hóa được áp dụng để bảo mật thông tin. Kết quả đầu ra cung cấp các báo cáo được chuẩn hóa và chính xác. Tính năng tự động hóa này cho phép các nhóm phát triển bền vững tập trung vào việc cải thiện môi trường thay vì công việc giấy tờ. Thay vào đó, các nhóm có thể phân tích xu hướng và phát triển các sáng kiến ​​thay vì phải tìm kiếm điểm dữ liệu trong các báo cáo.

## Phần kết luận

Khi các yêu cầu về báo cáo bền vững ngày càng phát triển, việc có một giải pháp linh hoạt và tự động hóa sẽ trở nên vô cùng quan trọng. Mặc dù chúng tôi tập trung vào báo cáo NFRD, nhưng mô hình tương tự cũng có thể được điều chỉnh cho báo cáo tuân thủ CSRD, các yêu cầu báo cáo SFDR, các chỉ số bền vững nội bộ hoặc sự phù hợp với Phân loại EU.

Khách hàng muốn xây dựng sản phẩm của mình trong ngành Dịch vụ tài chính có thể tiếp cận các chuyên gia AWS trong ngành và lĩnh vực; [hãy liên hệ với chúng tôi](https://pages.awscloud.com/FinancialServicesContactSales.html) để được trợ giúp trong hành trình đám mây của bạn.

Bạn cũng có thể tìm hiểu thêm về các dịch vụ và giải pháp AWS dành cho dịch vụ tài chính bằng cách truy cập [AWS dành cho Dịch vụ tài chính](https://aws.amazon.com/financial-services/) và [Trí tuệ nhân tạo trên AWS](https://aws.amazon.com/ai/generative-ai/) .
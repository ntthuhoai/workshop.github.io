---
title: Blog 2
date: 2025-11-18
weight: 2
chapter: false
pre: " <b> 3.2. </b> "
---


# Introducing new compute-optimized Amazon EC2 C8i and C8i-flex instances

After launching  [Amazon Elastic Compute Cloud (Amazon EC2)](https://aws.amazon.com/pm/ec2/?trk=7c8639c6-87c6-47d6-9bd0-a5812eecb848&sc_channel=el)  memory-optimized  [R8i and R8i-flex instances](https://aws.amazon.com/blogs/aws/best-performance-and-fastest-memory-with-the-new-amazon-ec2-r8i-and-r8i-flex-instances/)  and general-purpose  [M8i and M8i-flex instances](https://aws.amazon.com/blogs/aws/new-general-purpose-amazon-ec2-m8i-and-m8i-flex-instances-are-now-available/), I am happy to announce the general availability of compute-optimized  [C8i and C8i-flex instances](https://aws.amazon.com/ec2/instance-types/c8i/)  powered by custom Intel Xeon 6 processors available only on AWS with sustained all-core 3.9 GHz turbo frequency and feature a 2:1 ratio of memory to vCPU. These instances deliver the highest performance and fastest memory bandwidth among comparable Intel processors in the cloud.

The C8i and C8i-flex instances offer up to 15 percent better price-performance, and 2.5 times more memory bandwidth compared to  [C7i and C7i-flex instances](https://aws.amazon.com/ec2/instance-types/c7i/). The C8i and C8i-flex instances are up to 60 percent faster for NGINX web applications, up to 40 percent faster for AI deep learning recommendation models, and 35 percent faster for Memcached stores compared to C7i and C7i-flex instances.

C8i and C8i-flex instances are ideal for running compute-intensive workloads, such as web servers, caching, Apache.Kafka, ElasticSearch, batch processing, distributed analytics, high performance computing (HPC), ad serving, highly scalable multiplayer gaming, and video encoding.

As like other 8th generation instances, these instances use the new sixth generation  [AWS Nitro Cards](https://aws.amazon.com/ec2/nitro/), delivering up to two times more network and  [Amazon Elastic Block Storage (Amazon EBS)](https://aws.amazon.com/ebs/)  bandwidth compared to the previous generation instances. They also support bandwidth configuration with 25 percent allocation adjustments between network and Amazon EBS bandwidth, enabling better database performance, query processing, and logging speeds.

**C8i instances**  
C8i instances provide up to 384 vCPUs and 768 GiB memory including bare metal instances that provide dedicated access to the underlying physical hardware. These instances help you to run compute-intensive workloads, such as CPU-based inference, and video streaming that need the largest instance sizes or high CPU continuously.

Here are the specs for C8i instances:


| Instance Size     | vCPUs | Memory (GiB) | Network Bandwidth (Gbps) | EBS Bandwidth (Gbps) |
|-------------------|--------|---------------|----------------------------|------------------------|
| c8i.large         | 2      | 4             | Up to 12.5                 | Up to 10               |  
| c8i.xlarge        | 4      | 8             | Up to 12.5                 | Up to 10               |  
| c8i.2xlarge       | 8      | 16            | Up to 15                   | Up to 10               |  
| c8i.4xlarge       | 16     | 32            | Up to 15                   | Up to 10               |  
| c8i.8xlarge       | 32     | 64            | 15                         | 10                      |  
| c8i.12xlarge      | 48     | 96            | 22.5                       | 15                      |  
| c8i.16xlarge      | 64     | 128           | 30                         | 20                      |  
| c8i.24xlarge      | 96     | 192           | 40                         | 30                      |  
| c8i.32xlarge      | 128    | 256           | 50                         | 40                      |  
| c8i.48xlarge      | 192    | 384           | 75                         | 60                      |  
| c8i.96xlarge      | 384    | 768           | 100                        | 80                      |  
| c8i.metal-48xl    | 192    | 384           | 75                         | 60                      |  
| c8i.metal-96xl    | 384    | 768           | 100                        | 80                      |  

---

**C8i-flex instances**  
C8i-flex instances are a lower-cost variant of the C8i instances, with 5 percent better price performance at 5 percent lower prices. These instances are designed for workloads that benefit from the latest generation performance but don’t fully utilize all compute resources. These instances can reach up to the full CPU performance 95 percent of the time.

Here are the specs for the C8i-flex instances:

| Instance Size         | vCPUs | Memory (GiB) | Network Bandwidth (Gbps) | EBS Bandwidth (Gbps) |
|------------------------|--------|---------------|----------------------------|------------------------|
| c8i-flex.large         | 2      | 4             | Up to 12.5                 | Up to 10               |  
| c8i-flex.xlarge        | 4      | 8             | Up to 12.5                 | Up to 10               |  
| c8i-flex.2xlarge       | 8      | 16            | Up to 15                   | Up to 10               |  
| c8i-flex.4xlarge       | 16     | 32            | Up to 15                   | Up to 10               |  
| c8i-flex.8xlarge       | 32     | 64            | Up to 15                   | Up to 10               |  
| c8i-flex.12xlarge      | 48     | 96            | Up to 22.5                 | Up to 15               |  
| c8i-flex.16xlarge      | 64     | 128           | Up to 30                   | Up to 20               |

---

If you’re currently using earlier generations of compute-optimized instances, you can adopt C8i-flex instances without having to make changes to your application or your workload.

**Now available**  
Amazon EC2 C8i and C8i-flex instances are available today in the US East (N. Virginia), US East (Ohio), US West (Oregon), and Europe (Spain)  [AWS Regions](https://docs.aws.amazon.com/glossary/latest/reference/glos-chap.html#region). C8i and C8i-flex instances can be purchased as  [On-Demand](https://aws.amazon.com/ec2/pricing/on-demand/?trk=cf96f8ec-de40-4ee0-8b64-3f7cf7660da2&sc_channel=el),  [Savings Plan](https://aws.amazon.com/savingsplans/?trk=cc9e0036-98c5-4fa8-8df0-5281f75284ca&sc_channel=el), and  [Spot instances](https://aws.amazon.com/ec2/spot/pricing/?trk=307341f6-3463-47d5-ba81-0957847a9b73&sc_channel=el). C8i instances are also available in  [Dedicated Instances](https://aws.amazon.com/ec2/pricing/dedicated-instances/)  and  [Dedicated Hosts](https://aws.amazon.com/ec2/dedicated-hosts/pricing/). To learn more, visit the  [Amazon EC2 Pricing page](https://aws.amazon.com/ec2/pricing).

Give C8i and C8i-flex instances a try in the  [Amazon EC2 console](https://console.aws.amazon.com/ec2/?trk=769a1a2b-8c19-4976-9c45-b6b1226c7d20&sc_channel=el). To learn more, visit the  [Amazon EC2 C8i instances page](https://aws.amazon.com/ec2/instance-types/c8i/)  and send feedback to  [AWS re:Post for EC2](https://repost.aws/tags/TAO-wqN9fYRoyrpdULLa5y7g/amazon-ec-2)  or through your usual AWS Support contacts.
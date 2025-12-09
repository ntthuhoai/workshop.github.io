---
title: Blog 6
date: 2025-11-18
weight: 6
chapter: false
pre: " <b> 3.6. </b> "
---


# Optimize HPC Workloads with the Updated AWS Well-Architected Lens

by Max Starr and Marissa Powers  on  24 JUN 2025  in  [AWS Well-Architected Framework](https://aws.amazon.com/blogs/hpc/category/aws-well-architected/aws-well-architected-framework/ "View all posts in AWS Well-Architected Framework"),  [High Performance Computing](https://aws.amazon.com/blogs/hpc/category/high-performance-computing/ "View all posts in High Performance Computing")  [Permalink](https://aws.amazon.com/blogs/hpc/optimize-hpc-workloads-with-the-updated-aws-well-architected-lens/)  [Share](https://aws.amazon.com/blogs/hpc/optimize-hpc-workloads-with-the-updated-aws-well-architected-lens/#)

_This post was contributed by Max Starr PhD and Marissa E Powers PhD_

![](https://d2908q01vomqb2.cloudfront.net/e6c3dd630428fd54834172b8fd2735fed9416da4/2025/06/23/HPCBlog-363-header-sm.jpeg)The  [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/)  helps you address critical challenges in building cloud architectures by providing proven architectural best practices. High Performance Computing (HPC) environments require specialized architectural considerations that differ from typical cloud workloads. As organizations migrate their HPC workloads to AWS or build new HPC capabilities in the cloud, they often face questions about architectural best practices:

-   How do you ensure your HPC architecture follows security and cost optimization best practices?
-   What are the recommended patterns for scaling compute resources efficiently?
-   How do you optimize storage and networking for HPC-specific requirements?
-   Which AWS services best suit different types of HPC workloads?

Until now, getting answers to these questions typically required direct consultation with AWS Solutions Architects who specialize in HPC. Today, we’re announcing an update to the  [AWS Well-Architected High Performance Computing (HPC) Lens](https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/high-performance-computing-lens.html)  whitepaper, providing you with comprehensive architectural guidance in a single, authoritative resource. This newly updated lens consolidates years of AWS HPC implementation experience into structured best practices that help you build and optimize your HPC workloads on AWS.

The HPC Lens is part of the  [AWS Well-Architected Framework](https://aws.amazon.com/architecture/well-architected/), which has been helping customers improve their cloud architectures since 2015. The Framework addresses six key pillars:  [Operational Excellence](https://docs.aws.amazon.com/wellarchitected/latest/operational-excellence-pillar/welcome.html),  [Security](https://docs.aws.amazon.com/wellarchitected/latest/security-pillar/welcome.html),  [Reliability](https://docs.aws.amazon.com/wellarchitected/latest/reliability-pillar/welcome.html),  [Performance Efficiency](https://docs.aws.amazon.com/wellarchitected/latest/performance-efficiency-pillar/welcome.html),  [Cost Optimization](https://docs.aws.amazon.com/wellarchitected/latest/cost-optimization-pillar/welcome.html), and  [Sustainability](https://docs.aws.amazon.com/wellarchitected/latest/sustainability-pillar/sustainability-pillar.html). The HPC Lens extends this guidance to address the unique challenges of HPC workloads.

## What’s new in the HPC Lens?

Since the last HPC Lens release in 2019, AWS introduced numerous advancements in HPC capabilities. The updated lens incorporates these new technologies and learnings, providing you with current best practices for HPC workloads. Key updates include:

-   [AWS ParallelCluster](https://aws.amazon.com/hpc/parallelcluster/)  advancements for building and managing HPC clusters
-   New  [HPC-optimized compute instance families](https://aws.amazon.com/ec2/instance-types/#:~:text=Generation%20Instances%20page.-,HPC%20Optimized,-High%20performance%20computing)  designed for specific workload types
-   Enhanced storage options and best practices for high-performance file systems
-   Advanced networking capabilities for improved application performance
-   Integration guidance for managed services including  [AWS Batch](https://aws.amazon.com/batch/),  [Amazon FSx](https://aws.amazon.com/fsx/)  and  [AWS Parallel Computing Service](https://aws.amazon.com/pcs/)
-   Updated security and compliance recommendations
-   New cost optimization strategies for HPC workloads

These updates provide you with comprehensive guidance to design, deploy, and optimize your HPC workloads on AWS, incorporating the latest technological advancements and learned best practices from real-world implementations.

## Who should use the updated Lens?

The HPC Lens is particularly valuable if you are:

-   Planning a new HPC deployment on AWS
-   Evaluating your existing HPC architecture against current best practices
-   Optimizing performance, security, or costs of your HPC workloads
-   Preparing for an increase in scale or complexity of your HPC environment

Whether you’re a seasoned HPC professional or new to cloud-based HPC, the lens provides valuable insights to enhance your architecture.

## Get started

To begin building a well-architected HPC environment on AWS:

-   Review the  [AWS Well-Architected Framework fundamentals](https://aws.amazon.com/architecture/well-architected/?wa-lens-whitepapers.sort-by=item.additionalFields.sortDate&wa-lens-whitepapers.sort-order=desc&wa-guidance-whitepapers.sort-by=item.additionalFields.sortDate&wa-guidance-whitepapers.sort-order=desc#:~:text=AWS%20Well%2DArchitected%20and%20the%20Six%20Pillars).
-   Read the  [AWS Well-Architected HPC Lens whitepaper](https://docs.aws.amazon.com/wellarchitected/latest/high-performance-computing-lens/high-performance-computing-lens.html).
-   Review your workload using the  [AWS Well-Architected Tool](https://docs.aws.amazon.com/wellarchitected/latest/userguide/intro.html), incorporating both Framework and HPC Lens questions.

To learn more about AWS HPC capabilities, visit the  [AWS HPC Solutions](https://aws.amazon.com/hpc/)  page.

## Conclusion

The updated AWS Well-Architected HPC Lens provides you with a comprehensive framework to design, deploy, and optimize your HPC workloads on AWS. By incorporating the latest advancements in HPC technologies and best practices, this lens helps you build efficient, secure, and cost-effective HPC environments. Whether you’re new to HPC on AWS or looking to enhance your existing architecture, the HPC Lens offers valuable insights to drive your projects forward. We encourage you to download the whitepaper, explore the resources provided, and start applying these best practices to your HPC workloads today. As always, we welcome your feedback and look forward to seeing the innovative HPC solutions you build on AWS.
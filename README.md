# Udacity-Cloud DevOps Engineer - Capstone Project [![Build Status](http://ec2-18-236-91-249.us-west-2.compute.amazonaws.com:8080/buildStatus/icon?job=Udacity-Capstone-Deployment-Pipeline)](http://ec2-18-236-91-249.us-west-2.compute.amazonaws.com:8080/job/Udacity-Capstone-Deployment-Pipeline/)

## Summary:
Simple web app is containerized and deployed using blue green deployment strategy using CI/CD Jenkins pipeline

Two pipelines are used:

* Cluster Pipeline
<img src="https://mk-udacity-jenkins.s3-us-west-2.amazonaws.com/clus.png"/>

* Deployment Pipeline
<img src="https://mk-udacity-jenkins.s3-us-west-2.amazonaws.com/dep.png"/>

Technologies used:
* Docker
* Jenkins
* Kubernetes
* AWS CloudFormation [used by eksctl]
* AWS EKS

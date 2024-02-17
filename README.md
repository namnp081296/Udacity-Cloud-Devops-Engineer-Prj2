# Udacity-Cloud-Devops-Engineer-Prj2
Deploy A High Availability Web App Using CloudFormation
In this project we will use CloudFormation to deploy a Web App called Udagram

## Project Scenario
Your company is creating an Instagram clone called Udagram, and the requirement is to deploy this new application to the AWS infrastructure using Infrastructure as Code.
You have been tasked with provisioning the required infrastructure and deploying a dummy application, along with the necessary supporting software.
Since the underlying network infrastructure will be maintained by a separate team, you must create independent stacks for the network infrastructure and the application itself.
Infrastructure spin up and tear down needs to be automated so that each team can create and discard testing environments on demand.

## Requirements for the Udagram Infrastructute
- The EC2 Instance Launch template will be covered with t2.micro instances, and the Operating System to be used is Ubuntu 22
- EC2 should be allowed Read and Write permissions to the S3 Bucket
- S3 should have Public Read Access
- Your servers should be allowed inbound traffic access through Load Balancer with port 80, and the servers will need unrestricted internet access to be able to download and update their software

## Solution
![Project_2_Udragram_Diagrams](https://github.com/namnp081296/Udacity-Cloud-Devops-Engineer-Prj2/assets/52060668/e3d6badd-68dc-437e-ab73-f2421bb22d84)

## Script
To create the Stack run this commandline and replace the <> with your parameter:
`./run_iaac.sh create <your current region> <your stack name> /path/to/yourstack.yml /path/to/parameter.json`

# Udagram Website Link:
http://udagra-webap-cfjkfbkh2q1w-466389624.us-east-1.elb.amazonaws.com/

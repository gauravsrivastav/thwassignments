# Thwassignments

<!-- This file was automatically generated by the `geine`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

<p align="center"> <img src="https://user-images.githubusercontent.com/50652676/62349836-882fef80-b51e-11e9-99e3-7b974309c7e3.png" width="100" height="100"></p>


<h1 align="center">
    Terraform AWS Infra: MEDIAWIKI
</h1>

<p align="center" style="font-size: 1.2rem;"> 
    This terraform module creates set of Security Group, add rule, ec2-instance  and rds instance resources in various combinations. <br>
    Install Apache server, PHP with RHELv8 OS
     </p>

<p align="center">

<a href="https://www.terraform.io">
  <img src="https://img.shields.io/badge/terraform-v0.14-green" alt="Terraform">
</a>
<a href="LICENSE.md">
  <img src="https://img.shields.io/badge/License-MIT-blue.svg" alt="Licence">
</a>

<hr>

This module is basically combination of [Terraform open source](https://www.terraform.io/) and includes automatation tests and examples. It also helps to create and improve your infrastructure with minimalistic code instead of maintaining the whole infrastructure code yourself.

## Prerequisites

This module has a few dependencies: 

- [Terraform v0.11.8](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [aws v2.70.0]
- [RHELv8]
- [Apache/2.4.37 (Red Hat Enterprise Linux)]

**IMPORTANT:** Here we used the default vpc and subnet.

## Examples
**Screenshots:** Steps 

- Configure AWS Credentials [Setup AWS Account]
- Install Terraform
- Created a variable file and define each variable to call from .tf file under project folder [variable.tf]
- Writeen main.tf [define the provider, region, version etc]
- Writeen "create-sg.tf" [To create two security_group one for web-server to allow 80 port and another one for Database to access from webserver on 3306 port ]
<img width="1437" alt="sg" src="https://user-images.githubusercontent.com/12773015/115999653-283e7e00-a60a-11eb-88f9-8b74d74593c0.png">
- Deploy a single web server, written "create-intance.tf" and bashscript to install and configure the packages [To create web server ( AWS EC2 instance ) ]
<img width="1434" alt="ec2-instance" src="https://user-images.githubusercontent.com/12773015/116000047-45744c00-a60c-11eb-9426-e65ed8207173.png">

- Wriiten "create-db.tf" [To create Mysql database (AWS RDS )]
<img width="1440" alt="Screen Shot 2021-04-25 at 9 30 47 PM" src="https://user-images.githubusercontent.com/12773015/116000374-8a4cb280-a60d-11eb-85f2-ec59ddad5942.png">
- Setuped Mediawiki Application and run successfully
<img width="1440" alt="launched" src="https://user-images.githubusercontent.com/12773015/116000402-aa7c7180-a60d-11eb-9b80-d04226a84610.png">
- <img width="1440" alt="installation" src="https://user-images.githubusercontent.com/12773015/116000413-b49e7000-a60d-11eb-9414-eddfa34a63fd.png">
- Copy LaunchSetting.php in mediawiki folder.
- Please check http://100.27.38.72/mediawiki/
- 

![final](https://user-images.githubusercontent.com/12773015/116000973-f7f9de00-a60f-11eb-8864-24464994076a.png)


## About us

**Author:** Gaurav Srivastava



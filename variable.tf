# variables.tf
 
# Variables for general information
######################################
 
variable "aws_region" {
  description = "AWS region"
 
  default     = "us-east-1"
}
 
variable "owner" {
  description = "thwAssign"
 
  default     = "thwAssign"
}
 
variable "aws_region_az" {
  description = "AWS region availability zone"
  default     = "us-east-1a"
}
 
 
# Variables for Security Group
######################################
 
variable "sg_ingress_proto" {
  description = "Protocol used for the ingress rule"
 
  default     = "tcp"
}
 
variable "sg_ingress_ssh" {
  description = "Thi is use use to Allow ssh and standard http/https ports inbound and everything outbound"
  
  default     = "22"
}
variable "sg_ingress_http" {
  description = "Thi is use use to Allow ssh and standard http/https ports inbound and everything outbound"
  
  default     = "80"
}
variable "sg_ingress_https" {
  description = "Thi is use use to Allow ssh and standard http/https ports inbound and everything outbound"
  
  default     = "443"
}

variable "sg_ingress_cidr_block" {
  description = "access from anywhere"

  default = "0.0.0.0/0"
}

variable "sg_ingress_mysql"  {
  description = "This is to open for rds connection"
 
  default = "3306"
}
 
variable "sg_egress_proto" {
  description = "Protocol used for the egress rule"
  
  default     = "-1"
}
 
variable "sg_egress_all" {
  description = "Port used for the egress rule"

  default     = "0"
}
 
variable "sg_egress_cidr_block" {
  description = "CIDR block for the egress rule"
 
  default     = "0.0.0.0/0"
}
 
# Variables for Instance
######################################
 
variable "instance_ami" {
  description = "ID of the AMI used"
  default     = "ami-096fda3c22c1c990a"
}
 
variable "instance_type" {
  description = "Type of the instance"
  default     = "t2.micro"
}
 
variable "key_name" {
  description = "SSH Key pair used to connect"
  default     = "awsdevopsss"
}
 
variable "root_device_type" {
  description = "Type of the root block device"
  default     = "gp2"
}
 
variable "root_device_size" {
  description = "Size of the root block device"
  default     = "30"
}

variable "sg_instance" {
  description = "password acces to database"
  default = "sg-00a91c23c4e47fbf6"
}

# variable for rds

variable "database_name" {
  description = "db name"
  default = "wikidatabase"
}
variable "database_user" {
  description = "user name"
  default = "wiki"
}
# secrets artifact
variable "database_password" {
  description = "password acces to database"
  default = "thwassignments"
}

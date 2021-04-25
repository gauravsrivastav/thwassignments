#create_sg

data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}

resource "aws_security_group" "mediawikki-sg" {
  name        = "mediawikki-sg"
  description = "use to Allow ssh and standard http/https ports inbound and everything outbound"
  
  ingress = [{
    description      = "this is to web server"
    protocol         = "${var.sg_ingress_proto}"
    from_port        = "${var.sg_ingress_ssh}"
    to_port          = "${var.sg_ingress_ssh}"
    cidr_blocks		 = ["${var.sg_ingress_cidr_block}"]
 
  }]
  ingress = [{
    description      = "this is to web server"
    protocol         = "${var.sg_ingress_proto}"
    from_port        = "${var.sg_ingress_http}"
    to_port          = "${var.sg_ingress_http}"
    cidr_blocks		 = ["${var.sg_ingress_cidr_block}"]
 
  }]
  ingress = [{
    description      = "this is to web server"
    protocol         = "${var.sg_ingress_proto}"
    from_port        = "${var.sg_ingress_https}"
    to_port          = "${var.sg_ingress_https}"
    cidr_blocks		 = ["${var.sg_ingress_cidr_block}"]
 
  }]
  # Allow all outbound traffic
  egress = [{
    description      = "All traffic"
    protocol         = "${var.sg_egress_proto}"
    from_port        = "${var.sg_egress_all}"
    to_port          = "${var.sg_egress_all}"
    cidr_blocks      = ["${var.sg_egress_cidr_block}"]
    
 
  }]
 
  tags = {
    "Owner" = "$(var.owner)"
    "Name"  = "${var.owner}-websg"
  }
}

#db

resource "aws_security_group" "rds-sg" {
  name        = "rds-sg"
  description = "use to Allow webserver to access database"

 ingress = [{
    description      = "This is to db"
    protocol         = "${var.sg_ingress_proto}"
    from_port        = "${var.sg_ingress_mysql}"
    to_port          = "${var.sg_ingress_mysql}"
    cidr_blocks		 = ["${chomp(data.http.myip.body)}/32"]

  }]

# Allow all outbound traffic
  egress = [{
    description      = "All traffic"
    protocol         = "${var.sg_egress_proto}"
    from_port        = "${var.sg_egress_all}"
    to_port          = "${var.sg_egress_all}"
    cidr_blocks      = ["${var.sg_egress_cidr_block}"]
    
 
  }]
   tags = {
    "Owner" = "$(var.owner)"
    "Name"  = "${var.owner}-rdssg"
  }
}

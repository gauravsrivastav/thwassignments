#create-intance

resource "aws_instance" "instance"{
	ami = "ami-096fda3c22c1c990a"
	availability_zone = "${var.aws_region_az}"
	instance_type = "${var.instance_type}"
	associate_public_ip_address = true
    monitoring = true
	key_name = "${var.key_name}"
	vpc_security_group_ids   = ["${aws_security_group.mediawikki-sg.name}"]
	root_block_device {
	delete_on_termination = true
	volume_type 		  = "${var.root_device_type}"
	volume_size 		  = "${var.root_device_size}"
	}
	volume_tags {
    Name                      = "${var.owner}-root"
  }

  # Copy in the bash script we want to execute.

  provisioner "file" {
    source      = "wikki-install.sh"
    destination = "/home/ec2-user/wikki-install.sh"
  }

	provisioner "remote-exec" {
    inline = [
       "chmod +x /home/ec2-user/wikki-install.sh",
       "./wikki-install.sh"
    ]
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    host     = "${self.public_ip}"
    #copy <private.pem> to your local instance to the home directory
    #chmod 600 id_rsa.pem
    private_key = "${file("~/Downloads/awsdevopsss.pem")}"
    }

	tags = {
    "Owner"               = "$(var.owner)"
    "Name"                = "${var.owner}-instance"
  }

}
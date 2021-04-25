#create_db

resource "aws_db_instance" "thwas-db" {
  identifier                = "thwas-db"
  allocated_storage         = 20
  engine                    = "mysql"
  engine_version            = "8.0.20"
  instance_class            = "db.t2.micro"
  name                      = "${var.database_name}"
  username                  = "${var.database_user}"
  password                  = "${var.database_password}"
  vpc_security_group_ids    = ["${aws_security_group.rds-sg.id}"]
  skip_final_snapshot       = true
  final_snapshot_identifier = "Ignore"
}
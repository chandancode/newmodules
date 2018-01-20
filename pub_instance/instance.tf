resource "aws_instance" "example1" {
  ami = "ami-889cecf4"
#  ami           = "${lookup(var.AMIS,var.AWS_region)}"
  instance_type = "t2.micro"
#  key_name      = "${aws_key_pair.chandankey.key_name}"
#  vpc_security_group_ids = ["${aws_security_group.FrontEnd.id}"]
#  subnet_id = "${aws_subnet.public_subnet_ap_southeast_1a.id}"
   key_name = "chandankey"
   vpc_security_group_ids = ["${var.awssecgp}"]
   subnet_id = "${var.awssub}"
  tags {


    Name = "My public  instance"

  }
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    user        = "${var.INSTANCE_USERNAME}"
    private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
  user_data = "#!/bin/bash\ntouch testing"
}

output "ip" {

	value = "${aws_instance.example1.public_ip}"
}

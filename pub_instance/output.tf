output "my_pub_ip" {

	value = "${aws_instance.example1.public_ip}"

}

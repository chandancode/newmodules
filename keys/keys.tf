resource "aws_key_pair" "chandankey" {
  key_name   = "chandankey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
#  directory = "/KEYS"
}


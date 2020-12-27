
resource "aws_launch_configuration" "income-alc" {
  name          = "income-alc"
  image_id      = "ami-0b898040803850657"
  instance_type = "t2.micro"
}
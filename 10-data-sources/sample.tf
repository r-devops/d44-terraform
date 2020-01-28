data "aws_ami" "example" {
  most_recent      = true
  owners           = ["973714476881"]

}

output "ami" {
  value = data.aws_ami.example.id
}

provider "aws" {
  region = "us-east-2"
}
data "aws_route53_zone" "main" {
  name         = "expense.internal"
  private_zone = true
}

data "aws_ami" "main" {
  most_recent = true
  name_regex  = "DevOps-LabImage-RHEL9"
  owners      = ["355449129696"]
}

# Going forward, we want to supply an AMI that has ansible installed
# How to create ami , 1) Create VM with lab image 2) Install Ansible  3) Create ami and name it as b58-lab-golden-image
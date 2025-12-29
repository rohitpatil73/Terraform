environment = "prod"

vpc_cidr = "10.1.0.0/16"

availability_zones = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]

instance_type = "t3.micro"
ami_id        = "ami-0f58b397bc5c1f2e8"

ec2_count = 3

bucket_name = "terraform-demo-bucket"

common_tags = {
  Owner       = "OpsTeam"
  Project     = "TerraformFundamentals"
}

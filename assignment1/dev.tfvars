environment = "dev"

vpc_cidr = "10.0.0.0/16"

availability_zones = ["ap-south-1a", "ap-south-1b"]
public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]

instance_type = "t2.micro"
ami_id        = "ami-0f58b397bc5c1f2e8"

bucket_name = "terraform-demo-bucket"

common_tags = {
  Owner       = "DevTeam"
  Project     = "TerraformFundamentals"
}

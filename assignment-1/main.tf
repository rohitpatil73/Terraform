# VPC
resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = merge(
    var.common_tags,
    { Name = "${var.environment}-vpc" }
  )
}

# Public Subnets
resource "aws_subnet" "public" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_subnet_cidrs[count.index]
  map_public_ip_on_launch = true
  tags = merge(
    var.common_tags,
    { Name = "${var.environment}-public-subnet-${count.index + 1}" }
  )
}

# EC2 Instance (conditional)
resource "aws_instance" "web" {
  count         = var.create_ec2 ? 1 : 0
  ami           = "ami-0ecb62995f68bb549" # Amazon Linux 2
  instance_type = var.instance_type
  subnet_id     = aws_subnet.public[0].id
  tags = merge(
    var.common_tags,
    { Name = "${var.environment}-ec2" }
  )
}

# S3 Bucket
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.environment}-terraform-demo-bucket-1"
  acl    = "private"
  tags   = merge(var.common_tags, { Name = "${var.environment}-s3" })
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "ec2_id" {
  value = aws_instance.web[*].id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.bucket.id
}

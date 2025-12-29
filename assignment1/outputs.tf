output "vpc_id" {
  value = aws_vpc.this.id
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}

output "ec2_public_ips" {
  value = aws_instance.app[*].public_ip
}

output "s3_bucket_name" {
  value = aws_s3_bucket.app_bucket.bucket
}

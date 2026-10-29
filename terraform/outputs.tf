output "instance_id" {
  value = aws_instance.demo_instance.id
}

output "instance_public_ip" {
  value = aws_instance.demo_instance.public_ip
}

output "key_pair_name" {
  value = aws_key_pair.demo_keypair.key_name
}

output "ssm_parameter_name" {
  value = aws_ssm_parameter.private_key.name
}

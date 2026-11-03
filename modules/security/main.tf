
resource "aws_security_group" "this" {
  name_prefix = "${var.name}-"
  description = var.description
  vpc_id      = var.vpc_id

  # Deny all inbound traffic by default.
  # No ingress rules are defined.

  # Override AWS's default allow-all egress behavior.
  # No outbound traffic is permitted initially.
  egress = []

  tags = merge(var.tags, {
    Name = var.name
  })

  lifecycle {
    create_before_destroy = true
  }
}

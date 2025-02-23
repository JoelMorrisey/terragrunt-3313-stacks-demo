variable "name" {
  description = "Name to greet"
  type        = string
  default     = "Terraform User"
}

resource "null_resource" "always_run" {
  provisioner "local-exec" {
    command = "echo Hello, ${var.name}!"
  }

  triggers = {
    always_run = "${timestamp()}" # Ensures the provisioner always runs
  }
}

output "greeting" {
  value = "Hello, ${var.name}!"
}
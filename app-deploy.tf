resource "null_resource" "app-deploy" {
  triggers = {
    ABC = timestamp()
  }
  count = length(local.ALL_INSTANCE_IPS)
  provisioner "remote-exec" {

    connection {
      type     = "ssh"
      user     = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["SSH_USERNAME"]
      password = jsondecode(data.aws_secretsmanager_secret_version.secret.secret_string)["SSH_PASSWORD"]
      host     = element(local.ALL_INSTANCE_IPS, count.index)
    }

    inline = [
      "ansible-pull -U https://github.com/raghudevopsb64/roboshop-ansible.git roboshop.yml -e HOST=localhost -e ROLE_NAME=${var.COMPONENT} -e ENV=${var.ENV} -e DBTYPE=DOCUMENTDB -e DOCDB_ENDPOINT=${var.DOCDB_ENDPOINT} -e APP_VERSION=${var.APP_VERSION}"
    ]
  }
}



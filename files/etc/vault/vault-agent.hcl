pid_file = "vault_pid"

exit_after_auth = true

vault {
  address = "https://vault.uefa.ch"

  retry = {
    num_retries = 5
  }
}

auto_auth {
  method "approle" {
    mount_path = "auth/approle-jenkins"

    config {
      type                                = "approle"
      role                                = "jenkins-infra"
      role_id_file_path                   = "/tmp/role_id"
      secret_id_file_path                 = "/tmp/secret_id"
      remove_secret_id_file_after_reading = true
    }
  }

  sink "file" {
    config = {
      path = "/tmp/.token"
    }
  }
}

template "ssh_key" {
  create_dest_dirs = true
  source           = "/etc/vault/templates/ssh_key.ctmpl"
  destination      = "/home/jenkins/.ssh/ssh_key"
}

template "aws_profile" {
  create_dest_dirs = true
  source           = "/etc/vault/templates/profile.ctmpl"
  destination      = "/home/jenkins/.aws/credentials"
}

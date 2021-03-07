terraform {

}

module "jenkins_test_instance" {
  source = "github.com/UEFADigital/tfmod-ansible-test-harness.git?ref=v1.2.1"
  docker = true
  ec2    = false
  bionic = true
  focal  = true
}

# terraform {
#   backend "s3" {
#     bucket         = "hemmu" # bucket name
#     key            = "terraform/terraform.tfstate"
#     region         = "ap-northeast-2"
#     dynamodb_table = "terraform-up-and-running-locks" # dynamoDB table name
#     encrypt        = true
#   }
# } # depends on S3
terraform {
  backend "local" {
    path = ".././terraform.tfstate"
  } # backend 변경 전 destroy 권장
} 

data "terraform_remote_state" "network" {
    backend = "local"
    config = {
        path = "./terraform.tfstate"
    }   
}

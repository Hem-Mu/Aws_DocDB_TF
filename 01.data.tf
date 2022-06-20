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
    path = "C:/Users/김햄무/Desktop/terraform/Aws/@init_network/@docDB/terraform.tfstate"
  } # backend 변경 전 destroy 권장
} 

data "terraform_remote_state" "network" {
    backend = "local"
    config = {
        path = "C:/Users/김햄무/Desktop/terraform/Aws/@init_network/terraform.tfstate"
    }   
}
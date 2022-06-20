resource "aws_docdb_subnet_group" "docuSubnet" {
  name       = "docdb_subnet"
  subnet_ids = [
    data.terraform_remote_state.network.outputs.pub1_id, 
    data.terraform_remote_state.network.outputs.pub2_id,
    data.terraform_remote_state.network.outputs.pri1_id, 
    data.terraform_remote_state.network.outputs.pri2_id
  ]

  tags = {
    Name = "docdb subnet group"
  }
}
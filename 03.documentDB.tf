resource "aws_docdb_cluster" "documentDB" {
  cluster_identifier      = "docdb-cluster" # 클러스터 이름
  engine                  = "docdb"
  master_username         = "hamster" # db 관리자명
  master_password         = "hamster1" # 비밀번호 사용불가 문자 - [슬래시(/), 큰따옴표(""), at기호(@)]
  backup_retention_period = 1 # 백업 보관날짜
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  apply_immediately = true # 변경사항 즉시 적용
  engine_version = "4.0.0"
  db_subnet_group_name = aws_docdb_subnet_group.docuSubnet.id
  # vpc_security_group_ids =
  # final_snapshot_identifier = "snap" # 클러스터 삭제시 스냅샷 이름
}
resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 1
  identifier         = "docdb-cluster-${count.index}" # 인스턴스 이름
  cluster_identifier = aws_docdb_cluster.documentDB.id
  instance_class     = "db.t4g.medium"
} 
output "cluster_add" {
     value = "${aws_docdb_cluster.documentDB.endpoint}"
   }
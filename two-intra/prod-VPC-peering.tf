
#Initiate Peering connection request from us-east-1
resource "aws_vpc_peering_connection" "useast1-uswest-2" {
provider = aws.region-prod-1
peer_vpc_id = aws_vpc.vpc_prod-2.id
vpc_id = aws_vpc.vpc_prod-1.id
#auto_accept = true
peer_region = var.region-prod-2
}
#Accept VPC peering request in us-west-2 from us-east-1
resource "aws_vpc_peering_connection_accepter" "accept_peering" {
provider = aws.region-prod-2
vpc_peering_connection_id = aws_vpc_peering_connection.useast1-uswest-2.id
auto_accept = true
}



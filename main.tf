provider "aws" {
    region      = "us-west-2"
    access_key  = "AKIAYS2CSRF6IU2KC7CX"
    secret_key  = "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"


# VPC Section
resource "aws_vpc" "mediawiki_VPC" {
    cidr_block              = "192.168.0.0/16"
    tags = {
        Name = "MediaWiki_VPC_byTF"
    }
}

# server1 Subnet
resource "aws_subnet" "Sever1" {
    vpc_id                  = aws_vpc.mediawiki_VPC.id
    cidr_block              = "192.168.0.0/24"
    availability_zone       = "us-west-2a"
    
    tags = {
        Name = "server1"
    }

}

# server2 Subnet
resource "aws_subnet" "Sever2" {
    vpc_id                  = aws_vpc.mediawiki_VPC.id
    cidr_block              = "192.168.1.0/24"
    availability_zone       = "us-west-2b"
    
    tags = {
        Name = "server2"
    }

}

# DB Subnet
resource "aws_subnet" "DB" {
    vpc_id                  = aws_vpc.mediawiki_VPC.id
    cidr_block              = "192.168.2.0/24"
    availability_zone       = "us-west-2c"
    
    tags = {
        Name = "DB"
    }

}

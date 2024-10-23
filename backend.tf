terraform {

  backend "s3" {

    bucket         = "squad1-hackathon-bucket-table"

    key            = "admin"

    region         = "us-east-1"

    dynamodb_table = "squad1-hackathon-table"

  }

}

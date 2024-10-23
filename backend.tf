terraform {

  backend "s3" {

    bucket         = "squad1-hackathon-bucket-table"

    key            = "statefile"

    region         = "us-east-1"

    dynamodb_table = "squad1-hackathon-table"

  }

}

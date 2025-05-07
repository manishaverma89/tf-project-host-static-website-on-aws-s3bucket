resource "aws_s3_bucket" "mytfwebapp-demobucket" {
  bucket = "webapp-demobucket-123"
}

#Edit S3 block Public access settings
resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.mytfwebapp-demobucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

#Add a bucket policy
resource "aws_s3_bucket_policy" "mytfwebapp-policy" {
  bucket = aws_s3_bucket.mytfwebapp-demobucket.id 
  policy = jsonencode(
    {
     Version: "2012-10-17",
     Statement = [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject",
            
            Resource = "arn:aws:s3:::${aws_s3_bucket.mytfwebapp-demobucket.id}/*"
            }
    ]
}

)
}


#aws_s3_bucket_website_configuration
resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.mytfwebapp-demobucket.id

  index_document {
    suffix = "index.html"
  }
}


#Added index.html file to the bucket
resource "aws_s3_object" "indexhtml" {
    bucket = aws_s3_bucket.mytfwebapp-demobucket.bucket
    source = "./index.html"
    key = "index.html"
    content_type = "text/html"
}

#Added styles.css to the bucket
resource "aws_s3_object" "stylescss" {
    bucket = aws_s3_bucket.mytfwebapp-demobucket.bucket
    source = "./styles.css"
    key = "styles.css"
    content_type = "text/css"
}


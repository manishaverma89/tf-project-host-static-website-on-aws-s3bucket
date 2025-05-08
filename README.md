# tf-project-host-static-website-on-aws-s3bucket
#Resource: aws_s3_bucket_public_access_block
host static website on aws s3 bucket using Terraform 

#Add a Bucket Policy from
#Resource: aws_s3_bucket_policy
setting permissions for website access from Hosting a static website 
official documentation from Amazon Simple Storage Service (AWS)
link:
https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteAccessPermissionsReqd.html

#Resource: aws_s3_bucket_website_configuration

#content_type values

AWS S3, the Content-Type is a metadata field that specifies the media type of the object being stored. It is essential for browsers and applications to correctly handle and display the stored objects. Here are some common Content-Type values for different file extensions:

For HTML files: text/html

For PNG images: image/png

For JPEG images: image/jpeg

For JSON files: application/json

For JavaScript files: application/javascript

For CSS files: text/css

For plain text files: text/plain

For XML files: application/xml

For your specific case, if you are uploading .png, .jpg, and .jpeg files, you should use the following Content-Type values:

For .png files: image/png

For .jpg and .jpeg files: image/jpeg

# Resources i used in my Project
resource "aws_s3_bucket" "mytfwebapp-demobucket"

resource "aws_s3_bucket_public_access_block" "example"

resource "aws_s3_bucket_policy"  "mytfwebapp-policy"

resource "aws_s3_bucket_website_configuration" "mywebapp"

resource "aws_s3_object" "index.html"

resource "aws_s3_object"  "styles_css"

output "url"


PRE-REQS
Need to manually create a role named 'admin-access' with required privilges on AWS before proceeding. Modify the role_arn in main.tf
This should be an EC2 role attached to the instance running the terraform. Also, the aws-cli should be configured to use this role.
Also, manually create the S3 bucket named 'jagjot-s3-bucket-demo' as specified in the backend.tf'

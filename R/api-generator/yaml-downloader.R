ecs_url = "https://raw.githubusercontent.com/APIs-guru/openapi-directory/master/APIs/amazonaws.com/ecs/2014-11-13/openapi.yaml"
download.file(ecs_url, "R/api-generator/openapi/ecs.yaml")

ec2_file <- "R/api-generator/openapi/ec2.yaml"
ec2_url <- "https://raw.githubusercontent.com/APIs-guru/openapi-directory/master/APIs/amazonaws.com/ec2/2016-11-15/openapi.yaml"
download.file(ec2_url, ec2_file)

## remove non-ASCII characters
library(readr)
txt <- read_file(ec2_file)
txt2 <- gsub("[^\u0001-\u007F]+|<U\\+\\w+>","_", txt)

## Very minor revision to fit CRAN requirements
txt3 <- gsub("http://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2",
             "https://aws.amazon.com/ec2/faqs/#How_many_instances_can_I_run_in_Amazon_EC2/",
             txt2, fixed = TRUE)

write_file(txt3, file=ec2_file)


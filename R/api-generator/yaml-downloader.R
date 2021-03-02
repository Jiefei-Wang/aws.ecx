ecs_url = "https://raw.githubusercontent.com/APIs-guru/openapi-directory/master/APIs/amazonaws.com/ecs/2014-11-13/openapi.yaml"
download.file(ecs_url, "R/openapi/ecs.yaml")

ec2_file <- "R/openapi/ec2.yaml"
ec2_url <- "https://raw.githubusercontent.com/APIs-guru/openapi-directory/master/APIs/amazonaws.com/ec2/2016-11-15/openapi.yaml"
download.file(ec2_url, ec2_file)

## remove non-ASCII characters
fileName <- ec2_file
txt <- readChar(fileName, file.info(fileName)$size)
txt2 <- gsub("[^\u0001-\u007F]+|<U\\+\\w+>","_", txt)
cat(txt2, file=ec2_file)


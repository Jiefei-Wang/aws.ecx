---
title: "Quick-Start-Guide"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Quick-Start-Guide}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---




# Introduction
This package aims to provide the basic functions for communicating with Amazon Web Services(AWS) Elastic Container Service(ECS) using AWS REST APIs. However, it contains the APIs from both EC2 and ECS as most network settings are done via the EC2 APIs. The ECS functions start with the prefix `ecs_` and EC2 functions start with `ec2_`. The general-purpose function has the prefix `aws_`

# Authentication
Credentials must be provided for using the package. This can be done via `aws_set_credentials()`. 

```r
aws_set_credentials()
#> $access_key_id
#> [1] "AK**************OYX3"
#> 
#> $secret_access_key
#> [1] "mL**********************************XGGH"
#> 
#> $region
#> [1] "us-east-1"
```
You can either explicitly provide the credentials by the function arguments or rely on the locator to automatically find your credentials. There are many ways to locate the credentials but the most important methods are as follow(sorted by the search order):

1. environment variables `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_DEFAULT_REGION`, and `AWS_SESSION_TOKEN`

2. a profile in a global credentials dot file in a location set by `AWS_SHARED_CREDENTIALS_FILE` or defaulting typically to `"~/.aws/credentials"` (or another OS-specific location), using the profile specified by `AWS_PROFILE`

Users can find the details on how the credentials are located from `?aws.signature::locate_credentials`.

# Call the functions
After doing the authentication, you can call the ECS functions now. The functions accept a list object `json` as the input. This object will then be converted to a JSON object or the request header depending on the API types. You can find the documentation of the request parameter from [AWS Documentation](https://docs.aws.amazon.com/index.html). For example, you can find the current task definitions on ECS by

```r
ecs_list_task_definitions()
#> [1] "arn:aws:ecs:us-east-1:020007817719:task-definition/R-worker-task-definition:1"
#> [2] "arn:aws:ecs:us-east-1:020007817719:task-definition/test:1"
```
Here are the current available AWS-related functions in the package. For EC2

```
#> ec2_attach_internet_gateway
#> ec2_authorize_security_group_ingress
#> ec2_create_internet_gateway
#> ec2_create_route
#> ec2_create_route_table
#> ec2_create_security_group
#> ec2_create_subnet
#> ec2_create_vpc
#> ec2_delete_internet_gateway
#> ec2_delete_route
#> ec2_delete_route_table
#> ec2_delete_security_group
#> ec2_delete_subnet
#> ec2_delete_vpc
#> ec2_describe_internet_gateways
#> ec2_describe_route_tables
#> ec2_describe_security_groups
#> ec2_describe_subnets
#> ec2_describe_vpcs
#> ec2_detach_internet_gateway
```
For ECS

```
#> ecs_create_cluster
#> ecs_delete_cluster
#> ecs_deregister_task_definition
#> ecs_describe_tasks
#> ecs_list_clusters
#> ecs_list_task_definitions
#> ecs_list_tasks
#> ecs_register_task_definition
#> ecs_run_task
#> ecs_stop_task
```

# Package settings
The package handles the network issue via the parameter `retry_time`, `print_on_error` and `network_timeout`. 


```r
aws_get_retry_time()
#> [1] 3
aws_get_print_on_error()
#> [1] TRUE
aws_get_network_timeout()
#> [1] 10
```
`retry_time` determines the number of time the function will retry when network error occurs before throwing an error. If `print_on_error` is set to `False`, no message will be given when the network error has occurred and the package will silently resend the REST request. `network_timeout` decides how long the function will wait before it fails. They can be changed via the corresponding setters(e.g. `aws_set_retry_time`).

# Session info

```r
sessionInfo()
#> R Under development (unstable) (2020-09-03 r79126)
#> Platform: x86_64-w64-mingw32/x64 (64-bit)
#> Running under: Windows 10 x64 (build 19041)
#> 
#> Matrix products: default
#> 
#> locale:
#> [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
#> [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
#> [5] LC_TIME=English_United States.1252    
#> 
#> attached base packages:
#> [1] stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] simpleECS_0.99.0
#> 
#> loaded via a namespace (and not attached):
#>  [1] rstudioapi_0.13     knitr_1.30          xml2_1.3.2          magrittr_1.5       
#>  [5] pkgload_1.1.0       aws.signature_0.6.0 rjson_0.2.20        R6_2.5.0           
#>  [9] rlang_0.4.8         fansi_0.4.1         stringr_1.4.0       httr_1.4.2         
#> [13] tools_4.1.0         xfun_0.19           cli_2.1.0           withr_2.3.0        
#> [17] htmltools_0.5.0     yaml_2.2.1          assertthat_0.2.1    rprojroot_2.0.2    
#> [21] digest_0.6.27       crayon_1.3.4        base64enc_0.1-3     curl_4.3           
#> [25] testthat_3.0.0      glue_1.4.2          evaluate_0.14       rmarkdown_2.5      
#> [29] stringi_1.5.3       compiler_4.1.0      desc_1.2.0          jsonlite_1.7.1
```






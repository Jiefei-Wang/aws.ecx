---
title: "Quick-Start-Guide"
output: rmarkdown::html_vignette
vignette: >
  %\VignetteIndexEntry{Quick-Start-Guide}
  %\VignetteEngine{knitr::rmarkdown}
  %\VignetteEncoding{UTF-8}
---





[![](https://www.r-pkg.org/badges/version/aws.ecx?color=green)](https://cran.r-project.org/package=aws.ecx)
[![](https://img.shields.io/badge/devel%20version-1.0.0-orange.svg)](https://github.com/Jiefei-Wang/aws.ecx)
[![](http://cranlogs.r-pkg.org/badges/last-month/aws.ecx?color=blue)](https://cran.r-project.org/package=aws.ecx)

# Introduction
This package aims to provide the functions for communicating with Amazon Web Services(AWS) Elastic Container Service(ECS) using AWS REST APIs. The ECS functions start with the prefix `ecs_` and EC2 functions start with `ec2_`. The general-purpose functions have the prefix `aws_`.

Since there are above 400 EC2 APIs, it is not possible for the unit test to cover all use cases. If you see any problems when using the package, please consider to submit the issue to [GitHub issue][GitHub issue].

[GitHub issue]: https://github.com/Jiefei-Wang/aws.ecx/issues

# Authentication
Credentials must be provided for using the package. The package uses `access key id` and `secret access key` to authenticate with AWS. See [AWS user guide][AWS user guide] for the information about how to obtain them from AWS console. The credentials can be set via `aws_set_credentials()`.

```r
aws_set_credentials()
#> $access_key_id
#> [1] "AK**************OYX3"
#> 
#> $secret_access_key
#> [1] "mL**********************************XGGH"
#> 
#> $region
#> [1] "ap-southeast-1"
```
You can either explicitly provide the credentials by the function arguments or rely on the locator to automatically find your credentials. There are many ways to locate the credentials but the most important methods are as follow(sorted by the search order):

1. environment variables `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_DEFAULT_REGION`, and `AWS_SESSION_TOKEN`

2. a profile in a global credentials dot file in a location set by `AWS_SHARED_CREDENTIALS_FILE` or defaulting typically to `"~/.aws/credentials"` (or another OS-specific location), using the profile specified by `AWS_PROFILE`

Users can find the details on how the credentials are located from `?aws.signature::locate_credentials`.

[AWS user guide]: https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html

# Call the functions
Calling the EC2 or ECS function is simple, for example, you can list all ECS clusters via

```r
ecs_list_clusters()
#> REST request failed with the message:
#>  Timeout was reached: [ecs.ap-southeast-1.amazonaws.com] Operation timed out after 10308 milliseconds with 0 bytes received
#> [1] "arn:aws:ecs:ap-southeast-1:020007817719:cluster/R-worker-cluster"
```
The original EC2 and ECS APIs accept the request parameter via the query parameter or header and return the result by JSON or XML text in the REST request. The package provides a unified way to call both APIs. The request parameters can be given by the function arguments and the result is returned in a list format. If possible, the package will try to simplify the result and return a simple character vector. It will also handle the `nextToken` parameter in the REST APIs and collect the full result in a single function call. This default behavior can be turned off by providing the parameter `simplefy = FALSE`.

Each EC2 or ECS API has its own document. For example, you can find the help page of `ecs_list_clusters` via `?ecs_list_clusters`. The full description of the APIs can be found at [AWS Documentation][AWS Documentation].

[AWS Documentation]: https://docs.aws.amazon.com/index.html

## A note for the AWS EC2 functions
### Array

While the AWS Documentation is very helpful in finding the API use cases. There are some inconsistencies between the AWS Documentation and the package functions. To be more specific, the array type parameter will get special treatment in this package. For example, here is an example of `DescribeVpcs`from the [AWS Documentation][example] which describes the specified VPCs
```
https://ec2.amazonaws.com/?Action=DescribeVpcs
&VpcId.1=vpc-081ec835f3EXAMPLE
&vpcId.2=vpc-0ee975135dEXAMPLE
&VpcId.3=vpc-06e4ab6c6cEXAMPLE
```
The `VpcId` is so-called array object in the AWS Documentation. The dot `.` in the array can be explained as `[[` and anything followed by the dot can be explained as the index in R. Therefore, the corresponding R expression for `VpcId` is

```r
VpcId <- list()
VpcId[[1]] <- "vpc-081ec835f3EXAMPLE"
VpcId[[2]] <- "vpc-0ee975135dEXAMPLE"
VpcId[[3]] <- "vpc-06e4ab6c6cEXAMPLE"

VpcId
#> [[1]]
#> [1] "vpc-081ec835f3EXAMPLE"
#> 
#> [[2]]
#> [1] "vpc-0ee975135dEXAMPLE"
#> 
#> [[3]]
#> [1] "vpc-06e4ab6c6cEXAMPLE"
```
and the same request in R can be made by
```
ec2_describe_vpcs(VpcId = VpcId)
```
Internally, `VpcId` will be converted to an array object using the function `list_to_array`, e.g.

```r
## The first argument is the parameter prefix
## The second argument should be a (named) vector or a list
list_to_array("VpcId", VpcId)
#> $VpcId.1
#> [1] "vpc-081ec835f3EXAMPLE"
#> 
#> $VpcId.2
#> [1] "vpc-0ee975135dEXAMPLE"
#> 
#> $VpcId.3
#> [1] "vpc-06e4ab6c6cEXAMPLE"
```
Just like list can be nested, the array object can be nested as well. For example, if we have a `tags` array like
```
tags.1.name = name-example
tags.1.value.1 = value-example1
tags.1.value.2 = value-example2
```
Using the array rule we mentioned above, the corresponding R expression is

```r
tags <- list()
tags[[1]] <- list()
tags[[1]][["name"]] <- "name-example"
tags[[1]][["value"]] <- list()
tags[[1]][["value"]][[1]] <- "value-example1"
tags[[1]][["value"]][[2]] <- "value-example2"

tags
#> [[1]]
#> [[1]]$name
#> [1] "name-example"
#> 
#> [[1]]$value
#> [[1]]$value[[1]]
#> [1] "value-example1"
#> 
#> [[1]]$value[[2]]
#> [1] "value-example2"
```
We can verify the request parameter using `list_to_array`

```r
list_to_array("tags", tags)
#> $tags.1.name
#> [1] "name-example"
#> 
#> $tags.1.value.1
#> [1] "value-example1"
#> 
#> $tags.1.value.2
#> [1] "value-example2"
```

### Filter
A even more aggressive change can be found on the `Filter` parameter. Here is an example of describing VPCs which satisfy some specific conditions from the [AWS Documentation][example]
```
https://ec2.amazonaws.com/?Action=DescribeVpcs
&Filter.1.Name=dhcp-options-id
&Filter.1.Value.1=dopt-7a8b9c2d
&Filter.1.Value.2=dopt-2b2a3d3c
&Filter.2.Name=state
&Filter.2.Value.1=available
```
The `Filter` parameter is, of course, an array object in AWS documentation. However, it is clearly redundant to specify the filter's name and value separately. Therefore, the package allows users to provide the filter as a named list. The same request in R can be given by
```
ec2_describe_vpcs(
  Filter = list(
    `dhcp-options-id` = c("dopt-7a8b9c2d", "dopt-2b2a3d3c"),
    state="available"
  )
)
```
The `Filter` parameter will be converted into a list object which meets the AWS filter requirement. If you are unsure about whether you has specified the correct filter, you can check the converted filter values via

```r
filter <- list(
    `dhcp-options-id` = c("dopt-7a8b9c2d", "dopt-2b2a3d3c"),
    state="available"
  )
list_to_filter(filter)
#> $Filter.1.Name
#> [1] "dhcp-options-id"
#> 
#> $Filter.1.Value.1
#> [1] "dopt-7a8b9c2d"
#> 
#> $Filter.1.Value.2
#> [1] "dopt-2b2a3d3c"
#> 
#> $Filter.2.Name
#> [1] "state"
#> 
#> $Filter.2.Value.1
#> [1] "available"
```

[example]: https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeVpcs.html


## A note for the AWS ECS functions
The AWS ECS API uses JSON format to store the request parameter. Therefore, the ECS R functions will use `rjson::toJSON` to convert the request parameters into JSON objects. If you are not sure if you use the parameter correctly, you can manually run `rjson::toJSON` and compare the result with the example provided in AWS documentation. For example, the request syntax for the `tag` parameter in `CreateCluster` API is 
```
"tags": [ 
         { 
            "key": "string",
            "value": "string"
         }
      ]
```
The corresponding R format should be

```r
tags <- list(
  c(key = "key", value = "value")
  )
```
You can verify it by

```r
cat(rjson::toJSON(tags, indent = 1))
#> [
#>  {
#> "key":"key",
#> "value":"value"
#>  }
#> ]
```


# Package settings
The package handles the network issue via the parameter `retry_time`, `print_on_error` and `network_timeout`.


```r
aws_get_retry_time()
#> [1] 5
aws_get_print_on_error()
#> [1] TRUE
aws_get_network_timeout()
#> [1] 10
```
`retry_time` determines the number of time the function will retry when network error occurs before throwing an error. If `print_on_error` is set to `False`, no message will be given when the network error has occurred and the package will silently resend the REST request. `network_timeout` decides how long the function will wait before it fails. They can be changed via the corresponding setters(e.g. `aws_set_retry_time`).

# Session info

```r
sessionInfo()
#> R version 4.0.4 (2021-02-15)
#> Platform: x86_64-w64-mingw32/x64 (64-bit)
#> Running under: Windows 10 x64 (build 19042)
#> 
#> Matrix products: default
#> 
#> locale:
#> [1] LC_COLLATE=English_United States.1252  LC_CTYPE=English_United States.1252   
#> [3] LC_MONETARY=English_United States.1252 LC_NUMERIC=C                          
#> [5] LC_TIME=English_United States.1252    
#> 
#> attached base packages:
#> [1] parallel  stats4    stats     graphics  grDevices utils     datasets  methods   base     
#> 
#> other attached packages:
#> [1] aws.ecx_1.0.0       S4Vectors_0.28.0    BiocGenerics_0.36.0 testthat_3.0.2     
#> [5] httr_1.4.2          rmarkdown_2.7       whisker_0.4         rapiclient_0.1.3   
#> 
#> loaded via a namespace (and not attached):
#>  [1] BiocManager_1.30.10 pillar_1.4.6        compiler_4.0.4      RColorBrewer_1.1-2 
#>  [5] base64enc_0.1-3     tools_4.0.4         digest_0.6.27       pkgload_1.1.0      
#>  [9] jsonlite_1.7.2      tibble_3.0.4        lifecycle_0.2.0     gtable_0.3.0       
#> [13] evaluate_0.14       pkgconfig_2.0.3     rlang_0.4.10        cli_2.3.1          
#> [17] rstudioapi_0.13     rvcheck_0.1.8       curl_4.3            yaml_2.2.1         
#> [21] xfun_0.19           dplyr_1.0.2         withr_2.3.0         stringr_1.4.0      
#> [25] knitr_1.31          xml2_1.3.2          generics_0.1.0      vctrs_0.3.4        
#> [29] desc_1.2.0          dlstats_0.1.3       tidyselect_1.1.0    rprojroot_2.0.2    
#> [33] grid_4.0.4          glue_1.4.2          R6_2.5.0            purrr_0.3.4        
#> [37] ggplot2_3.3.2       badger_0.0.9        magrittr_1.5        ellipsis_0.3.1     
#> [41] scales_1.1.1        htmltools_0.5.0     assertthat_0.2.1    colorspace_2.0-0   
#> [45] aws.signature_0.6.0 stringi_1.5.3       munsell_0.5.0       crayon_1.3.4       
#> [49] rjson_0.2.20
```






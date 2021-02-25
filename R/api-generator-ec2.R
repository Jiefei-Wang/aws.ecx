ec2_apis <- c(
    "CreateInternetGateway",
    "DeleteInternetGateway",
    "AttachInternetGateway",
    "DetachInternetGateway",
    "CreateSecurityGroup",
    "DeleteSecurityGroup",
    "AuthorizeSecurityGroupIngress",
    "CreateVpc",
    "DeleteVpc",
    "CreateSubnet",
    "DeleteSubnet",
    "CreateRoute",
    "DeleteRoute",
    "CreateRouteTable",
    "DeleteRouteTable"
)

ec2_apis_with_simplify <- list(
    DescribeInternetGateways="response[[\"internetGatewaySet\"]]",
    DescribeRouteTables="response[[\"routeTableSet\"]]",
    DescribeSecurityGroups="response[[\"securityGroupInfo\"]]",
    DescribeVpcs="response[[\"vpcSet\"]]",
    DescribeSubnets = "response[[\"subnetSet\"]]",
    DescribeNetworkInterfaces = "response[[\"networkInterfaceSet\"]]"
)

generate_ec2_apis <- function(){
    file_name <- "R/ec2-actions.R"
    rd_name <- "AWS_APIs"
    if(file.exists(file_name)){
        file.remove(file_name)
    }
    code <- c()
    for(i in ec2_apis){
        code <- c(code,
                  generate_ec2_simple_api(i, rd_name))
    }
    for(i in names(ec2_apis_with_simplify)){
        code <- c(code,
                  generate_ec2_list_api(i,
                                        ec2_apis_with_simplify[[i]],
                                        rd_name))
    }
    code <- paste0(code, collapse = "\n\n")
    output_to_file(code, file_name)

}


generate_ec2_simple_api <- function(target, rd_name){
    template <- get_api_template("ecx_template.R")
    replace_ec2_template(template, target, rd_name)
}

generate_ec2_list_api <- function(target, result_getter, rd_name){
    template <- get_api_template("ecx_template_with_simplify.R")
    template <- replace_ec2_template(template, target, rd_name)
    template <- gsub("`result_getter`", result_getter, template, fixed = TRUE)
    template
}

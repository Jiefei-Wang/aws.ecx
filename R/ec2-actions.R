#' @rdname AWS_APIs
#' @export
ec2_create_internet_gateway<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "CreateInternetGateway", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_internet_gateway<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DeleteInternetGateway", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_attach_internet_gateway<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "AttachInternetGateway", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_detach_internet_gateway<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DetachInternetGateway", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_security_group<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "CreateSecurityGroup", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_security_group<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DeleteSecurityGroup", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_authorize_security_group_ingress<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "AuthorizeSecurityGroupIngress", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_vpc<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "CreateVpc", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_vpc<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DeleteVpc", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_subnet<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "CreateSubnet", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_subnet<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DeleteSubnet", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_route<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "CreateRoute", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_route<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DeleteRoute", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_route_table<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "CreateRouteTable", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_route_table<-function(... ,json = list()){
    json <- c(list(...), json)
    response <- ec2_get(action = "DeleteRouteTable", query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_describe_internet_gateways<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ec2_get(action = "DescribeInternetGateways", query = json)
    if(simplify){
        result <- response[["internetGatewaySet"]]
        while(!is.null(response$nextToken)){
            query$NextToken <- response$nextToken
            response <- ec2_get(action = action, query = query)
            result <- c(
                result,
                response[["internetGatewaySet"]]
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_route_tables<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ec2_get(action = "DescribeRouteTables", query = json)
    if(simplify){
        result <- response[["routeTableSet"]]
        while(!is.null(response$nextToken)){
            query$NextToken <- response$nextToken
            response <- ec2_get(action = action, query = query)
            result <- c(
                result,
                response[["routeTableSet"]]
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_security_groups<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ec2_get(action = "DescribeSecurityGroups", query = json)
    if(simplify){
        result <- response[["securityGroupInfo"]]
        while(!is.null(response$nextToken)){
            query$NextToken <- response$nextToken
            response <- ec2_get(action = action, query = query)
            result <- c(
                result,
                response[["securityGroupInfo"]]
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_vpcs<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ec2_get(action = "DescribeVpcs", query = json)
    if(simplify){
        result <- response[["vpcSet"]]
        while(!is.null(response$nextToken)){
            query$NextToken <- response$nextToken
            response <- ec2_get(action = action, query = query)
            result <- c(
                result,
                response[["vpcSet"]]
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_subnets<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ec2_get(action = "DescribeSubnets", query = json)
    if(simplify){
        result <- response[["subnetSet"]]
        while(!is.null(response$nextToken)){
            query$NextToken <- response$nextToken
            response <- ec2_get(action = action, query = query)
            result <- c(
                result,
                response[["subnetSet"]]
            )
        }
    }else{
        result <- response
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_network_interfaces<-function(..., json = list(), simplify = TRUE){
    json <- c(list(...), json)
    response <- ec2_get(action = "DescribeNetworkInterfaces", query = json)
    if(simplify){
        result <- response[["networkInterfaceSet"]]
        while(!is.null(response$nextToken)){
            query$NextToken <- response$nextToken
            response <- ec2_get(action = action, query = query)
            result <- c(
                result,
                response[["networkInterfaceSet"]]
            )
        }
    }else{
        result <- response
    }
    result
}


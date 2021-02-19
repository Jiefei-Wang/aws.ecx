#' @rdname AWS_APIs
#' @export
ec2_create_internet_gateway <- function(json = list()){
    action <- "CreateInternetGateway"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_internet_gateway <- function(json = list()){
    action <- "DeleteInternetGateway"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_attach_internet_gateway <- function(json = list()){
    action <- "AttachInternetGateway"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_detach_internet_gateway <- function(json = list()){
    action <- "DetachInternetGateway"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_security_group <- function(json = list()){
    action <- "CreateSecurityGroup"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_security_group <- function(json = list()){
    action <- "DeleteSecurityGroup"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_authorize_security_group_ingress <- function(json = list()){
    action <- "AuthorizeSecurityGroupIngress"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_vpc <- function(json = list()){
    action <- "CreateVpc"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_vpc <- function(json = list()){
    action <- "DeleteVpc"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_subnet <- function(json = list()){
    action <- "CreateSubnet"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_subnet <- function(json = list()){
    action <- "DeleteSubnet"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_route <- function(json = list()){
    action <- "CreateRoute"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_route <- function(json = list()){
    action <- "DeleteRoute"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_create_route_table <- function(json = list()){
    action <- "CreateRouteTable"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_delete_route_table <- function(json = list()){
    action <- "DeleteRouteTable"
    response <- ec2_get(action = action, query = json)
    response
}


#' @rdname AWS_APIs
#' @export
ec2_describe_internet_gateways<-function(json = list()){
    action <- "DescribeInternetGateways"
    response <- ec2_get(action = action, query = json)
    result <- response[["internetGatewaySet"]]
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            response[["internetGatewaySet"]]
        )
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_route_tables<-function(json = list()){
    action <- "DescribeRouteTables"
    response <- ec2_get(action = action, query = json)
    result <- response[["routeTableSet"]]
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            response[["routeTableSet"]]
        )
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_security_groups<-function(json = list()){
    action <- "DescribeSecurityGroups"
    response <- ec2_get(action = action, query = json)
    result <- response[["securityGroupInfo"]]
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            response[["securityGroupInfo"]]
        )
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_vpcs<-function(json = list()){
    action <- "DescribeVpcs"
    response <- ec2_get(action = action, query = json)
    result <- response[["vpcSet"]]
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            response[["vpcSet"]]
        )
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_subnets<-function(json = list()){
    action <- "DescribeSubnets"
    response <- ec2_get(action = action, query = json)
    result <- response[["subnetSet"]]
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            response[["subnetSet"]]
        )
    }
    result
}


#' @rdname AWS_APIs
#' @export
ec2_describe_network_interfaces<-function(json = list()){
    action <- "DescribeNetworkInterfaces"
    response <- ec2_get(action = action, query = json)
    result <- response[["networkInterfaceSet"]]
    while(!is.null(response$nextToken)){
        query$NextToken <- response$nextToken
        response <- ec2_get(action = action, query = query)
        result <- c(
            result,
            response[["networkInterfaceSet"]]
        )
    }
    result
}


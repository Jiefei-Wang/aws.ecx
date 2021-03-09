context("test ec2 functions")

vpc_id <- NULL
CidrBlock <- "100.68.0.0/18"
test_that("Create an vpc",{
    expect_error(response <- ec2_create_vpc(CidrBlock = CidrBlock), NA)
    expect_error(vpc_id <<- response$vpcId[[1]], NA)
    expect_equal(response$item$cidrBlock[[1]], CidrBlock)
})

test_that("describe an vpc by filter",{
    expect_error(
        response <- ec2_describe_vpcs(
            Filter=list(`vpc-id`=vpc_id)
        ),
        NA
    )
    expect_equal(length(response), 1)
    expect_equal(response$item$vpcId, vpc_id)
})

test_that("describe an vpc by vpcId",{
    ## If the VPC cannot be found, it should give us an error
    expect_error(
        response <- ec2_describe_vpcs(VpcId = "test")
    )
    expect_error(
        response <- ec2_describe_vpcs(VpcId = vpc_id),
        NA
    )
    expect_equal(length(response), 1)
    expect_equal(response$item$vpcId, vpc_id)
})



test_that("Delete the vpc",{
    ## If the VPC cannot be found, it should give us an error
    expect_error(
        response <- ec2_delete_vpc(VpcId = "test")
    )
    ## Delete the vpc
    expect_error(
        response <- ec2_delete_vpc(VpcId = vpc_id),
        NA
    )
    ## vpc should not exist
    expect_error(
        response <- ec2_delete_vpc(VpcId = vpc_id)
    )
    expect_error(
        response <- ec2_describe_vpcs(VpcId = vpc_id)
    )

})

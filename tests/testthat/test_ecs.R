context("test ecs functions")

if(aws_has_credentials()){
    cluster_names <- paste0("unit-test-cluster", 1:4)

    test_that("Delete the cluster if exist",{
        expect_error(response <- ecs_list_clusters(),NA)

        idx <- c()
        for(i in cluster_names){
            idx <- c(idx,  which(endsWith(response,paste0("/",i))))
        }
        if(length(idx)!=0){
            expect_error(response <- ecs_delete_cluster(cluster = i),NA)
        }
    })

    test_that("Create the cluster",{
        for(i in cluster_names){
            expect_error(response <- ecs_create_cluster(clusterName = i), NA)
        }
    })

    test_that("list the cluster",{
        expect_error(response <- ecs_list_clusters(),NA)
        idx <- c()
        for(i in cluster_names){
            idx <- c(idx,  which(endsWith(response,paste0("/",i))))
        }
        expect_true(length(idx)==length(cluster_names))

    })
    test_that("list the cluster with token",{
        expect_error(response <- ecs_list_clusters(maxResults = 2),NA)
        idx <- c()
        for(i in cluster_names){
            idx <- c(idx,  which(endsWith(response,paste0("/",i))))
        }
        expect_true(length(idx)==length(cluster_names))
    })

    test_that("describe the cluster",{
        expect_error(
            response <- ecs_describe_clusters(clusters = cluster_names[1]),NA
        )
    })

    test_that("Delete the cluster",{
        for(i in cluster_names){
            expect_error(response <- ecs_delete_cluster(cluster = i),NA)
        }
    })

    test_that("list the cluster again",{
        expect_error(response <- ecs_list_clusters(),NA)
        idx <- c()
        for(i in cluster_names){
            idx <- c(idx,  which(endsWith(response,paste0("/",i))))
        }
        expect_true(length(idx)==0)
    })
}

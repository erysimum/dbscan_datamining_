library(fpc)
library(dbscan)
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/factoextra")
library(factoextra)

db_data= read.csv("/Users/AmitShahi/Downloads/Datawarehousefiles/mushrooms.csv", stringsAsFactors = TRUE)
str(db_data)

new<- subset(db_data, select = -c(type, veil_type))
str(new)


#transform the data to one hot encoding
x.ohe <- model.matrix(~.-1, data=new)
str(x.ohe)

main_data <- x.ohe[,2:21]
km.res <- kmeans(main_data,2)  # 2 clusters
str(km.res)

fviz_cluster(km.res,main_data, ellipse = FALSE) 

fviz_cluster(km.res,main_data, geom = "point")  




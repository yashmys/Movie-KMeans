library('tidyverse')




movies <-  read.table("movies.txt",header = FALSE , sep="|",quote="\"")
movies
dim(movies)
str(movies)

colnames(movies) <- c("ID","Title","ReleaseDate","VedioReleaseDate","IMDB","Unknown","Action","Adventure",
                      "Animation","Childrens","Comedy","Crime","Documentary","Drama","Fantasy","FilmNoir",
                      "Horror","Musical","Mystery","Romance","SciFi","Thriller","War","Western" )
str(movies)

movies$ID <- NULL 
movies$ReleaseDate <- NULL
movies$VedioReleaseDate <- NULL 
movies$IMDB <- NULL 

movies <- unique(movies)
dim(movies)


distances <- dist(movies[2:20],method="euclidean")
class(distances)
distances

ClusterMovies <- hclust(distances,method = "ward")
class(ClusterMovies)

plot(ClusterMovies)

ClusterGroups <- cutree(ClusterMovies,k = 10) 
class(ClusterGroups)
ClusterGroups
dim(ClusterGroups)


tapply(movies$Action,ClusterGroups,mean)
tapply(movies$Romance,ClusterGroups,mean)

cluster2 <- subset(movies,ClusterGroups == 2 )
cluster2
head(cluster2)




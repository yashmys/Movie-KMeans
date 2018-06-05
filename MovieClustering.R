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

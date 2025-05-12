#
# predicting game outcome 
#

#install.packages("ggplot2")
library(ggplot2)

# import
valDF <- read.csv("E:\\Users\\Owner\\Documents\\USF\\applied stats\\data\\valorant_games.csv")
kjCyhperDF <- valDF[valDF$agent %in% c("Killjoy", "Cypher"), ]  # killjoy, cypher subset

attach(kjCyhperDF)

features <- kjCyhperDF[, c("kills", "deaths", "assists", "kdr", "acs")]
featuresScaled <- scale(features)

# elbow method (find k)
wss <- numeric(10)
for (k in 1:10) {
  kmeansModel <- kmeans(featuresScaled, centers = k, nstart = 25)
  wss[k] <- kmeansModel$tot.withinss
}

plot(1:10, wss, type = "b", pch = 19, frame = FALSE, 
     xlab = "Number of Clusters (K)", ylab = "Within-cluster Sum of Squares")

modelKMeans <- kmeans(featuresScaled, centers = 3, nstart = 25)

kjCyhperDF$cluster <- modelKMeans$cluster

pca <- prcomp(featuresScaled)
pcaData <- data.frame(pca$x[, 1:2], cluster = as.factor(kjCyhperDF$cluster))

ggplot(pcaData, aes(PC1, PC2, color = cluster)) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "k-keans clustering valorant matches", x = "PC1", y = "PC2")

aggregate(features, by = list(cluster = kjCyhperDF$cluster), FUN = mean)

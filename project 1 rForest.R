#
# predicting game outcome 
#

install.packages("randomForest")
library(randomForest)

# import
valDF <- read.csv("E:\\Users\\Owner\\Documents\\USF\\applied stats\\data\\valorant_games.csv")
kjCyhperDF <- valDF[valDF$agent %in% c("Killjoy", "Cypher"), ]  # killjoy, cypher subset

attach(kjCyhperDF)

# factorize
kjCyhperDF$outcome <- as.factor(kjCyhperDF$outcome)
kjCyhperDF$agent <- as.factor(kjCyhperDF$agent)
kjCyhperDF$map <- as.factor(kjCyhperDF$map)
#kjCypherDF$rank <- as.factor(kjCypherDF$rank)

k <- 7
folds <- sample(rep(1:k, length.out = nrow(kjCyhperDF)))
accuracies <- numeric(k)

for (i in 1:k) {
  
  trainSet <- kjCyhperDF[folds != i, ]
  testSet  <- kjCyhperDF[folds == i, ]
  
  modelRF <- randomForest(
    outcome ~ agent + map + rank + kills + deaths + assists + kdr + avg_dmg + acs,
    data = trainSet
  )
  
  predictions <- predict(modelRF, testSet)
  
  accuracies[i] <- mean(predictions == testSet$outcome)
}

meanAccuracy <- mean(accuracies)
cat("Average Accuracy over", k, "folds:", round(meanAccuracy, 3), "\n")

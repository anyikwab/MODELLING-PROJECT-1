# MODELLING-PROJECT-1: predicting game outcomes

## INSTRUCTIONS
All scripts attached utilize R, copy-paste the scripts into an IDE of your choice. During your analysis, ensure the dataset is subset to include only the agents Killjoy and Cypher.

## INTRODUCTION
Investigating the relation between outcome of a match versus agent, current map and rank, KDR (+ assists), ACS, and average damage.

## DATA
The dataset is sourced from kaggle which can be found [here](https://www.kaggle.com/datasets/mitchellharrison/my-first-1000-valorant-games?resource=download). It depicts a table of 1000 games of players competitive VALORANT career.

## RESULTS
Building a random forest model with k-folds yielded an average accuracy of __78.6%__ over 7 folds. The model was able to correctly ascertain the outcome of a match given the aforementioned features about 3/4 of the time.

cluster aggregate
| cluster | kills | deaths | assists | kdr | acs
| --- | --- | --- | --- | --- | --- |
| 1   |    1 | 17.71739 | 8.50000 | 3.630435 | 2.2681159 | 258.0072 |
| 2   |    2 | 11.18925 | 14.58879 | 3.883178 | 0.7941589 | 161.5818 |
| 3   |    3 | 19.21932 |15.80157 | 5.516971 | 1.2451697 | 237.6188 |

## DISCUSSION
The random forest model was chosen due to its overall robustness. Firstly, it handles mixed data types well and is able to combat overfitting as it is less swayed by noise. Additionally, the model is able to handle numerous features used and weight their importance. 

The table illustrates aggregates for the clusters made from the match stat features. The clusters showcase the various ways the player performs during each match: high kills and deaths with many assists, low kills and high deaths, and high kills with low deaths. The player's ACS was the highest during the latter, as they stayed alive for more rounds boosting their match performance.

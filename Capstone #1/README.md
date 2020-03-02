# Capstone #1 Proposal
## Rain or Shine - NFL


**Problem**

They say West coast teams cannot play on the East in winter, but is that an opinion or is there data to support this statement? There are many factors that contribute if a team is going to win or not, but can you predict the winner of an NFL game based on the weather? Does the type of stadium (indoor/outdoor, turf/grass) a team plays in aid in their probability of winning?  Using historical data for past NFL games (home/visiting team, score, type of stadium, weather, location) to find a correlation between these factors as well as a predictive model to predict the winner/loser of games.

**Audience**

Sports analytics has become popular in mainstream sports in this past decade. Sports teams have started to use analytics to aid in their decision making and preparation. Sports gambling from fantasy leagues to betting have also seen a significant impact from sports analytics. This project will benefit various fields involved in the NFL, from teams themselves, fantasy football players, to sports bettors. They will be able to use this project to better predict outcomes of games.

**Approach**

Predictive modeling will be used to solve the problem stated above. An analysis will be done to see if there are any correlations between various game factors. A model will be created based on this analysis to predict future outcomes. 

The approach during the exploratory data analysis phase will be hypothesis-driven.  The hypothesis tree which will be used is provided below in Figure 1. Once it is determined which features are relevant, several machine learning models will be trained and evaluated on the performance

**[Data Wrangling/Data Cleaning](https://github.com/rezalution/Springboard/tree/master/Capstone%20%231/Data%20Wrangling)**

The data for this project comes from Kaggle, with all data coming from 3 csv files.
1.	nfl_teams
  o	Contains team data past and present
2.	nfl_stadiums
  o	Contains stadium data past and present
3.	spreadspoke_scores
  o	Contains score and weather data for all NFL games

The data consists of historical NFL data from 1966 to 2019. Team and stadium data have various columns, the main focus will be on stadium and field type, as well as location. Game data during the date range is also included from various public websites such as ESPN, NFL.com, and Pro Football Reference. This dataset consists of multiple columns for game analysis including teams playing, stadium, score, and weather data. The weather information is provided from NOAA data. 

**[Data Story](https://github.com/rezalution/Springboard/tree/master/Capstone%20%231/Exploratory%20Analysis)**

When using a scatter plot to see the relationship between weather temperatures and score difference, it is too close to determine visually if there is any trend between the two. There seems to be an equal amount of positive score differences to negative score differences. Further analysis will need to be done to test.

**[Statistical Data Analysis](https://github.com/rezalution/Springboard/tree/master/Capstone%20%231/Statistical%20Analysis)**

After using statistical analysis to test correlations, only a very slight correlation was made between weather conditions and an advantage. There was a slight correlation that away teams perform worse in more extreme weather conditions, but the correlation value was too small to infer a strong connected between the two.

**[Machine Learning](https://github.com/rezalution/Springboard/tree/master/Capstone%20%231/Machine%20Learning)**

**[Final Report](https://github.com/rezalution/Springboard/tree/master/Capstone%20%231/Report)**

**Deliverables**
* Jupyter Notebook
   * Data wrangling and cleaning
   * Modeling and prediction
* Reports
   * Milestones and Final

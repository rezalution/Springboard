# Capstone #1 Proposal
## Rain or Shine - NFL


**Problem**

They say West coast teams cannot play on the East in winter, but is that an opinion or is there data to support this statement? There are many factors that contribute if a team is going to win or not, but can you predict the winner of an NFL game based on the weather? Does the type of stadium (indoor/outdoor, turf/grass) a team plays in aid in their probability of winning?  Using historical data for past NFL games (home/visiting team, score, type of stadium, weather, location) to find a correlation between these factors as well as a predictive model to predict the winner/loser of games.

**Audience**

Sports analytics has become popular in mainstream sports in this past decade. Sports teams have started to use analytics to aid in their decision making and preparation. Sports gambling from fantasy leagues to betting have also seen a significant impact from sports analytics. This project will benefit various fields involved in the NFL, from teams themselves, fantasy football players, to sports bettors. They will be able to use this project to better predict outcomes of games.

**Approach**

Predictive modeling will be used to solve the problem stated above. An analysis will be done to see if there are any correlations between various game factors. A model will be created based on this analysis to predict future outcomes. 

The approach during the exploratory data analysis phase will be hypothesis-driven.  The hypothesis tree which will be used is provided below in Figure 1. Once it is determined which features are relevant, several machine learning models will be trained and evaluated on the performance


**Exploratory Analysis**

**Data Wrangling**

The data for this project comes from Kaggle, with all data coming from 3 csv files.
1.	nfl_teams
  o	Contains team data past and present
2.	nfl_stadiums
  o	Contains stadium data past and present
3.	spreadspoke_scores
  o	Contains score and weather data for all NFL games

The data consists of historical NFL data from 1966 to 2019. Team and stadium data have various columns, the main focus will be on stadium and field type, as well as location. Game data during the date range is also included from various public websites such as ESPN, NFL.com, and Pro Football Reference. This dataset consists of multiple columns for game analysis including teams playing, stadium, score, and weather data. The weather information is provided from NOAA data. 

**Data Cleaning**

NFL data that will be used is from the 1996 season to 2018. There was 2019 data in the dataset, but it did not include the necessary information needed for the analysis. There still is enough data from the previous seasons to proceed. 

Most NFL stadiums are outdoors, meaning there is no roof covering to prevent outside weather conditions from effecting the game. This will be helpful for the analysis since I will be testing how much weather effects the outcome of games. Retractable games will be ignored since the dataset does not include clarification if the roof was closed or open during the game. Including it may skew the results. Indoor games will be used as a control since weather conditions do not effect the outcome. Most stadiums have grass fields. This will be vital to the analysis since weather conditions like rain or snow may effect the field conditions which in turn may change the outcome. The stadium type along with field surface will be tested on their effects on the game.

The average temperature for indoor and retractable games is around 71-72 degrees. This makes sense because the temperature is controlled within the stadiums. Even the max and min are the same 72 degrees for indoor stadiums because of the temperature control. Retractable stadiums however have a min of 26 and max of 92 degrees, these must be when the roof was opened. Outdoor stadiums have an average temperature of 55 degrees, with a min of -6 and a max of 97 degrees. This shows a wide range of temperatures which will help in the analysis to see how much the cold and heat effects the outcome. A question being does cold temperatures aid teams that play in the cold and hot temperatures aid teams that usually play in warmer climates? This will be a major test for this analysis.

There were not outliers found within the data. The biggest concern would be if weather temperature had an extreme min or max value but the min and max fit within the norms. Also, there are not outliers in the game score field, with the values looking normal for an NFL game.

**Data Story**

When using a scatter plot to see the relationship between weather temperatures and score difference, it is too close to determine visually if there is any trend between the two. There seems to be an equal amount of positive score differences to negative score differences. Further analysis will need to be done to test.

The mean score difference for indoor and retractable stadiums is 1-2 points. Outdoor stadiums however have a score difference of 3. A hypothesis can be tested is that since outdoors have a higher score difference, weather does have an effect on the outcome in favor of home teams. Indoor and retractable stadiums also show a positive score difference for the home team, but weather does not effect the game because of the stadium temperature being controlled. This does though add evidence towards a home field advantage, especially since all 3 stadium types have a positive score difference for home teams.

When comparing outdoor stadium temperatures against the score difference, there are two interesting observation I found. Games with low cold temperatures had a higher score difference. This shows that home teams won by a bigger difference when the temperatures were very cold. A hypothesis supported from this and which can be tested is that cold temperatures aid home teams. On the other hand, games with high temperatures, 90 and above, have a negative score difference. This is interesting because just using this graph it can be said that extremely high temperatures aid away teams, which contradicts an early hypothesis of temperature aiding the home team be it cold or hot. Further testing will need to be done to see if there are any other factors effecting this outcome, like the games when played in regularly cold areas but those game days had irregularly high temperatures. Also adding to that the away teams may have been from warmer climates.

When taking the percentage of games won by the home team, there is a slight tilt towards a home field advantage. Home teams win on average 57% of the time. Even when breaking it by decades, there has not been a decade where the home teams have lost more than away teams. The beginning of the NFL had the lowest win percentage for home teams at around 54.6% and the 1990s with the highest at 60.0%.

Even when considering stadium types there seems to be a home field advantage. All three types have a home team win percentage of 55% - 59%. Just like score differences indoor and retractable have similar percentages, while outdoor stadiums having the highest win percentage. This further aids in the hypothesis that weather effects the outcome of games by aiding the home team.

**Statistical Data Analysis**

When plotting the temperature vs humidity, many of the lines are above the 0-score difference line. This implies that the home team score more than the away team resulting in a win for the home team. One outlier is when humidity was in the 10s, the away team scored more in all temperatures. Also, the away team scored more than the home team at temperatures greater than 80 when the humidity was in the 30s, 60s, and 10s like stated above. Most of the differences are at the two polar ends of the temperature range. When temperatures are around 0 degrees and greater than 80 degrees, the score difference diverts greatly from the middle.

There is a greater correlation with away team scores (0.066) and weather temperature than home team scores (0.003), though the correlation is still a weak one since the r value is less than 0.2. This implies that when temperatures increase there is a slight correlation that the away team score will also increase, and when temperatures decrease the away team score will decrease. Therefore, away teams may have a harder time playing in colder temperatures, though the correlation is very small.

As with temperature vs score there is a greater correlation with away team scores (-0.024) and humidity than home team scores (-0.016). Also, the correlation is still a weak one since the r value is less than -0.2.
The difference with humidity is that the correlations are negative. This implies that when humidity increases there is a slight correlation that the away team score will decrease, and when humidity decreases the away team score will increase. Therefore, away teams may have a harder time playing in higher humidity, though the correlation is very small.

There is a negative correlation between outdoor stadium temperatures and the score difference when taking the mean difference for each binned weather temperature. The r value for these two is -0.87. This is a indicts a strong correlation that as temperature decreases the score difference increases. Also, the Spearman correlation for the two is -1.0. This shows a strong negative correlation between the temperature and score difference.

Though when you test the correlation for all the games separately without binning the correlation drops to -0.04 and -0.04 for both correlation test. This shows a big shift towards no correlation.

A factor for this shift is with binning and taking the mean of each there is a larger impact of outliers and one-off differences. Most of the points for all games is in clustered in the middle with a few outliers at the ends. when just taking the mean of each binned temperature the number of points in each gets negated. This allows the outliers to have a greater effect on the results.

After using statistical analysis to test correlations, only a very slight correlation was made between weather conditions and an advantage. There was a slight correlation that away teams perform worse in more extreme weather conditions, but the correlation value was too small to infer a strong connected between the two.


**Deliverables**
* Jupyter Notebook
   * Data wrangling and cleaning
   * Modeling and prediction
* Reports
   * Milestones and Final

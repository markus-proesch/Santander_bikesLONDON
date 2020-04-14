# Santander bike share in London, UK

Santander Cycles is a public bicycle hire scheme in London, Swansea, Milton Keynes and Brunel University in the United Kingdom. The scheme's bicycles are popularly known as Boris Bikes, after then-Mayor of London, Boris Johnson, who introduced them during his tenure. With 777 stations and about 13,700 bikes it is one of the largest bike sharing networks in the world. 

The first step in the project was to use PostgreSQL to join two tables in Google BigQuery to get the information I needed for the animation. Next, I used ggplot() in R Studio to place the full graph on top of the map. Last, I used animate() to animate the plot movement based on the hourly time variable in the dataset. 

I decided to visually present the movement of bikes on Thursday, July 9th, 2015. There are a few things that could have been done better in the project:
- The bikes follow linear paths from one station to another, not following any roads or sidewalks.
- The time interval is in hours which makes the movement of the bikes a little un-natural. Also if a bike was on several trips in an hour the map won't follow.

The dataset is publicly available in the Google Cloud Platform. I won't be posting it here due to copyright 

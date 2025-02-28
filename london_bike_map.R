library(rnaturalearth)
library(sf)
library(maps)
library(rgdal)
library(ggplot2)
library(ggmap)
library(maps)
library(mapdata)
library(geojsonio)
library(broom)
library(leaflet)
library(ggplot2)
library(gganimate)
library(maptools)
library(raster)
library(ggmap)

# In order to use Google Map as a background, while still being linked to coordinates 
register_google(key = 'xxx_USE_API_KEY_xxx')
london_map <- get_map(location = c(-0.120995, 51.509114), source = 'google', 
               maptype = 'terrain', zoom = 13)

# Needed to extract the time from the start_date which I could have done in SQL, but decided to do here.
london_bike <- read.csv('london_bike2015july09_T20000.csv')

midnight <- strptime("2015-07-09 00:00:00","%Y-%m-%d %H:%M")
london_bike$time_hour <- as.integer(-(difftime(format(midnight,"%Y/%m/%d %H:%M"), 
                                                     london_bike$start_date, 
                                                     units = 'hours')))

# Plot the graph
myPlot2 <- ggmap(london_map, extent = "device", darken = c(0.3, "white")) +
  geom_point(data = london_bike, aes(x = start_long, y = start_lat, alpha = 0.6), 
             show.legend = FALSE, color = 'red')+
  labs(title = 'Time (00-24): {frame_time} ', subtitle = ) +
  theme(plot.title = element_text(size=22))+
  transition_time(time_hour) +
  shadow_wake(wake_length = 0.007, alpha = TRUE)+
  ease_aes('linear')

# Save the animation as .gif file
animate(myPlot2, duration = 30, fps = 30, width = 500, height = 500, renderer = gifski_renderer())
anim_save("London_bikesLinkedIn2.gif")





          

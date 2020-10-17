library(sf)
library(tmap)
library(tmaptools)
library(leaflet)
library(dplyr)
library(readxl)

#district level (administrative level 2) map shapefile data
map_dist <- st_read("gadm36_BGD_shp/gadm36_BGD_2.shp")

#covid19 data for 10 october
data<- readxl::read_excel("COVID-19.xlsx", skip = 1)

# map and data joined
covi19map <- inner_join(map_dist, data, by = c("NAME_2" = "Distirct"))


# map mode to static mode
tmap_mode("plot")

#defining and styling the map
map <- tm_shape(covi19map) + 
  tm_polygons("Confirmed_Cases",id = "NAME_2",palette = "Reds",style = "log10_pretty", title = "Confirmed Cases") +
  tm_style("cobalt")+
  tm_layout(
    "Bangladesh\nCovid-19: District Wise Situation (16.10.20)\nSource: IEDCR",
    title.position = c("left", "bottom"),
    legend.position = c("right", "top")
    )

# plotting the map
map


#converting it to an interactive leaflet map
tmap_leaflet(map) %>% 
  addControl("Bangladesh<br>Covid-19: District Wise Situation (16.10.20)<br>Source: IEDCR", position = "bottomleft")





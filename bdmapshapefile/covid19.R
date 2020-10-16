library(sf)
library(tmap)
library(tmaptools)
library(leaflet)
library(dplyr)


map_dist <- st_read("gadm36_BGD_shp/gadm36_BGD_2.shp")
district <- read.csv("Districts.csv")
district <- data.frame(District = district$District, Density = district$Pop.Density.in.2011)
district$District <- gsub(" District","",district$District)
district <- data.frame(NAME_2 = district$District, Population_Density = district$Density)




map_and_data <- inner_join(map_dist, district)

data<- readxl::read_excel("COVID-19.xlsx", skip = 1)

covi19map <- inner_join(map_dist, data, by = c("NAME_2" = "Distirct"))


tmap_mode("plot")
map <- tm_shape(covi19map) + 
  tm_polygons("Confirmed_Cases",id = "NAME_2",palette = "Reds",style = "log10_pretty", title = "Confirmed Cases") +
  tm_style("cobalt")+
  tm_layout(
    "Bangladesh\nCovid-19: District Wise Situation (16.10.20)\nSource: IEDCR",
    title.position = c("left", "bottom"),
    legend.position = c("right", "top")
    )

map

tmap_leaflet(map) %>% addControl("Bangladesh<br>Covid-19: District Wise Situation (16.10.20)<br>Source: IEDCR", position = "bottomleft")




#tmap_mode("view")

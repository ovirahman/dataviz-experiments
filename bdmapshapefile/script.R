library(sf)
library(tmap)
library(tmaptools)
library(leaflet)
library(dplyr)

map<-st_read("gadm36_BGD_shp/gadm36_BGD_1.shp")
data<- read.csv("population.csv")
data <- data.frame(NAME_1 = data$Division, Population = data$Population)
data$Population <- gsub(",","", data$Population)
data$Population <- as.numeric(data$Population)
mapanddata<- inner_join(map,data)

tm_shape(mapanddata) + tm_polygons("Population",palette = "Greens")
tmap_mode("view")
tmap_last()

map_dist <- st_read("gadm36_BGD_shp/gadm36_BGD_2.shp")
district <- read.csv("Districts.csv")
district <- data.frame(District = district$District, Density = district$Pop.Density.in.2011)
district$District <- gsub(" District","",district$District)
district <- data.frame(NAME_2 = district$District, Population_Density = district$Density)

map_and_data <- inner_join(map_dist, district)

tm_shape(map_and_data) + tm_polygons("Population_Density",id = "NAME_2",palette = "Reds")
tmap_mode("view")
tmap_mode("plot")

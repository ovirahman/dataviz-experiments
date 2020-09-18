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

tmap_mode("plot")
tm_shape(map_and_data) + tm_polygons("Population_Density",id = "NAME_2",palette = "Reds")


tmap_mode("view")
tm_shape(map_and_data) + tm_polygons("Population_Density",id = "NAME_2",palette = "Reds")



tm_shape(map_and_data) +
    tm_bubbles(size = "Population_Density", col = "red", id = "NAME_2")




########bbs shapefile

map_dist <- st_read("bgd_admbnda_adm2_bbs_20180410/bgd_admbnda_adm2_bbs_20180410.shp")
district <- read.csv("Districts.csv")
district <- data.frame(District = district$District, Density = district$Pop.Density.in.2011)
district$District <- gsub(" District","",district$District)
district <- data.frame(ADM2_EN = district$District, Population_Density = district$Density)

map_and_data <- inner_join(map_dist, district)

tmap_mode("plot")
tm_shape(map_and_data) + tm_polygons("Population_Density",id = "ADM2_EN",palette = "Reds")


tmap_mode("view")
tm_shape(map_and_data) + tm_polygons("Population_Density",id = "ADM2_EN",palette = "Reds")



#############division
map_dist <- st_read("")




################sunamganj dist
map <- st_read("bgd_admbnda_adm4_bbs_20180410/bgd_admbnda_adm4_bbs_20180410.shp")
map2 <- filter(map, ADM2_EN == "Sunamganj")
tm_shape(map2) + tm_polygons("ADM4_EN",id = "ADM4_EN", legend.show = F)



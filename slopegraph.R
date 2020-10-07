data <- data.frame(class = c(rep("Class A",2),rep("Class B",2),rep("Class C",2)), type = rep(c("x","y"),3), value = c(6,4,8,6,4,5))
ggplot(data, aes(x = data$type, y = data$value)) +
    geom_line(aes(group = class), color = "gray60") +
    geom_point(size = 6, color = "white")+
    geom_point(size = 4, color = "#0072B2")+
    theme_bw()+
    geom_text(
        data = subset(data, data$type == "y"),
        aes(x = rep(2,nrow(subset(data, data$type == "y")))+ 0.05, y = value + 0, label = class),
        family = "Myriad Pro",
        size = 10/.pt,
        hjust = 0)



###################################

reference
https://github.com/ovirahman/dataviz/blob/master/visualizing_associations.Rmd
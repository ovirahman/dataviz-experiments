x <- mtcars[order(mtcars$mpg),] # sort by mpg
x$cyl <- factor(x$cyl) # it must be a factor
x$color[x$cyl==4] <- "red"
x$color[x$cyl==6] <- "blue"
x$color[x$cyl==8] <- "darkgreen"
dotchart(x$mpg,labels=row.names(x),cex=.7,groups= x$cyl,
         main="Gas Milage for Car Models\ngrouped by cylinder",
         xlab="Miles Per Gallon", gcolor="black", color=x$color)



#############data covid


covid <- read.csv("covid.csv")
covid <- covid[order(covid$Total.No.of.Cases),]
covid$Division <- factor(covid$Division)
covid$color[covid$Division == "Dhaka"] <- "#C2263C"
covid$color[covid$Division == "Chattogram"] <- "#77C4D3"
covid$color[covid$Division == "Sylhet"] <- "#333745"

dotchart(covid$Total.No.of.Cases, labels = covid$District, color = covid$color, groups = covid$Division, pch = 19, pt.cex = 1.5)
points((covid$Total.No.of.Cases[covid$District == "Dhaka City"]),20, cex = 6, col = "#C2263C", lwd = 1)
title("Covid-19: Total Number of Confirmed Cases\n22.09.2020")
legend(75000, 33, legend = c("Chattogram", "Dhaka", "Sylhet"), col = unique(covid$color), cex = 0.8, pch = 19, box.lty = 2, pt.cex = 1.5)
axis(3,labels = F)


##log scale

dotchart(covid$Total.No.of.Cases, labels = covid$District, color = covid$color, groups = covid$Division, pch = 19, pt.cex = 1.5, log = "x", xaxt = "n")
marks <- c(1000,2000,5000,10000,20000,50000,90000)
axis(1,at=marks,labels=marks)
points((covid$Total.No.of.Cases[covid$District == "Dhaka City"]),20, cex = 6, col = "#C2263C", lwd = 1)
title("Covid-19: Total Number of Confirmed Cases\n22.09.2020")
legend(55000, 33, legend = c("Chattogram", "Dhaka", "Sylhet"), col = unique(covid$color), cex = 0.8, pch = 19, box.lty = 2, pt.cex = 1.5)




####################
source:
    https://www.statmethods.net/graphs/dot.html#:~:text=Create%20dotplots%20with%20the%20dotchart,color%20of%20the%20groups%20label.
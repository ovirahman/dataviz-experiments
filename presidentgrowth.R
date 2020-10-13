data <- data.frame(president  =  c("Truman","Eisenhower", "Kennedy", "Johnson","Nixon","Ford","Carter","Reagan","H.W. Bush","Clinton","W. Bush","Obama","Trump"), growth = c(9,4,4,12,9,2,10,16,3,23,1,12,-4))
data$president <- factor(data$president, levels = data$president)

par(bg = "wheat", mar = c(1,1,1,1))
bp <- barplot(data$growth~data$president, yaxt = "n",xaxt = "n",ylab = "",xlab = "",
              col = ifelse(data$growth<0, "red","steelblue"),
              ylim = c(-10,28))
#text(bp,0, data$growth, pos = 3, cex = 0.7)
#text(bp,data$growth, label = paste0(data$growth, "M"), pos = 3, cex = 0.9)
text(bp[data$growth>0],-0.3, label = paste0(data$growth[data$growth>0], "M"), 
     pos = 3, cex = 1.2, col = "white")
text(bp[data$growth<0],-1.4, label = paste0(data$growth[data$growth<0], "M"), 
     pos = 3, cex = 1.2, col = "white")
text(bp[data$growth>0],-1.8, label = data$president[data$growth>0], 
     pos = 3, cex = 1.3)
text(bp[data$growth<0],0, label = data$president[data$growth<0], 
     pos = 3, cex = 1.3)

#abline(h = 20, lty = 2, col = rgb(0,0,0,0.1))
text(1,20, label = "20 MILLION", cex = 1.3)
text(1,10, label = "10 MILLION" , cex = 1.3)
text(1,-5, label = "-5 MILLION" , cex = 1.3)
segments(1.5,20,16,20, lty = 2, col = rgb(0,0,0,0.3))
segments(1.5,10,16,10, lty = 2, col = rgb(0,0,0,0.3))
segments(1.5,-5,16,-5, lty = 2, col = rgb(0,0,0,0.3))

text(8,26, label = "Job growth by US president", cex = 2.5)
text(3,-8,label = "Source: Federal Reserve Bank of St. Louis, \"All Employees, Total Nonfarm\"(2020) via facebook.com/barackobama/", cex = 0.8)

par(bg = "white",mar = c(0,0,0,0))

plot(-10:10,-10:10, type = "n", asp = 1,
     xlim = c(-5,25),
     xaxt = "n", xlab = "", ylab = "", yaxt = "n", 
     las = T, 
     cex.axis = .8)

abline(v = seq(-10,30,1), h = seq(-15,15,1), lty = 2, col = "grey80")


axis(1,at = -15:30, labels = -15:30, cex.lab = .5, cex.axis = .8)
axis(2,at = -15:15, labels = -15:15, cex.lab = .5, cex.axis = .8, las = T)

###red
points(0,0, pch = 1, cex  = 10, col = "red", lwd = 8)

segments(0,-1.2,0,-4, col = "red", lwd = 8)


segments(0,-4,-2,-7, col = "red", lwd = 4)
segments(0,-4,2,-7, col = "red", lwd = 4)

segments(0,-4.5,-2,-7, col = "red", lwd = 4)
segments(0,-4.5,2,-7, col = "red", lwd = 4)



segments(0,-1.4,-2,-2, col = "red", lwd = 4)
segments(0,-1.4,2,0, col = "red", lwd = 4)

segments(0,-1.6,-2,-2, col = "red", lwd = 4)
segments(0,-1.6,2,0, col = "red", lwd = 4)




###blue 
points(16,0, pch = 1, cex  = 10, col = "steelblue", lwd = 8)
#segments(14,-15.1,14,-5)
segments(16,-1.2,16,-4, col = "steelblue", lwd = 8)


segments(16,-4,14,-7, col = "steelblue", lwd = 4)
segments(16,-4,18,-7, col = "steelblue", lwd = 4)

segments(16,-4.5,14,-7, col = "steelblue", lwd = 4)
segments(16,-4.5,18,-7, col = "steelblue", lwd = 4)


segments(16,-1.2,13,0, col = "steelblue", lwd = 4)
segments(16,-1.2,14,-2, col = "steelblue", lwd = 4)

segments(16,-1.4,13,0, col = "steelblue", lwd = 4)
segments(16,-1.4,14,-2, col = "steelblue", lwd = 4)


#dialogue
points(1.1,1.1, pch = 19, col = "grey70")
points(1.5,1.5, pch = 19, col = "grey70", cex = 2)
#points(2,2, pch = 19, col = "grey70", cex = 3)

rect(1,2,5,4, col = "grey60", border = NA)
text(3, 3, "Bonjour! Blue", col = "white", cex = 1.6)


points(15.5,1.5, pch = 19, col = "grey70")
points(15,2, pch = 19, col = "grey70", cex = 2)
points(14.5,2.5, pch = 19, col = "grey70", cex = 3)

rect(11,3,15,5, col = "grey60", border = NA)
text(13, 4, "Bonjour! Red", col = "white", cex = 1.6)




box(which = "plot",col = "#666666", lwd = 60)
#points(0,0, pch =19, cex = .3)


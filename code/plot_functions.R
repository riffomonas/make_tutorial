time_plot <- function(n, g, data){
	name_data <- subset(data, name == n & gender == g)

	median_year <- median(rep(name_data$year, round(name_data$alive)))

	clr <- ifelse(g=="M", "dodgerblue", "pink")

	par(mar=c(4,5,0.5,0.5))
	plot(NA, xlab="", ylab="", xlim=c(1900,2020), ylim=c(0, max(name_data$frequency)), axes=F)

	points(name_data$frequency~name_data$year, type="l", col="black", lwd=2)
	points(name_data$alive~name_data$year, type="h", col=clr, lwd=2)

	points(x=c(median_year, median_year), y=c(0,name_data[name_data$year==median_year, "alive"]), type="l", lwd=4, col=clr)

	axis(1)
	axis(2, las=2)
	box()

	legend("topright", legend=c("Born", "Alive"), lwd=2, lty=1, col=c("black", clr), bty="n")

	mtext(side=1, line=2.5, "Year")
	mtext(side=2, line=4, "Number of Individuals")
}

distro <- quantile(rep(name_data$year, round(name_data$alive)),
										probs=c(0.25,0.5,0.75))

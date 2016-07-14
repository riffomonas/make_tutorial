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

	text(x=1900, y=par()$usr[4]*0.95, label=n, cex=1.5, pos=4, font=2)
	legend("topright", legend=c("Born", "Alive"), lwd=2, lty=1, col=c("black", clr), bty="n")

	mtext(side=1, line=2.5, "Year")
	mtext(side=2, line=4, "Number of Individuals")
}


distro_plot <- function(n_vector, g_vector, age_vector, data){

	thick <- 0.15

	par(mar=c(4,6,0.5,0.5))

	plot(NA, xlim=c(0,100), ylim=c(1,length(n_vector)), xlab="", ylab="", axes=F)

	for(i in 1:length(n_vector)){

		clr <- ifelse(g_vector[i]=="M", "dodgerblue", "pink")

		name_data <- subset(data, name == n_vector[i] & gender == g_vector[i])
		distribution <- 2016-quantile(rep(name_data$year, round(name_data$alive)), probs=c(0.25, 0.5, 0.75))

		polygon(x=c(distribution[1], distribution[1], distribution[3], distribution[3]), y=c(i-thick, i+thick, i+thick, i-thick), col=clr)

		points(x=distribution[2], y=i, pch=19, col="black", cex=1)
		points(x=age_vector[i], y=i, pch=19, col="red")
	}

	axis(1)
	mtext(side=1, line=2.5, "Age")

	axis(2, at=1:length(n_vector), label=n_vector, las=2)
	box()

}

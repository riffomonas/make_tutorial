living_data <- read.csv("data/processed/alive_2016_annual.csv", header=T, stringsAsFactors=FALSE, row.names=1)

name_counts <- read.csv("data/processed/all_names.csv", header=T, stringsAsFactors=FALSE)

name_counts$alive <- NA
name_counts[name_counts$gender=="M", "alive"] <-
				living_data[as.character(name_counts[name_counts$gender=="M","year"]), "male_rate"] * name_counts[name_counts$gender=="M","frequency"]
name_counts[name_counts$gender=="F", "alive"] <-
				living_data[as.character(name_counts[name_counts$gender=="F","year"]), "female_rate"] * name_counts[name_counts$gender=="F","frequency"]


name_alive <- name_counts[!is.na(name_counts$alive),]
mary <- name_alive[name_alive$name == "Hillary" & name_alive$gender == "F",]

distribution <- quantile(rep(mary$year, round(mary$alive)), probs=c(0.25,0.5,0.75))

plot(mary$frequency~mary$year, type="l")
points(mary$alive~mary$year, type="h")

y_pos <- 0.5 * max(mary$alive)
segments(x0=distribution[1], x1=distribution[3], y0=y_pos, lwd=3)
points(x=distribution[2], y=y_pos, pch=19, cex=2)

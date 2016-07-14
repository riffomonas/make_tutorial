# This script takes the estimated fraction of people still alive in 2016 that
# were born in a given year and estimates the number of people alive in 2016
# with each name from each birth year. This step is a little slow. The files are
# outputted as data/processed/total_and_living_name_counts.csv.
#
# Probably want to come back and use dplyr to simplify processing.

living_data <- read.csv("data/processed/alive_2016_annual.csv", header=T, stringsAsFactors=FALSE, row.names=1)

name_counts <- read.csv("data/processed/all_names.csv", header=T, stringsAsFactors=FALSE)

name_counts$alive <- NA
name_counts[name_counts$gender=="M", "alive"] <-
				living_data[as.character(name_counts[name_counts$gender=="M","year"]), "male_rate"] * name_counts[name_counts$gender=="M","frequency"]
name_counts[name_counts$gender=="F", "alive"] <-
				living_data[as.character(name_counts[name_counts$gender=="F","year"]), "female_rate"] * name_counts[name_counts$gender=="F","frequency"]

name_alive <- name_counts[!is.na(name_counts$alive),]

write.table(file="data/processed/total_and_living_name_counts.csv", name_alive)

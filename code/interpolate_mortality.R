# The mortality data in data/raw/alive_2016_per_100k.csv was manually
# transcribed from http://www.ssa.gov/oact/NOTES/as120/LifeTables_Tbl_7.html.
# These data come out every decade, not annually. This script reads in those
# data and processes it to create a linear interpolation of the number and
# fraction of people still alive in 2016 that were born in a specific year. We
# assume that anyone born in 2016 is still alive.

require("zoo") # needed to get the interpolation function that fills in the
library("zoo") # NA values

# get SS mortality data
mortality_decade <- read.csv(file="data/raw/alive_2016_per_100k.csv", header=T, stringsAsFactors=FALSE)

# create data frame that will have data for each year.
mortality_annual <- data.frame(year=min(mortality_decade$year):2016,male=NA, female=NA)

# fill in the data that we have for the decadial information
mortality_annual[mortality_annual$year %in% mortality_decade$year,] <- mortality_decade

# assume that everyone born in 2016 is still alive
mortality_annual[mortality_annual$year == 2016,] <- c(2016, 100000,100000)

# run the linear interpolation
mortality_annual$male <- na.approx(mortality_annual$male)
mortality_annual$female <- na.approx(mortality_annual$female)

# generate the survival rates
mortality_annual$male_rate <- mortality_annual$male / 1e5
mortality_annual$female_rate <- mortality_annual$female / 1e5

write.table(file="data/processed/alive_2016_annual.csv", mortality_annual, row.names=FALSE, sep=',', quote=F)

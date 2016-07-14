#!/usr/bin/env bash

# Prepare annual baby name data report.
# Assumes:
#		*	the user is connected to the internet
#		* has R installed in their PATH
#		* has rmarkdown package installed

# Depends on: website data at https://www.ssa.gov/oact/babynames/names.zip
# Produces: slew of files named yob????.txt and a pdf file
wget --no-check-certificate -P data/raw/ https://www.ssa.gov/oact/babynames/names.zip
unzip -d data/raw/ data/raw/names.zip

# Concatenate the annual baby name data
# Depends on: data/raw/yob????.txt files
#							code/concatenate_files.R
# Producees:	data/processed/all_names.csv
R CMD BATCH code/concatenate_files.R

# Fills in missing data from annual survivorship data
# Depends on: data/raw/alive_2016_per_100k.csv.csv
#							code/interpolate_mortality.R
#	Produces:		data/processed/alive_2016_annual.csv
R CMD BATCH code/interpolate_mortality.R

# Generate counts of total and living people with each name
# Depends on:	data/processed/alive_2016_annual.csv
#							data/processed/all_names.csv
#							code/get_total_and_living_name_counts.R
#	Produces:		data/processed/total_and_living_name_counts.csv
R CMD BATCH code/get_total_and_living_name_counts.R


# Renders an Rmarkdown file that creates various plots  and
# provides an entertaining color commentary
# Depends on:	data/processed/total_and_living_name_counts.csv
#							code/plot_functions.R
# Produces:		family_report.html
R -e "library(rmarkdown); render('family_report.Rmd')"

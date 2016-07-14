# Baby name data is stored in a set of csv files, one per year, that contains
# the name, gender, and frequency. We need to concatenate the files into a
# single file that adds column headings and the year. Each file is stored in
# data/raw/ and is listed as `yob####.txt` where #### is the year, starting in
# 1880. The output file is data/processed/all_names.csv

make_year_data_frame <- function(file_name=x){

	file <- read.csv(file=file_name, header=F, stringsAsFactors=FALSE)
	year <- gsub(".*yob(\\d\\d\\d\\d).txt", "\\1", file_name)
	file$V4 <- year
	return(file)

}

name_files <- list.files(path='data/raw', pattern="yob.*.txt", full.names=TRUE)
name_data_frames <- lapply(name_files, make_year_data_frame)
merged_names <- do.call(rbind, name_data_frames)
colnames(merged_names) <- c("name", "gender", "frequency", "year")


# comment out the following two lines to get all names
kids <- c("Sarah", "Mary", "Patrick", "Joseph", "John", "Ruth", "Jacob", "Peter", "Martha")
merged_names <- merged_names[merged_names$name %in% kids,]

write.table(file="data/processed/all_names.csv", merged_names, sep=',',
						row.names=F, quote=F)

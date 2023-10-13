#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOVISUALIZATIONINR/1 EXPLORATORYDATAANALYSIS/INTROTOVISUALIZATIONINR EXPLORATORYDATAANALYSIS 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 11: Directory settings  ####

install.packages(box)
# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 12: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 14: Load the dataset for EDA  ####

# Read CSV file called "healthcare-dataset-stroke-data.csv"
health_data = read.csv(file = file.path(data_dir,"healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors


#=================================================-
#### Slide 16: View data types  ####

str(health_data)


#=================================================-
#### Slide 17: Impute missing data  ####

# Convert BMI to numeric
health_data$bmi <- as.numeric(health_data$bmi)
# Replace N/A's in BMI column with mean
health_data$bmi[is.na(health_data$bmi)] <- mean(health_data$bmi,na.rm=TRUE)
# Display data
str(health_data)


#=================================================-
#### Slide 18: Subsetting data  ####

health_subset <- health_data[, c("age", "avg_glucose_level", "bmi")]
str(health_subset)


#=================================================-
#### Slide 19: Correlation between variables  ####

# Compute a correlation matrix of 3 variables using `cor` function.
health_cor = cor(health_subset)
health_cor


#=================================================-
#### Slide 21: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

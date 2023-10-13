#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/3 SUMMARYDATAVISUALIZATION/INTERATIVEVISUALIZATIONWITHR SUMMARYDATAVISUALIZATION 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 11: Directory settings  ####

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
#### Slide 13: Load packages  ####

library(htmlwidgets)
library(tidyverse)
library(highcharter)
library(broom)
library(dplyr)
library(visNetwork)


#=================================================-
#### Slide 14: Loading HDS dataset  ####

# Read CSV file called "healthcare-dataset-stroke-data.csv"
HDS = read.csv(file = file.path(data_dir,"/healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors
# we can use unique() and sum(is.na()) function to know about NA values
HDS$bmi <- as.numeric(as.character(HDS$bmi))
# NA imputation
HDS$bmi[is.na(HDS$bmi)]<-mean(HDS$bmi,na.rm=TRUE)
# Let's make a vector of column indices we would like to save.
column_ids= select(HDS, age,bmi,avg_glucose_level)
HDS_subset = column_ids


#=================================================-
#### Slide 15: Building compound plots  ####

# Function to normalize data between 0 and 1. 
normalize <- function(x) 
{return ((x - min(x, na.rm = TRUE))/
           (max(x, na.rm = TRUE) -
              min(x, na.rm = TRUE)))}

HDS_subset$age <- normalize(HDS_subset$age)
HDS_subset$bmi <- normalize(HDS_subset$bmi)
HDS_subset$avg_glucose_level <- normalize(HDS_subset$avg_glucose_level)


#=================================================-
#### Slide 19: Layered density plot  ####

layered_density_interactive


#=================================================-
#### Slide 23: Exercise   ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

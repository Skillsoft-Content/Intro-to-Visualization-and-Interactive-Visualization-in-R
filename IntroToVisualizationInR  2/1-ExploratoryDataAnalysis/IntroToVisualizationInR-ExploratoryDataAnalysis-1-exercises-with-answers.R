#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOVISUALIZATIONINR/1 EXPLORATORYDATAANALYSIS/INTROTOVISUALIZATIONINR EXPLORATORYDATAANALYSIS 1 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise ####
# =================================================-

#### Please refer to module 1 of IntroToVisualizationInR-ExploratoryDataAnalysis for Tasks 1-2
#### Task 1 ####

# Define the directory if you haven't already.
# Read the heart_failure_clinical_records_dataset.csv into a dataset named "heart_data". 
# This dataset contains person's information like age ,sex , blood pressure, smoke, diabetes,ejection fraction, creatinine phosphokinase, serum_creatinine, serum_sodium, time and their DEATH EVENT
# Set both the header and stringsAsFactors as equal to TRUE. 
# Subset the data set to be named "heart_data_subset" and include columns 1,3,7,8 & 9 i.e. "age", "creatinine_phosphokinase", "platelets", "serum_creatinine" & "serum_sodium"

# Result: 

path = box::file()
parent_dir = dirname(dirname(path))
main_dir = dirname(parent_dir)

data_dir = paste0(main_dir, "/data")
plot_dir = paste0(main_dir, "/plots")



heart_data = read.csv(file = file.path(data_dir, "heart_failure_clinical_records_dataset.csv"), header = TRUE, stringsAsFactors = TRUE)
head(heart_data)

column_ids = c(1,3,7,8,9) #<- creates a list of column ids and assigns that list to a variable
column_ids

heart_data_subset = heart_data[ , column_ids] #<- uses that variable to subset the dataset
head(heart_data_subset)

#================================================-

#### Task 2 ####

# Create a correlation matrix for the `heart_data_subset`

# Result: 
heart_cor = cor(heart_data_subset) #<- Compute a correlation matrix using `cor` function.
View(heart_cor)




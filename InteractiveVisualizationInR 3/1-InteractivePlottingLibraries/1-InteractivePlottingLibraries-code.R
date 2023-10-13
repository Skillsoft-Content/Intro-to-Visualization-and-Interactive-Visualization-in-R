#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/1 INTERACTIVEPLOTTINGLIBRARIES/INTERATIVEVISUALIZATIONWITHR INTERACTIVEPLOTTINGLIBRARIES 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 5: Installing `highcharter`  ####

# Install `highcharter` package.
install.packages("highcharter")

# Load the library.
library(highcharter)

# View documentation.
library(help = "highcharter")


#=================================================-
#### Slide 6: Using `highchart()` function  ####

?highchart


#=================================================-
#### Slide 7: `hchart()` vs `highchart()`  ####

?hchart

hchart(Some_data,       #<- dataset to use
       "plot_type",     #<- plot type to use
       hcaes(x = variable1, #<- x-axis mapping 
             y = variable2, #<- y-axis mapping 
             group = variable3, #<- group by
             ...))              


#=================================================-
#### Slide 10: Directory settings  ####

# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 11: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 13: Load HDS dataset  ####

# Read CSV file called "healthcare-dataset-stroke-data.csv"
HDS = read.csv(file = file.path(data_dir,"/healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors


#=================================================-
#### Slide 15: Prepare Data  ####

HDS$bmi <- as.numeric(as.character(HDS$bmi)) ##converting bmi column to numeric
# NA imputation
# we can use is.na() function to know about NA values
HDS$bmi[is.na(HDS$bmi)]<-mean(HDS$bmi,na.rm=TRUE) # Replacing na values of bmi column with it's mean bmi



#=================================================-
#### Slide 16: Prepare Data  ####

library(tidyverse)
# Now Let's make a vector of column indices we would like to save.

column_ids = select(HDS, age,bmi,avg_glucose_level,stroke)
HDS_subset = column_ids


#=================================================-
#### Slide 17: Create a subset  ####

# Prep data for scatterplot

HDS_subset_long = HDS_subset %>%
  gather(-age, #<- gather all variables but `age`
         key = "variable",                            
         value = "value") %>%                         
  # All other transformations we've done before.
  group_by(variable) %>%
  mutate(norm_value = value/mean(value, na.rm = TRUE))

head(HDS_subset_long)


#=================================================-
#### Slide 18: Construct a scatterplot using `hchart`  ####

# Construct an interactive scatterplot.
scatter_interactive =              #<- name the plot   
  hchart(HDS_subset_long,         #<- set data
         "scatter",                #<- plot type "scatter"
          hcaes(x = norm_value,    #<- set aesthetics to map x-axis
                y = age,         #<- set aesthetics to map y-axis
                group = variable)) #<- group by



#=================================================-
#### Slide 19: Construct a scatterplot using `hchart` (cont'd)  ####

scatter_interactive


#=================================================-
#### Slide 21: Customizing plots with the pipe operator  ####

# Pipe chart options to original chart.

scatter_interactive = scatter_interactive %>%
  # Use chart options to specify zoom.
  hc_chart(zoomType = "xy") 

scatter_interactive


#=================================================-
#### Slide 22: Adding a title  ####

# Pipe chart options to original chart.
scatter_interactive = scatter_interactive %>%
 # Add title to the plot.
 hc_title(text = "HDS data: Age vs. other variables")

scatter_interactive


#=================================================-
#### Slide 24: Exercise   ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

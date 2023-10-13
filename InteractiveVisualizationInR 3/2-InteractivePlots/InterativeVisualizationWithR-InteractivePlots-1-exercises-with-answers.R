#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/2 INTERACTIVEPLOTS/INTERATIVEVISUALIZATIONWITHR INTERACTIVEPLOTS 1 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise  ####
# =================================================-

#### Please refer to module 1 of Interactive Visualization With R - Interactive Plots for tasks 1-9

#### Task 1 ####

# Load the necessary libraries and define the directory settings.
# Read in "heart_failure_clinical_records_dataset.csv" to a data frame `clinical_records`.
# Create a new subset from `clinical_records` named `clinical_records_sub`, 
# Select only `age`, 'creatinine_phosphokinase', 'ejection_fraction', 'platelets', 'serum creatinine', 'serum sodium' and 'death_event'. 


# Result:
library(tidyverse)
library(highcharter)

path = box::file()
parent_dir = dirname(dirname(path))
main_dir = dirname(parent_dir)

data_dir = paste0(main_dir, "/data")
plot_dir = paste0(main_dir, "/plots")

clinical_records = read.csv(file = file.path(data_dir, "/heart_failure_clinical_records_dataset.csv"), header = TRUE, stringsAsFactors = TRUE)

clinical_records_sub = clinical_records %>%
  select(-anaemia, -diabetes, -high_blood_pressure, -sex, -smoking, -time, -id) 

#================================================-
#### Task 2 ####

# Create a scatterplot of normalized clinical records by age.
# Convert `clinical_records_sub` into a long dataset `clinical_records_sub_long`
# and normalize the clinical record values.
# Explicitly exclude `age` from gather.
# Use the group_by & mutate statements to normalize the values, using the MEAN to normalize.
# Check the top of clinical_records_sub_long to confirm you have four columns. 
# What are those column names?
# Result: Age, variable, value, norm_value

clinical_records_sub_long = clinical_records_sub %>%
  gather(-age, #<- gather all variables but `age`
         key = "variable",                   #<-   set key to `variable`
         value = "value")%>%
  group_by(variable) %>%
  mutate(norm_value = value/mean(value, na.rm = TRUE))

head(clinical_records_sub_long)

#================================================-
#### Task 3 ####

# Create boxplot using `clinical_records_sub_long` with the function `hchart()`.
# Save it as `ff_bp_interactive`.

# Result:
ff_bp_interactive =  
  hcboxplot(x = clinical_records_sub_long$norm_value,
            var = clinical_records_sub_long$variable,
            name = "Normalized value")

ff_bp_interactive

#================================================-
#### Task 4 ####

# Enhance the boxplot options using `hc_plotOptions` to color each box plot.
# Add the title "Clinical Records Data Boxplot" to the plot.
# View the plot.

# Result:

# Enhance original boxplot with some options.
ff_bp_interactive = ff_bp_interactive %>% 
  hc_plotOptions(                #<- plot options
    boxplot = list(              #<- for boxplot 
      colorByPoint = TRUE)) %>%  #<- color each box
  hc_title(text = "Clinical Records Data Boxplot")

ff_bp_interactive



#================================================-
#### Task 5 ####

# Create a version of `clinical_records_sub`, named `clinical_records_sub2`, 
# and make sure it has dropped all rows with NA values. 
# Save the output of `summary(clinical_records_sub2)` to `clinical_summary` and a data frame object.
# Then inspect `clinical_summary`.
# Remove `Var1` from `clinical_summary` and rename the remaining columns to be "Variable" and "Summary".
# Inspect `clinical_summary` after you make those changes.

# Result: 

clinical_records_sub2 = drop_na(clinical_records_sub)

clinical_summary = summary(clinical_records_sub2)

clinical_summary = as.data.frame(clinical_summary)

head(clinical_summary)

clinical_summary$Var1 = NULL

colnames(clinical_summary) = c("Variable", "Summary")

head(clinical_summary)


#================================================-
#### Task 6 ####

# Replicate the transformation used in the class slides to separate 
# the `Summary` column into two different columns.
# You want the statistic and the value to be in different columns.
# And convert the applicable data to numeric, rather than character.
# What separator will you use to split the column into two?
# Use `subset` to retain only values that are not NA.

# Result:

clinical_summary = clinical_summary %>%          #<- set original data 
  separate(Summary,                        #<- separate `Summary` variable 
           into = c("Statistic", "Value"), #<- into 2 columns: `Statistic`, `Value`
           sep = ":",                      #<- set separating character
           convert = TRUE)                 #<- where applicable convert data (to numeric)

clinical_summary = subset(clinical_summary, !is.na(Value))

#================================================-
#### Task 7 ####

# Construct the summary chart `clinical_summary_interactive` using `hchart`.
# Add the setting to share tooltip and add the title as "Clinical data summary".
# View `clinical_summary_interactive`.

# Result: 

clinical_summary_interactive = 
  hchart(clinical_summary,           #<- set data
         "column",                #<- set type (`column` in highcharts)
         hcaes(x = Statistic,     #<- arrange `Statistics` across x-axis
               y = Value,         #<- map `Value` of each `Statistic` to y-axis
               group = Variable)) #<- group columns by `Variable`

clinical_summary_interactive


clinical_summary_interactive = clinical_summary_interactive %>% 
  hc_tooltip(shared = TRUE) %>%
  hc_title(text = "Clinical data summary")

clinical_summary_interactive

#================================================-
#### Task 8 ####

# Create a correlation matrix, named cor_matrix2, that includes all columns of `clinical_records_sub2` except age.
# Plot `cor_matrix2` using hchart and assign it to `correlation_interactive2`.

# Result:
cor_matrix2 = cor(clinical_records_sub2[, 2:7])
correlation_interactive2 = hchart(cor_matrix2) %>%
  hc_title(text = "Clinical Records Data Correlation")

correlation_interactive2

#================================================-
#### Task 9 ####

# Load the `htmlwidgets` package.
# Using `saveWidget` command, save the correlation plot to `plot_dir`.
# Save the widget with the name "interactive_correlation_plot.html".

# Result:

setwd(plot_dir)
library(htmlwidgets)


saveWidget(correlation_interactive2,            #<- plot object to save
           "interactive_correlation_plot.html",    #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
#   all necessary files and scripts are embedded 
#   into the HTML file itself  




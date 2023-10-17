#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/3 SUMMARYDATAVISUALIZATION/INTERATIVEVISUALIZATIONWITHR SUMMARYDATAVISUALIZATION 1 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise  ####
# =================================================-


#### Please refer to module 1 of Interactive Visualization With R - Summary Data Visualization for tasks 1-2
#### Task 1 ####

# Set up data:
# Confirm your working directory and make sure it is set to `data_dir`.
# Load the `tidyverse` and `highcharter` packages. 
# Read in "heart_failure_clinical_records_dataset.csv" to a data frame `clinical_records`.
# Select only the variables 'platelets', `serum_sodium`, and 'serum_creatinine'  from 'clinical_records', and name it `clinical_records_sub`.
# Normalize the data with the function given in class slides.
# normalize <- function(x) 
#             {return ((x - min(x, na.rm = TRUE))/
#                      (max(x, na.rm = TRUE) -
#                       min(x, na.rm = TRUE)))}

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
  select(platelets, serum_sodium, serum_creatinine)

clinical_records_sub$platelets <- normalize(clinical_records_sub$platelets)
clinical_records_sub$serum_sodium <- normalize(clinical_records_sub$serum_sodium)
clinical_records_sub$serum_creatinine <- normalize(clinical_records_sub$serum_creatinine)


#================================================-
#### Task 2 ####

# Create a layered density plot 'ff_layered_density_interactive' of platelets', `serum_sodium`, and 'serum_creatinine'
# using the hc_add_series() function.
# Add a vertical line for the mean of each of the three variables and set its color to "red".
# Label the vertical lines as 'platelets_avg', `serum_sodium_avg`, and 'serum_creatinine_avg', respectively.
# Add the setting that the tooltip is shared to 'ff_layered_density_interactive'.
# Then add the title "Clinical records data: density and average of select variables".

# Result:

ff_layered_density_interactive = highchart() %>%
  hc_chart(type = "area") %>%
  hc_add_series(data = density(clinical_records_sub$platelets),
                name = "Platelets") %>%
  hc_add_series(data = density(clinical_records_sub$serum_sodium),
                name = "Serum_sodium") %>%
  hc_add_series(data = density(clinical_records_sub$serum_creatinine),
                name = "Serum_creatinine") %>%
  hc_xAxis(plotLines = list(
    list(label = list(text = "Platelets avg."),
         width = 2,
         color = "red",
         value = mean(clinical_records_sub$platelets)),
    list(label = list(text = "Serum sodium avg."),
         width = 2,
         color = "red",
         value = mean(clinical_records_sub$serum_sodium)),
    list(label = list(text = "Serum creatinine avg."),
         width = 2,
         color = "red",
         value = mean(clinical_records_sub$serum_creatinine)))) %>%
  hc_tooltip(crosshairs = TRUE) %>%
  hc_title(text = "Clinical records data: density and average of select variables")

ff_layered_density_interactive





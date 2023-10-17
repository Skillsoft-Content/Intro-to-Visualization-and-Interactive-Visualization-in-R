#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## INTERACTIVEVISUALIZATIONINR/1 INTERACTIVEPLOTTINGLIBRARIES/INTERATIVEVISUALIZATIONWITHR INTERACTIVEPLOTTINGLIBRARIES 1 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise  ####

# =================================================-





#### Please refer to module 1 of Interactive Visualization With R - Interactive Plotting Libraries for tasks 1-4

#### Task 1 ####



# Load the `tidyverse` and `highcharter` packages. 

# Define the directory settings.

# Read in "heart_failure_clinical_records_dataset.csv" to a data frame `clinical_records`.

# Create a new subset from `clinical_records` named `clinical_records_sub`. 

# Select only `age`, 'creatinine_phosphokinase', 'ejection_fraction', 'platelets', 'serum creatinine', 'serum sodium', and 'death_event'.



# Result:











#================================================-

#### Task 2 ####



# Create a scatterplot of normalized clinical records by age.

# Convert `clinical_records_sub` into a long dataset `clinical_records_sub_long`

# and normalize the clinical record values.

# Explicitly exclude `age` from gather.

# Use the group_by & mutate statements to normalize the values, using the MEAN to normalize.

# Check the top of clinical_records_sub_long to confirm you have four columns. What are the names of those columns?

# Result: Age, variable, value, norm_value







#================================================-

#### Task 3 ####



# Create a scatterplot named ff_inter_scatter using hchart. 

# Plot the normalized values against `age` and set the group as variable.

# View `ff_inter_scatter`.



# Result:







#================================================-

#### Task 4 ####



# Use `hc_chart` to specify "xy" zoom for `ff_inter_scatter`.

# Add the title "Clinical records data scatterplot" to the plot.

# Do you notice any patterns in `death_event` values by looking at the scatterplot?

# If so, describe what you see and try to interpret it.



# Result:





# The `death_event` variable has a very distinct pattern, it seems like there are few 

# unique values present in this variable, which leads us to a conclusion that

# even though the data is encoded as numeric it is actually categorical data.

# Uncovering patterns like this is exactly why we should do EDA and plot our data

# before running any analyses as it may affect the output of our algorithms and models.









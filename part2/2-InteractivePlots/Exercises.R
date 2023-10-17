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







#================================================-

#### Task 3 ####



# Create boxplot using `clinical_records_sub_long` with the function `hchart()`.

# Save it as `ff_bp_interactive`.



# Result:





#================================================-

#### Task 4 ####



# Enhance the boxplot options using `hc_plotOptions` to color each box plot.

# Add the title "Clinical Records Data Boxplot" to the plot.

# View the plot.



# Result:



# Enhance original boxplot with some options.









#================================================-

#### Task 5 ####



# Create a version of `clinical_records_sub`, named `clinical_records_sub2`, 

# and make sure it has dropped all rows with NA values. 

# Save the output of `summary(clinical_records_sub2)` to `clinical_summary` and a data frame object.

# Then inspect `clinical_summary`.

# Remove `Var1` from `clinical_summary` and rename the remaining columns to be "Variable" and "Summary".

# Inspect `clinical_summary` after you make those changes.



# Result: 



















#================================================-

#### Task 6 ####



# Replicate the transformation used in the class slides to separate 

# the `Summary` column into two different columns.

# You want the statistic and the value to be in different columns.

# And convert the applicable data to numeric, rather than character.

# What separator will you use to split the column into two?

# Use `subset` to retain only values that are not NA.



# Result:







#================================================-

#### Task 7 ####



# Construct the summary chart `clinical_summary_interactive` using `hchart`.

# Add the setting to share tooltip and add the title as "Clinical data summary".

# View `clinical_summary_interactive`.



# Result: 













#================================================-

#### Task 8 ####



# Create a correlation matrix, named cor_matrix2, that includes all columns of `clinical_records_sub2` except age.

# Plot `cor_matrix2` using hchart and assign it to `correlation_interactive2`.



# Result:





#================================================-

#### Task 9 ####



# Load the `htmlwidgets` package.

# Using `saveWidget` command, save the correlation plot to `plot_dir`.

# Save the widget with the name "interactive_correlation_plot.html".



# Result:







#   all necessary files and scripts are embedded 

#   into the HTML file itself  







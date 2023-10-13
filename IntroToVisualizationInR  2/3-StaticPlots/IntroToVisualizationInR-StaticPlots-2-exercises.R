#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## INTROTOVISUALIZATIONINR/3 STATICPLOTS/INTROTOVISUALIZATIONINR STATICPLOTS 2 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise ####

# =================================================-





#### Please refer to module 1 of 'Intro To Visualization In R - Static Plots' for tasks 1-7



#### Task 1 ####



# Define the directory if you haven't already.

# Read the heart_failure_clinical_records_dataset.csv into a dataset named "heart_data". 

# This dataset contains a person's information like age, sex, blood pressure, smoke, diabetes, ejection fraction, creatinine phosphokinase, serum_creatinine, serum_sodium, time and their DEATH EVENT.

# Set both the header and strings as factors equal to TRUE. 

# Subset the data set to be named "heart_data_subset" and include columns 1,3,7,8 & 9 i.e., "age", "creatinine_phosphokinase", "platelets", "serum_creatinine" & "serum_sodium".



# Result: 



















#================================================-

#### Task 2 ####



# Load the `ggplot2` package.

# Create a dataset named `heart_data_num` consisting of only the numeric variables from heart_data_subset (if not numeric datatype).





# Result: 





#================================================-

#### Task 3 ####



# Begin to create the foundation of a plot by executing ggplot on heart_data_num without any specification added yet as to what type of plot it will be.

# Set x to serum_sodium. 

# Assign ggplot's output to the variable ffplot1.



# Result:



#================================================-

#### Task 4 ####

# Specify that the plot is going to be a histogram by adding geom_histogram() to ffplot1 to see the plotted histogram.



# Result:



#================================================-

#### Task 5 ####

# Modify the histogram within its specifications to make it a density plot, and set the bin width to 10.

# Enhance the histogram by setting the outline color to "salmon2" and the fill color to "salmon3".



# Result:



#================================================-

#### Task 6 ####

# Create a new density plot object and add it to ffplot1. Then save ffplot1.

# Hint: ?geom_density

# Specify that the density plot should have a 20% opaque gray fill and a steelblue border.



# Result:







#================================================-

#### Task 7 ####

# Specify what size text you want on the plot labels by adding theme_bw() to ffplot1. 

# Set the axis title text to size 22 and the axis text to size 18.

# Save the theme to ff_theme.



# Result:





#### Please refer to module 2 of 'Intro To Visualization In R - Static Plots' for tasks 8-16



#================================================-

#### Task 8 ####



# Load the `tidyverse` package.

# Create a new subset from `heart_data_num`, named `heart_data_sub`.

# Select all columns except platelets & creatinine_phosphokinase.

# Drop the rows with missing values.



# Transform `heart_data_sub` to a long dataset `heart_data_long`.

# Gather them using `key` and `value`.

# Make sure to check the data afterwards.



# Result:











#================================================-

#### Task 9 ####



# Create a base boxplot of `heart_data_long` and save it as `ffboxplot`.

# Update the aesthetics of the box plot by filling the boxplot with color, 

# but make sure a legend for color is not included in the plot.



# Result:



#================================================-

#### Task 10 ####



# Update `ffboxplot` by highlighting the outliers. Make them red and size 3.

# Add a title "Heart Data" and subtitle "Boxplot" to the plot.



# Result:





#================================================-

#### BONUS ####



#### Task 11 ####



# Normalize the values for all variables in `heart_data_long`.

# Remove NA's while normalizing with the maximum value.

# Create a boxplot with normalized data.

# Highlight outliers and add a title and subtitle as in task 10.



# Result:







#================================================-

#### Task 12 ####



# Now build scatterplots with platelets vs. the rest of the columns in the `heart_data_num`.

# Convert `heart_data_num` into a long dataset `heart_subset_long2`

# Normalize all the components.

# Explicitly exclude `platelets` from the `gather` statement.

# Then use the group_by & mutate statements to normalize the values, using the MEAN to normalize.







#================================================-

#### Task 13 ####



# Create a base plot with `heart_subset_long2` and call it `base_norm_plot`.

# Make sure to use the normalized values on the x-axis and platelets on the y-axis.

# Add a scatterplot layer to `base_norm_plot` with point size = 1.5 and 50% opacity. Save it as `scatter_norm`.



# Result:





#================================================-

#### Task 14 ####



# Add a 2d geom_density layer to `scatter_norm` and save it as `scatter_norm`.

# Split the scatterplots into different facets for each variable using `facet_wrap` and display in 2 rows.



# Result:





#================================================-

#### Task 15 ####



# Add a built-in theme `theme_light()` to the scatterplots.

# Remove the redundant legend.

# Finally, add title Heart Data : Platelets vs. Other variables" and, 

# subtitle "2D distribution of scaled data" to the plots.

# View the updated plot.

# Result:







#================================================-

#### Task 16 ####



# Set working directory to where you want to save plots.

# Use `pdf()` function to save `ffboxplot` from Exercise 1 and `scatter_norm` from Exercise 2.

# Save the plots as "ggplot_visualizations.pdf".

# Set `width = 12` and `height = 7`.

# Clear graphics device after saving your plots.

# Open your plots directory and check the saved plots.

# Result:















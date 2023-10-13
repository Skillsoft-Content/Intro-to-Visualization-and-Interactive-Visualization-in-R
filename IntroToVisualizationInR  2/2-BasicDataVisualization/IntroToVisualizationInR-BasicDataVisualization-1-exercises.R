#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## INTROTOVISUALIZATIONINR/2 BASICDATAVISUALIZATION/INTROTOVISUALIZATIONINR BASICDATAVISUALIZATION 1 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise ####

# =================================================-





#### Please refer to module 1 of Intro To Visualization In R - Basic Visualization for tasks 1-8



#### Task 1 ####



# Define the directory if you haven't already.

# Read the heart_failure_clinical_records_dataset.csv into a dataset named "heart_data". 

# This dataset contains a person's information like age, sex, blood pressure, smoke, diabetes, ejection fraction, creatinine phosphokinase, serum_creatinine, serum_sodium, time and their DEATH EVENT.

# Set both the header and strings as factors equal to TRUE. 

# Subset the data set to be named "heart_data_subset" and include columns 1,3,7,8 & 9 i.e., "age", "creatinine_phosphokinase", "platelets", "serum_creatinine" & "serum_sodium".



# Result: 















#================================================-



#### Task 2 ####



# Create a dataset named `heart_data_num`, consisting of only the numeric variables from heart_data_subset.

# Then retrieve the number of columns from `heart_data_num` and store it in the variable `num_col`.

# Sample `num_col` number of colors from `colors` and store it in `color_sam`. 

# Make sure to set the seed to 2 before sampling.

# What four colors did the sample choose?



# Result: 











#================================================-

#### Task 3 ####



# Make a boxplot of the variables in `heart_data_num` using the colors stored in `color_sam`. 

# Which variable has the widest range?

# Note: To avoid the "Error in plot.new() : figure margins too large" - make sure you change the dimensions or maximize the plots window.



# Result: 









#================================================-

#### Task 4 ####



# Create a 2x2 grid of histograms of any 4 variables in `heart_data_num`, using colors in `color_sam`.

# Create appropriate labels and title for each.



# Result:







#================================================-

#### Task 5 ####



# Reset your layout to 1x1 grid using `par(mfrow=c(1,1))`.

# Begin with plotting age against platelets and have age on the x-axis and platelets on the y-axis.

# Please use the column index to specify the variables. 

# Create appropriate labels for the x and y axis and title.

# Fill in with triangle symbol and at scale 1 in the color "salmon2".



# Result:





#================================================-

#### Task 6 ####

# Create a scatterplot matrix of all the variables in the heart_data_num with symbol +.

# Choose random color from colors() and set the color of the points each time the plot is generated.



# Result:





#================================================-

#### Task 7 ####

# To find the correlation coefficient between the variables in heart_data_num, execute `cor` on the heart_data_num data set, making sure to tell it to use columns 1:4. 

# Assign the output to a variable named "heart_data__cor". View the output of heart_data_cor. 

# What is the correlation between platelets and age?

# Is there a strong or weak correlation between platelets and age?



# Result:







#================================================-

#### Task 8 ####

# Visualize the correlation matrix using corrplot in the three ways demonstrated in class: with circles, coefficient values, and as pie wedges.

# Use the documentation within corrplot to make another corrplot using a method we did not show in class.

# Which two variables are the least correlated?

# Hint: use ?corrplot for assistance.



# Result:







# use method = pie for easy visualisation







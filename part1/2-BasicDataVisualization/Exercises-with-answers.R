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

# Create a dataset named `heart_data_num`, consisting of only the numeric variables from heart_data_subset.
# Then retrieve the number of columns from `heart_data_num` and store it in the variable `num_col`.
# Sample `num_col` number of colors from `colors` and store it in `color_sam`. 
# Make sure to set the seed to 2 before sampling.
# What four colors did the sample choose?

# Result: 

heart_data_num = heart_data_subset[sapply(heart_data_subset, is.numeric)] #<- uses is.numeric to check / subset only numeric columns
heart_data_num

num_col = ncol(heart_data_num)
num_col

set.seed(2)
color_sam = sample(colors(), #<- vector of colors
                   num_col)  #<- n elements to sample 
color_sam

# Answer: Individual colors will vary, but there should be 4 colors (one for each column in num_col). My answer was "lightgray"      "lavenderblush4" "grey12"         "grey88"     &    "gray51"  

#================================================-
#### Task 3 ####

# Make a boxplot of the variables in `heart_data_num` using the colors stored in `color_sam`. 
# Which variable has the widest range?
# Note: To avoid the "Error in plot.new() : figure margins too large" - make sure you change the dimensions or maximize the plots window.

# Result: 
boxplot(heart_data_num, col = color_sam) 


# Answer: platelets


#================================================-
#### Task 4 ####

# Create a 2x2 grid of histograms of any 4 variables in `heart_data_num`, using colors in `color_sam`.
# Create appropriate labels and title for each.

# Result:

par(mfrow = c(2, 2))
hist(heart_data_num$age,  
     col = color_sam[1], 
     xlab = "Age",   
     main = "Distribution of Age ")
hist(heart_data_num$creatinine_phosphokinase,  
     col = color_sam[2],
     xlab = "creatinine_phosphokinase",   
     main = "Distribution of creatinine_phosphokinase")
hist(heart_data_num$platelets,  
     col = color_sam[3],
     xlab = "platelets",   
     main = "Distribution of platelets")
hist(heart_data_num$serum_creatinine,  
     col = color_sam[4],
     xlab = "serum_creatinine",   
     main = "Distribution of serum_creatinine")


#================================================-
#### Task 5 ####

# Reset your layout to 1x1 grid using `par(mfrow=c(1,1))`.
# Begin with plotting age against platelets and have age on the x-axis and platelets on the y-axis.
# Please use the column index to specify the variables. 
# Create appropriate labels for the x and y axis and title.
# Fill in with triangle symbol and at scale 1 in the color "salmon2".

# Result:
par(mfrow=c(1,1))
plot(heart_data_num$age, 
     heart_data_num$platelets,
     xlab = "Age",
     ylab = "Platelets count",
     main = "Age vs Platelets",
     pch = 17,   #<- type of symbol to use
     cex = 1,   #<- scale of the point
     col = "salmon2")


#================================================-
#### Task 6 ####
# Create a scatterplot matrix of all the variables in the heart_data_num with symbol +.
# Choose random color from colors() and set the color of the points each time the plot is generated.

# Result:
pairs(heart_data_num, 
      pch = 3,
      col = sample(colors(), 1)) #<- uses sample to pick one color from colors()


#================================================-
#### Task 7 ####
# To find the correlation coefficient between the variables in heart_data_num, execute `cor` on the heart_data_num data set, making sure to tell it to use columns 1:4. 
# Assign the output to a variable named "heart_data__cor". View the output of heart_data_cor. 
# What is the correlation between platelets and age?
# Is there a strong or weak correlation between platelets and age?

# Result:

heart_data_cor = cor(heart_data_num[, 1:4])
View(heart_data_cor)

# Answer: -0.05235437, a weak correlation.

#================================================-
#### Task 8 ####
# Visualize the correlation matrix using corrplot in the three ways demonstrated in class: with circles, coefficient values, and as pie wedges.
# Use the documentation within corrplot to make another corrplot using a method we did not show in class.
# Which two variables are the least correlated?
# Hint: use ?corrplot for assistance.

# Result:
library(corrplot)

corrplot(heart_data_cor)
corrplot(heart_data_cor, method = "number")
corrplot(heart_data_cor, method = "pie")

corrplot(heart_data_cor, method = "shade")
corrplot(heart_data_cor, method = "ellipse")

# Answer: creatinine_phosphokinase & serum_creatinine are the least correlated
# use method = pie for easy visualisation




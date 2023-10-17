#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOVISUALIZATIONINR/2 BASICDATAVISUALIZATION/INTROTOVISUALIZATIONINR BASICDATAVISUALIZATION 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 5: Directory settings  ####

# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 6: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 9: Load the dataset  ####

# Read CSV file called "healthcare-dataset-stroke-data.csv"
health_data = read.csv(file = file.path(data_dir,"healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors



#=================================================-
#### Slide 10: View data types  ####

str(health_data)


#=================================================-
#### Slide 11: Impute missing data  ####

# Convert BMI to numeric
health_data$bmi <- as.numeric(health_data$bmi)
# Replace N/A's in BMI column with mean
health_data$bmi[is.na(health_data$bmi)] <- mean(health_data$bmi,na.rm=TRUE)
str(health_data)


#=================================================-
#### Slide 13: Univariate plots: line plot (cont'd)  ####

# Line plot.
plot(health_data$bmi,
     type = "o",
     col = "orange",
     main = "bmi")


#=================================================-
#### Slide 14: Univariate plots: boxplot  ####

# bmi summary.
summary(health_data$bmi)


#=================================================-
#### Slide 15: Univariate plots: boxplot  ####


# Univariate plot: box-and-whisker plot.
boxplot(health_data$bmi)


#=================================================-
#### Slide 16: Univariate plots: boxplot (cont'd)  ####

# Customize your boxplot.
boxplot(health_data$bmi,
        col = "orange") #<- set color

# Customize your boxplot
boxplot(health_data$bmi,
        col = "orange",
        main = "BMI Boxplot") #<- add title


#=================================================-
#### Slide 17: R base colors  ####

# R has many colors in its native 
# `grDevices` package.
?colors
# There are a total of 657 colors in 
# the `colors()` vector.
str(colors())

demo("colors")


#=================================================-
#### Slide 18: Create variable colors   ####

?sample


#=================================================-
#### Slide 19: Create variable colors (cont'd)  ####

# Set random seed to get the same sample every time!
set.seed(1)

# We have as many variables as columns in our data.
# Save number of columns to a variable using `ncol` function.
n_cols = ncol(health_data)

# Pick a sample of colors for each
# variable in our data set
col_sample = sample(colors(),#<- vector of colors
                    n_cols)  #<- n elements to sample 
col_sample


#=================================================-
#### Slide 20: Compare variables: boxplots combined  ####

# Make a box plot of relevant variables and give a vector of colors for each of them.
boxplot(health_data$age, health_data$avg_glucose_level, health_data$bmi, col = col_sample) 


#=================================================-
#### Slide 21: Univariate plots: histogram  ####

# Histogram data without plot.
hist(health_data$avg_glucose_level, plot = FALSE)


#=================================================-
#### Slide 22: Univariate plots: histogram (cont'd)  ####

# Univariate plot: histogram.
hist(health_data$avg_glucose_level)


#=================================================-
#### Slide 23: Univariate plots: histogram (cont'd)  ####

# Customize your histogram.
hist(health_data$avg_glucose_level,
     col = col_sample[1]) #<- set color

hist(health_data$avg_glucose_level,
     col = col_sample[1],
     xlab = "avg_glucose_level",   # x-axis label
     main = "Dist. of avg_glucose_level") # title


#=================================================-
#### Slide 24: Compare variables: histograms combined  ####

# Make a combined histogram plot.
par(                                    #<- set plot area parameters with `par`
    mfrow = c(1, 2))                    #<- split area into 1 row 2 columns with `mfrow` 
hist(health_data$age,   #<- add 1st histogram
     col = col_sample[2],
     xlab = "age",   
     main = "Dist. of age")
hist(health_data$avg_glucose_level,   #<- add 2nd histogram
     col = col_sample[3],
     xlab = "avg_glucose_level",   
     main = "Dist. of avg_glucose_level")


#=================================================-
#### Slide 26: Univariate plots: bar chart (cont'd)  ####

par(                                    #<- set plot area parameters with `par`
  mfrow = c(1, 1))
# Create the data for the chart
input <- c(80, 95, 90, 85, 75)
time_i <- c("6AM", "9AM", "12PM", "3PM", "6PM")

# Plotting the bar chart
barplot(input, names.arg=time_i, xlab="Time intervals", ylab="pulse rate of sample patient", col="blue")



#=================================================-
#### Slide 29: Bivariate plots: scatterplot  ####

plot(health_data$age, #<- variable for x-axis
     health_data$avg_glucose_level) #<- variable for y-axis


#=================================================-
#### Slide 30: Bivariate plots: scatterplot (cont'd)  ####

plot(health_data$age, 
     health_data$avg_glucose_level,
     xlab = "age",
     ylab = "avg_glucose_level",
     main = "age vs avg_glucose_level") 


#=================================================-
#### Slide 31: Bivariate plots: scatterplot (cont'd)  ####

# Customize your scatterplot.
plot(health_data$age, 
     health_data$avg_glucose_level,
     xlab = "age",
     ylab = "avg_glucose_level",
     main = "age vs avg_glucose_level",
     pch = 8,   #<- type of symbol to use
     cex = 2,   #<- scale of the point
     col = "steelblue") 


#=================================================-
#### Slide 33: Multivariate plots: scatterplot matrix  ####

# Plot scatterplots for many variables.
# Select quantitative variables 
health_quant <- health_data[, c("age", "avg_glucose_level", "bmi")]

pairs(health_quant , #<- select variables
     pch = 19,          #<- set symbol
     col = "steelblue") #<- set color


#=================================================-
#### Slide 34: Installing `corrplot` package  ####

# Install package through command line.
#install.packages("corrplot")

# Load the package into the environment.
library(corrplot)



#=================================================-
#### Slide 35: Multivariate plots: correlation plot  ####

# View package documentation.
library(help = "corrplot")

?corrplot


#=================================================-
#### Slide 36: Multivariate plots: correlation plot (cont'd)  ####

# Create correlation plot.
health_cor = cor(health_quant)
corrplot(health_cor)


#=================================================-
#### Slide 37: Multivariate plots: correlation plot (cont'd)  ####

# The default method is "circle", to
# display the correlation coefficient 
# instead, use method "number".
corrplot(health_cor,method = "number")
# To display correlation coefficient as 
# a portion of a circle proportionate to 
# correlation coefficient use method "pie".
corrplot(health_cor,method = "pie")


#=================================================-
#### Slide 39: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

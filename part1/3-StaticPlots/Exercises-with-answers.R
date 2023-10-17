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

# Load the `ggplot2` package.
# Create a dataset named `heart_data_num` consisting of only the numeric variables from heart_data_subset (if not numeric datatype).


# Result: 
library(ggplot2)
heart_data_num = heart_data_subset[sapply(heart_data_subset, is.numeric)] #<- uses is.numeric to subset only numeric columns
heart_data_num


#================================================-
#### Task 3 ####

# Begin to create the foundation of a plot by executing ggplot on heart_data_num without any specification added yet as to what type of plot it will be.
# Set x to serum_sodium. 
# Assign ggplot's output to the variable ffplot1.

# Result:
ffplot1 = ggplot(heart_data_num,      #<-Set data
                 aes(x = serum_sodium))  #<-Set aesthetics  
ffplot1

#================================================-
#### Task 4 ####
# Specify that the plot is going to be a histogram by adding geom_histogram() to ffplot1 to see the plotted histogram.

# Result:
ffplot1 + geom_histogram()

#================================================-
#### Task 5 ####
# Modify the histogram within its specifications to make it a density plot, and set the bin width to 10.
# Enhance the histogram by setting the outline color to "salmon2" and the fill color to "salmon3".

# Result:
ffplot1 = ffplot1 + geom_histogram(aes(y = ..density..), #<- y= ..density.. tells aes to make it a density plot
                         binwidth = 10,        #<- a binwidth of 10 creates a smoother plot
                         color = "salmon2", #<- set outline color 
                         fill = "salmon3")  #<- set fill color
ffplot1

#================================================-
#### Task 6 ####
# Create a new density plot object and add it to ffplot1. Then save ffplot1.
# Hint: ?geom_density
# Specify that the density plot should have a 20% opaque gray fill and a steelblue border.

# Result:
ffplot1 = ffplot1 + geom_density(alpha = .2,           #<- set opaque level of plot
                                 color = "steelblue",  #<- border color
                                 fill = "gray")        #<- fill color
ffplot1



#================================================-
#### Task 7 ####
# Specify what size text you want on the plot labels by adding theme_bw() to ffplot1. 
# Set the axis title text to size 22 and the axis text to size 18.
# Save the theme to ff_theme.

# Result:
ff_theme = theme_bw() +                                #<- black and white theme
        theme(axis.title = element_text(size = 22), #<- sets title size
        axis.text = element_text(size = 18))        #<- sets axis text size

ffplot1  = ffplot1 +  ff_theme
ffplot1

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
library(tidyverse)

heart_data_sub = heart_data_num %>%
  select(-c('platelets','creatinine_phosphokinase')) %>% #<- select and ends_with
  drop_na()

heart_data_long =  heart_data_sub%>%  
    gather(key = "variable", value = "value")    #<- set key and value with gather

head(heart_data_long) #<- check results
tail(heart_data_long)


#================================================-
#### Task 9 ####

# Create a base boxplot of `heart_data_long` and save it as `ffboxplot`.
# Update the aesthetics of the box plot by filling the boxplot with color, 
# but make sure a legend for color is not included in the plot.

# Result:
ffboxplot = ggplot(heart_data_long, 
                   aes(x = variable, 
                       y = value,
                       fill = variable)) + 
            geom_boxplot() + 
            guides(fill = FALSE) 
 
ffboxplot

#================================================-
#### Task 10 ####

# Update `ffboxplot` by highlighting the outliers. Make them red and size 3.
# Add a title "Heart Data" and subtitle "Boxplot" to the plot.

# Result:
ffboxplot = ffboxplot +                 #<- previously saved plot
  geom_boxplot(outlier.color = "red",   #<- adjust outlier color
               outlier.size = 3) +      #<- adjust outlier size
  labs(title = "Heart Data",
       subtitle = "Boxplot")
ffboxplot


#================================================-
#### BONUS ####

#### Task 11 ####

# Normalize the values for all variables in `heart_data_long`.
# Remove NA's while normalizing with the maximum value.
# Create a boxplot with normalized data.
# Highlight outliers and add a title and subtitle as in task 10.

# Result:
heart_data_long = heart_data_long %>%
  group_by(variable) %>%              #<- group values by variable
  mutate(norm_value =                 #<- make `norm_value` column
           value/max(value,           #<- divide value by group max
                     na.rm = TRUE))   #<- don't forget the NAs!

heart_data_long

ffboxplot = ggplot(heart_data_long, 
                   aes(x = variable, 
                       y = norm_value,
                       fill = variable)) + 
            geom_boxplot(outlier.color = "red",   #<- adjust outlier color
               outlier.size = 3) + 
            guides(fill = FALSE) +
            labs(title = "Heart Data",
                  subtitle = "Boxplot")
 
ffboxplot

#================================================-
#### Task 12 ####

# Now build scatterplots with platelets vs. the rest of the columns in the `heart_data_num`.
# Convert `heart_data_num` into a long dataset `heart_subset_long2`
# Normalize all the components.
# Explicitly exclude `platelets` from the `gather` statement.
# Then use the group_by & mutate statements to normalize the values, using the MEAN to normalize.

heart_subset_long2 = heart_data_num %>%
  gather(-platelets, #<- gather all variables but `platelets`
         key = "variable",                   #<-   set key to `variable`
         value = "value")%>%
  group_by(variable) %>%
  mutate(norm_value = value/mean(value, na.rm = TRUE))

heart_subset_long2

#================================================-
#### Task 13 ####

# Create a base plot with `heart_subset_long2` and call it `base_norm_plot`.
# Make sure to use the normalized values on the x-axis and platelets on the y-axis.
# Add a scatterplot layer to `base_norm_plot` with point size = 1.5 and 50% opacity. Save it as `scatter_norm`.

# Result:
base_norm_plot = ggplot(data = heart_subset_long2,  
                         aes(x = norm_value,
                             y = platelets,     
                             color = variable))

scatter_norm = base_norm_plot + 
                geom_point(size=1.5, 
                           alpha=0.5)
scatter_norm

#================================================-
#### Task 14 ####

# Add a 2d geom_density layer to `scatter_norm` and save it as `scatter_norm`.
# Split the scatterplots into different facets for each variable using `facet_wrap` and display in 2 rows.

# Result:
scatter_norm = scatter_norm + 
              geom_density2d()  + 
              facet_wrap(~variable, nrow = 2)

scatter_norm

#================================================-
#### Task 15 ####

# Add a built-in theme `theme_light()` to the scatterplots.
# Remove the redundant legend.
# Finally, add title Heart Data : Platelets vs. Other variables" and, 
# subtitle "2D distribution of scaled data" to the plots.
# View the updated plot.
# Result:

scatter_norm = scatter_norm + 
              theme_light() + 
              guides(color = FALSE) +
              labs(title = "Heart Data : Platelets vs. Other variables",
                    subtitle = "2D distribution of scaled data")
              

scatter_norm

#================================================-
#### Task 16 ####

# Set working directory to where you want to save plots.
# Use `pdf()` function to save `ffboxplot` from Exercise 1 and `scatter_norm` from Exercise 2.
# Save the plots as "ggplot_visualizations.pdf".
# Set `width = 12` and `height = 7`.
# Clear graphics device after saving your plots.
# Open your plots directory and check the saved plots.
# Result:

setwd(plot_dir)

pdf("ggplot_visualizations.pdf",
    width = 12,
    height = 7)
ffboxplot
scatter_norm

dev.off()





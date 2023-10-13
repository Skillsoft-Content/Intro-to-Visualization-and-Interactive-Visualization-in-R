#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOVISUALIZATIONINR/3 STATICPLOTS/INTROTOVISUALIZATIONINR STATICPLOTS 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 8: Directory settings  ####

# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 9: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 12: Load the dataset  ####

# Read CSV file called "healthcare-dataset-stroke-data.csv"
health_data = read.csv(file = file.path(data_dir,"healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors



#=================================================-
#### Slide 13: View data types  ####

str(health_data)


#=================================================-
#### Slide 14: Impute missing data  ####

# Convert BMI to numeric
health_data$bmi <- as.numeric(health_data$bmi)
# Replace N/A's in BMI column with mean
health_data$bmi[is.na(health_data$bmi)] <- mean(health_data$bmi,na.rm=TRUE)
str(health_data)


#=================================================-
#### Slide 15: Subsetting data  ####

health_subset <- health_data[, c("age", "avg_glucose_level", "bmi")]
str(health_subset)


#=================================================-
#### Slide 16: Installing `ggplot2`  ####

# First let's install `ggplot2`. if not installed
#install.packages("ggplot2")

# Then we need to load it to our environment.
library(ggplot2)

# Take a look at the documentation.
library(help = "ggplot2")



#=================================================-
#### Slide 17: Working with `ggplot2` package  ####

?ggplot


#=================================================-
#### Slide 21: Making a plot with `geom_histogram`  ####

# Let's create a base plot.
ggp1 = ggplot(health_subset,    #<-Set data
              aes(x = age))#<-Set aesthetics  
ggp1

# Let's add a layer.
# Each layer is called a `geom`, we need to use
# `geom_histogram` to add a histogram layer.
ggp1 + geom_histogram()


#=================================================-
#### Slide 22: Building a histogram using density with `ggplot2`  ####

ggp1 + geom_histogram()


#=================================================-
#### Slide 25: Making a plot with `geom_histogram`: adjust  ####

# Say instead of frequency counts we want
# probability density estimates. We can:
ggp1 +
  # 1. Make `y-axis` of type `density`
  geom_histogram(aes(y = ..density..),
  # 2. Adjust binwidth for better smoothness.
                 binwidth = 10)

ggp1 = ggp1 +    #<- save adjusted plot
  geom_histogram(aes(y = ..density..),
                 binwidth = 10,
                 # 3. Add color & fill.
                 color = "steelblue",
                 fill = "gray")
ggp1             #<- view saved plot


#=================================================-
#### Slide 27: Plotting with `geom_histogram`: polish   ####

ggp1 = ggp1 + 
  # Add density layer with 50% opaque fill 
  # in "steelblue" and gray color (border).
  geom_density(alpha = .5, 
               color = "gray",
               fill = "steelblue")
ggp1

ggp1  = ggp1 + 
# Add plot title and subtitle.
labs(title = "Age Distribution",
     subtitle = "Histogram & Density")
ggp1


#=================================================-
#### Slide 28: Plotting with `geom_histogram`: polish (cont'd)  ####

# Add a black and white theme to
# overwrite default.
ggp1 = ggp1 + 
  
  # Add a black and white theme.
  theme_bw() +
  
  # Customize elements of the theme.
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))

# Display polished plot.
ggp1


#=================================================-
#### Slide 30: Scatterplot with `geom_point`: set up  ####

# Let's create a base plot.
ggp2 = ggplot(health_subset,                   
              aes(x = age,
                  y = avg_glucose_level)) 
ggp2

# Now, let's add a layer.
# Each layer is called a `geom`, we need to use
# `geom_point` to add a histogram layer.
ggp2 = ggp2 + geom_point()
ggp2


#=================================================-
#### Slide 31: Building a scatterplot with fitted line   ####

ggp2


#=================================================-
#### Slide 32: Adjusting a scatterplot with `geom_point`  ####

ggp2 = ggp2 + 
  
  # Adjust the color of the points.
  geom_point(color = "darkorange") + 
  
  # Add linear regression line (`lm`). 
  geom_smooth(method = lm) +
  
  # Add a title and a subtitle.
  labs(title = "age vs. avg_glucose_level",
       subtitle = "Scatterplot with linear fit")

# View the plot.
ggp2


#=================================================-
#### Slide 33: Polishing a scatterplot with `geom_point`  ####

ggp2 +
  
  # Add black & white theme, adjust labels.
  theme_bw() + 
  
  # Customize elements of the theme.
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))


#=================================================-
#### Slide 34: Saving a theme to a variable  ####

theme_bw() + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))


#=================================================-
#### Slide 35: Saving a theme to a variable (cont'd)  ####

my_ggtheme = theme_bw() + 
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        plot.title = element_text(size = 25),
        plot.subtitle = element_text(size = 18))

# Add saved theme and re-save the plot.
ggp2 = ggp2 + my_ggtheme
ggp2



#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTROTOVISUALIZATIONINR/3 STATICPLOTS/INTROTOVISUALIZATIONINR STATICPLOTS 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 1: Module completion checklist  ####

# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))
# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")
# Read CSV file called "healthcare-dataset-stroke-data.csv"
stroke_org = read.csv(file = file.path(data_dir,"healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors

# Duplicate Data
data1 <- stroke_org
# View all distinct categorical variable
lapply(subset(data1, select = c(stroke, ever_married, work_type, Residence_type, bmi, smoking_status)), unique)
# Convert BMI to numeric
data1$bmi <- as.numeric(data1$bmi)
# Replace N/A's in BMI column with mean
data1$bmi[is.na(data1$bmi)] <- mean(data1$bmi,na.rm=TRUE)
# renaming the final dataset for this section
health <- data1

health_quant <- health[, c("age", "avg_glucose_level", "bmi")]
# Let's save the subset into a new variable.
health_subset = health_quant


#=================================================-
#### Slide 4: Set up: load tidyverse  ####

# Load tidyverse library
library(tidyverse)
# Save our custom `ggplot` theme to a variable.
my_ggtheme = theme_bw() +                     
  theme(axis.title = element_text(size = 20),
        axis.text = element_text(size = 16),
        legend.text = element_text(size = 16),              
        legend.title = element_text(size = 18),             
        plot.title = element_text(size = 25),               
        plot.subtitle = element_text(size = 18))          


#=================================================-
#### Slide 5: Set up: data conversion with `gather`  ####

health_subset_long = health_subset %>%
  gather(key = "variable",
         value = "value") 
# Inspect the first few observations.
head(health_subset_long)

# Inspect the last few observations.
tail(health_subset_long)


#=================================================-
#### Slide 6: Set up: tidy data look  ####

# Inspect the first few entries in the data.
head(health_subset_long)


# Inspect the last few entries in the data.
tail(health_subset_long)


#=================================================-
#### Slide 8: Set up & link data: make boxplots  ####

# A basic box plot with pre-saved theme.
boxplots = ggplot(health_subset_long,   #<- set the base plot + data
                  aes(x = variable,  #<- map `variable` to x-axis
                      y = value)) +  #<- map `value` to y-axis
           geom_boxplot() +          #<- add boxplot geom
           my_ggtheme                #<- add pre-saved theme


#=================================================-
#### Slide 9: Set up & link data: make boxplots (cont'd)  ####

# View plot.
boxplots


#=================================================-
#### Slide 10: Set up: normalize data with group_by + mutate  ####

# Let's normalize the data and then create boxplots.
health_subset_long = health_subset_long %>%
  group_by(variable) %>%              #<- group values by variable
  mutate(norm_value =                 #<- make `norm_value` column
           value/max(value,           #<- divide value by group max
                     na.rm = TRUE))   #<- don't forget the NAs!

head(health_subset_long)


#=================================================-
#### Slide 11: Set up: boxplot with normalized data  ####

# Construct the base plot for normalized data.
base_norm_plot = ggplot(health_subset_long,        #<- set data
                        aes(x = variable,       #<- map `variable`
                            y = norm_value)) +  #<- map `norm_value`
                 geom_boxplot() +               #<- add boxplot layer
                 my_ggtheme                     #<- add theme


#=================================================-
#### Slide 12: Set up: boxplot with normalized data (cont'd)  ####

# View 
base_norm_plot


#=================================================-
#### Slide 13: Adjust: normalized boxplot aesthetics  ####

# Let's add a fill color to the plot.
boxplots_norm = ggplot(health_subset_long,        #<- set data
                        aes(x = variable,       #<- map `variable`
                            y = norm_value,     #<- map `norm_value`
                            fill = variable)) + #<- set fill
                 geom_boxplot()  +              #<- boxplot layer
                 my_ggtheme                     #<- add theme


#=================================================-
#### Slide 14: Adjust: normalized boxplot aesthetics (cont'd)  ####

# View boxplot
boxplots_norm


#=================================================-
#### Slide 15: Adjust: normalized boxplot legends  ####

# Make color of fill based on variable.
boxplots_norm = boxplots_norm +     #<- set base plot   
                guides(fill = FALSE) #<- remove redundant legend 


#=================================================-
#### Slide 16: Adjust: normalized boxplot legends (cont'd)  ####

# View updated plot.
boxplots_norm


#=================================================-
#### Slide 17: Polish: normalized boxplot details  ####

# Make outliers stand out with red color and bigger size.
boxplots_norm = boxplots_norm +       #<- previously saved plot
  geom_boxplot(outlier.color = "red", #<- adjust outlier color
               outlier.size = 5) +    #<- adjust outlier size
  labs(title = "Health data variables",  #<- add title and subtitle
       subtitle = "Boxplot of scaled data")


#=================================================-
#### Slide 18: Polish: normalized boxplot details (cont'd)  ####

# View updated plot.
boxplots_norm


#=================================================-
#### Slide 20: Set up: transform data for scatterplot  ####

health_subset_long2 = health_subset %>%
  gather(avg_glucose_level:bmi, #<- gather all variables but `age`
         key = "variable",                            #<- set key to `variable`
         value = "value") %>%                         #<- set value to `value`
  group_by(variable) %>%
  mutate(norm_value = value/max(value, na.rm = TRUE))

# Inspect the data.
head(health_subset_long2)


#=================================================-
#### Slide 21: Set up & link: normalized data base plot  ####

# Create a base plot.
base_norm_plot = ggplot(data = health_subset_long2,  #<- set data 
                        aes(x = norm_value,       #<- set x-axis to represent normalized value
                            y = age,            #<-   y-axis to represent `age` 
                            color = variable)) +  #<- set color to depend on `variable`
                        my_ggtheme                #<- set theme

base_norm_plot


#=================================================-
#### Slide 22: Set up & adjust: normalized data scatterplot  ####

# Create a scatterplot.
scatter_norm = base_norm_plot +        #<- base plot
               geom_point(size = 3,    #<- add point geom with size of point = 3
                          alpha = 0.7) #<-  make it 70% opaque

# View updated plot.
scatter_norm


#=================================================-
#### Slide 23: Adjust: add density geom to scatterplot  ####

# Adjust scatterplot to include 2D density.
scatter_norm = scatter_norm +              #<- previously saved plot
               geom_density2d(alpha = 0.7) #<- add 2D density geom with 70% opaque color

# View updated plot.
scatter_norm


#=================================================-
#### Slide 24: Adjust: wrap scatterplots in facets  ####

# Wrap each scatterplot into a facet.
scatter_norm = scatter_norm +                   #<- previously saved plot
               facet_wrap(~ variable, ncol = 3) #<- wrap plots by variable into 3 columns


#=================================================-
#### Slide 25: Adjust: wrap scatterplots in facets (cont'd)  ####

# View updated plot.
scatter_norm


#=================================================-
#### Slide 26: Adjust & polish: legends and text in scatterplot  ####

# Add finishing touches to the plot.
scatter_norm = scatter_norm +                        #<- previously saved plot
  guides(color = FALSE) +                            #<- remove legend for color mappings
  theme(strip.text.x = element_text(size = 14)) +    #<- increase text size in strips of facets
  labs(title = "Health data: Age vs. other variables",#<- add title and subtitle
       subtitle = "2D distribution of scaled data")


#=================================================-
#### Slide 27: Adjust & polish: legends and text in scatterplot  ####

# View updated plot.
scatter_norm


#=================================================-
#### Slide 30: Saving plots: export to PNG (cont'd)  ####

# Set working directory 
# to where we want to save our plots.
setwd(plot_dir)

png("Heart_boxplots_norm.png",
    width = 1200, 
    height = 600, 
    units = "px")
boxplots_norm
dev.off()

setwd(plot_dir)
setwd(plot_dir)
png("Heart_scatterplot_norm.png",
    width = 1200, 
    height = 600, 
    units = "px")
scatter_norm
dev.off()


#=================================================-
#### Slide 33: Saving plots: export to PDF (cont'd)  ####

# Set working directory to where you want to save plots.
setwd(plot_dir)

pdf("health_plots.pdf", #<- name of file
    width = 16,      #<- width in inches
    height = 8)      #<- height ...

boxplots_norm        #<- plot 1
scatter_norm         #<- plot 2

dev.off()            #<- clear graphics device


#=================================================-
#### Slide 35: Exercise  ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

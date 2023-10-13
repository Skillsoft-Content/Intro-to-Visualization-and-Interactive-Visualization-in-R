#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/2 INTERACTIVEPLOTS/INTERATIVEVISUALIZATIONWITHR INTERACTIVEPLOTS 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 6: Directory settings  ####

# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 7: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 9: Load HDS dataset  ####

# Read CSV file called "healthcare-dataset-stroke-data.csv"
HDS = read.csv(file = file.path(data_dir,"/healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors


#=================================================-
#### Slide 11: Prepare data  ####

HDS$bmi <- as.numeric(as.character(HDS$bmi)) ##converting bmi column to numeric
# NA imputation
# we can use is.na() function to know about NA values
HDS$bmi[is.na(HDS$bmi)]<-mean(HDS$bmi,na.rm=TRUE) # Replacing na values of bmi column with it's mean bmi



#=================================================-
#### Slide 12: Subset data  ####

# Let's make a vector of column indices we would like to save.
column_ids= select(HDS, age, bmi, smoking_status,work_type)
# Let's save the subset into a new variable.
HDS_subset = column_ids



#=================================================-
#### Slide 13: Highcharter boxplot: `hcboxplot()`  ####

?hcboxplot

hcboxplot(x = Numeric_data_vector,
          var = Categorical_data_vector,
          ...)


#=================================================-
#### Slide 14: Highcharter boxplot: hcboxplot (cont'd)  ####

# Construct an interactive boxplot.
boxplot_interactive =  
  hcboxplot(x = HDS_subset$bmi,
            var = HDS_subset$work_type) %>%
  hc_title(text = "HDS data variables")
boxplot_interactive


#=================================================-
#### Slide 16: Customize hcboxplot with `hc_plotOptions`  ####

# Enhance original boxplot with color options.
boxplot_interactive = boxplot_interactive %>% 
  hc_plotOptions(   #<- plot options
    boxplot = list(     #<- for boxplot 
      colorByPoint = TRUE)) #<- color each box
boxplot_interactive


#=================================================-
#### Slide 17: Column plot: prepare data  ####

column_ids= select(HDS, age,bmi,avg_glucose_level)
# Let's save the subset into a new variable.
HDS_subset_col = column_ids


#=================================================-
#### Slide 18: Column plot: prepare data (contd)  ####

# Create data summary.
HDS_summary = summary(HDS_subset_col)

# Save it as a data frame.
HDS_summary = as.data.frame(HDS_summary)

# Inspect the data.
head(HDS_summary)
# Remove an empty variable.
HDS_summary$Var1 = NULL

# Rename remaining columns.
colnames(HDS_summary) = c("Variable", 
                          "Summary")
# Inspect updated data.
head(HDS_summary)


#=================================================-
#### Slide 19: Column plot: prepare data (contd)  ####

# Separate `Summary` column into 2 columns.
HDS_summary = HDS_summary %>%              #<- set original data 
  separate(Summary,                        #<- separate `Summary` variable 
           into = c("Statistic", "Value"), #<- into 2 columns: `Statistic`, `Value`
           sep = ":",                      #<- set separating character
           convert = TRUE)                 #<- where applicable convert data (to numeric)


# Inspect the first few entries in data.
head(HDS_summary)

# Inspect total number of rows in data including NAs.
nrow(HDS_summary)


#=================================================-
#### Slide 20: Column plot: create plot  ####

# Inspect `Value` column for `NAs`.
which(is.na(HDS_summary$Value) == TRUE)


HDS_summary = subset(HDS_summary, !is.na(Value))

nrow(HDS_summary)

# Construct the summary chart.
HDS_summary_interactive = 
  hchart(HDS_summary,             #<- set data
         "column",                #<- set type (`column` in highcharts)
         hcaes(x = Statistic,     #<- arrange `Statistics` across x-axis
               y = Value,         #<- map `Value` of each `Statistic` to y-axis
               group = Variable)) #<- group columns by `Variable`



#=================================================-
#### Slide 21: Column plot: display plot  ####

HDS_summary_interactive


#=================================================-
#### Slide 22: Column plot: customize tooltip  ####

# Adjust tooltip options by piping `hc_tooltip` to base plot.
HDS_summary_interactive = HDS_summary_interactive %>% 
  hc_tooltip(shared = TRUE)  %>%               #<- `shared` needs to be set to `TRUE`
  hc_title(text = "HDS data variable summary") #<- add title to your plot



#=================================================-
#### Slide 23: Column plot: customize tooltip (cont'd)  ####

HDS_summary_interactive


#=================================================-
#### Slide 25: hchart: correlation plot  ####

# Compute a correlation matrix for the first 
# 4 variables in our data.
cor_matrix = cor(HDS_subset_col[, 1:3])

# Construct a correlation plot by 
# simply giving the plotting function
# a correlation matrix.
correlation_interactive = hchart(cor_matrix) %>%
  # Add title to the plot.
  hc_title(text = "HDS data: correlation")



#=================================================-
#### Slide 26: hchart: correlation plot (cont'd)  ####

correlation_interactive


#=================================================-
#### Slide 27: Save interactive plots: htmlwidgets  ####

# Install `htmlwidgets` package.
install.packages("htmlwidgets")

# Load the library.
library(htmlwidgets)

# View documentation.
library(help = "htmlwidgets")


#=================================================-
#### Slide 28: Save interactive plots: htmlwidgets (cont'd)  ####

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(scatter_interactive,        #<- plot object to save
           "interactive_scatterplot.html", #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself  


#=================================================-
#### Slide 30: Exercise   ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

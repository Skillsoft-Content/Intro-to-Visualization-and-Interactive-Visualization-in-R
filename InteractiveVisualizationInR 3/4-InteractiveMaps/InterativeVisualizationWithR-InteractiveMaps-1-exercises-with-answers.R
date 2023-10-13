#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/4 INTERACTIVEMAPS/INTERATIVEVISUALIZATIONWITHR INTERACTIVEMAPS 1 EXERCISE ANSWERS ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#### Exercise  ####
# =================================================-

#### Please refer to module 1 of Interactive Visualization With R - Interactive Maps for tasks 1-6

#================================================-
#### Task 1 ####

# Set up data:
# Confirm your working directory and make sure it is set to `data_dir`.
# Read in "state_data.csv" to a data frame `state_df`.
# Set `header` = TRUE and `stringsAsFactors` = FALSE.
# Select the `Murder` rate and `state` from the `state_df` to create `data_for_map2`.
# And rename the columns to `value` and `State`.

# Result: 

library(tidyverse)
library(highcharter)

path = box::file()
parent_dir = dirname(dirname(path))
main_dir = dirname(parent_dir)

data_dir = paste0(main_dir, "/data")
plot_dir = paste0(main_dir, "/plots")

state_df = read.csv(file = file.path(data_dir, "/state_data.csv"), header = TRUE, stringsAsFactors = TRUE)

data_for_map2 = select(state_df, 
                       Murder, #<- select `Murder` to display as value on shape
                       State)  

colnames(data_for_map2) = c("value", "State") 

#================================================-
#### Task 2 ####

# Create an interactive map of the murder rate by state in 1975 named `interactive_murder_map`.
# Use the `US_map` data as the map information and the `data_for_map_2` information for the data. 
# Add the area name to the map.
# Use color codes "#ba3030" for `max` and "#f9f2f2" for `min`.
# Add a tooltip with a "%" as the valueSuffix.
# Set the title for the plot as "US States Murder Rate (1975)". 
# Result:

library(jsonlite)
US_map = fromJSON("us-all.geo.json", simplifyVector = FALSE)

interactive_murder_map = 
  highchart(type = "map") %>% 
  hc_add_series(mapData = US_map,
                data = data_for_map2,               
                name = "Murder Rate in 1975",      
                joinBy = c("name",                 
                           "State"),
                dataLabels = list(enabled = TRUE,                  
                                  format =                          
                                  '{point.properties.postal-code}')) %>%           
  hc_colorAxis(min = min(data_for_map2$value), 
               max = max(data_for_map2$value),
               minColor = "#f9f2f2",               
               maxColor = "#ba3030") %>% 
  hc_tooltip(valueSuffix = "%") %>%         
  hc_title(text = "US States Murder Rate (1975)")   

interactive_murder_map

#================================================-
#### Task 3 ####

# Using the `saveWidget` command, save the plot to `plot_dir`

# Result:

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(interactive_murder_map,            #<- plot object to save
           "interactive_murder_map.html",     #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself 


#================================================-
#### Task 4 ####

# Set the working directory to data_dir.
# Read `unemployment.json` as un_emp, and use it to create a list for motion map.
# Follow these steps:
#   1. group data by state (FIPS code)
#   2. go through each state
#   3. select the FIPS for that state and create a list of values for that state
#   4. select the first value to initialize the map
#   5. Put everything together into `un_emp_rate`
# Name the variable en_emp_list.

# Result:

setwd(data_dir)

un_emp = fromJSON("unemployment.json")
head(un_emp)

en_emp_list <- un_emp %>% 
      group_by(fips) %>%                         #<- group by state
      do(un_emp_rate = list(                    #<- go through each state 
         fips = first(.$fips),                   #<- select the FIPS for that state
         sequence = .$value,                     #<- create a list of values for that state
         value = first(.$value))) %>%            #<- select the first value to initialize the map
      .$un_emp_rate                             #<- put the three together in a list `un_emp_rate`

#================================================-
#### Task 5 ####

# Create a motion map `unemp_map_motion`.
# Name the series `Unemployment rate`.
# Use `uscountygeojson` as mapData.
# Set `borderWidth` to 0.01
# Set plot title to "Unemployment rate between 2000 and 2019".

# Result:
unemp_map_motion <- highchart(type = "map") %>% 
  hc_add_series(data = en_emp_list,                          #<- data to plot on shapes
                name = "Unemployment rate",   #<- series name
                mapData = uscountygeojson,          #<- map data from `highcharter`       
                joinBy = "fips",                    #<- join by `fips` field in `data` and `mapData`
                borderWidth = 0.01) %>%             #<- adjust border line for each shape
  hc_colorAxis(stops = color_stops()) %>%           #<- create a color legend 
  hc_title(text = "Unemployment rate between 2000 and 2019") %>% 
  hc_motion(                                        #<- add motion
    enabled = TRUE,
    axisLabel = "year",                             #<- name of motion slider
    labels = sort(unique(un_emp$year)),       #<- label the animation by year
  )

unemp_map_motion

#================================================-
#### Task 6 ####

# Using `saveWidget` command, save the plot to `plot_dir`.

# Result:

setwd(plot_dir) # Set working directory to where you save plots.

saveWidget(unemp_map_motion,          
           "unemployment_map_motion.html",     
           selfcontained = TRUE)    





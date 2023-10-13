#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/4 INTERACTIVEMAPS/INTERATIVEVISUALIZATIONWITHR INTERACTIVEMAPS 1 ##

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
#### Slide 8: Set up: `state.x77` data  ####

# We will load the formatted dataset from a csv file.

# Load the dataset.
state_df = read.csv(file = file.path(data_dir,"/state_data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors                    


#=================================================-
#### Slide 9: Set up: `state.x77` data  ####

# View dataset.
str(state_df)


#=================================================-
#### Slide 10: Set up: working with GEO data and JSON files  ####

# Load the library.
library(jsonlite)

# View documentation.
library(help = "jsonlite")

?fromJSON


#=================================================-
#### Slide 11: Set up: working with GEO data and JSON files  ####

library(highcharter)
# Set working directory to data folder.
setwd(data_dir)

# Read data from JSON file, don't simplify vectors.
US_map = fromJSON("us-all.geo.json", simplifyVector = FALSE)


#=================================================-
#### Slide 12: Set up: working with GEO data and JSON files  ####

# To see what metadata is available in the `geo.json`, use `get_data_from_map` function.
geodata = get_data_from_map(US_map)

# Look at only 15 first columns
str(geodata[,1:15])


#=================================================-
#### Slide 13: Set up: creating a base map  ####

# Create a base interactive map.
interactive_population_map = 
  highchart(type = "map") %>%    #<- base plot 
  hc_add_series(mapData = US_map)#<- map series

# This is just our base plot.
interactive_population_map


#=================================================-
#### Slide 15: Set up: preparing map data (cont'd)  ####

# Select columns to display on map.
data_for_map = select(state_df, 
                      Population, #<- select `Population` to display as value on shape
                      State)      #<- select `State` to join this data with map data

# Rename columns: `Population` -> `value`, because highcharts needs a column 
# called `value` to attach it to shape.
colnames(data_for_map) = c("value", "State") 

# Adjust data (divide population by 1000, to make units in millions).
data_for_map$value = data_for_map$value/1000
head(data_for_map)


#=================================================-
#### Slide 17: Set up: creating an interactive population map  ####

interactive_population_map = 
  highchart(type = "map") %>% 
  hc_add_series(mapData = US_map,
                data = data_for_map,               #<- data to plot on shapes
                name = "Population in 1975",       #<- series name is `Population`
                joinBy = c("name",                 #<- join by `name` property in `mapData`
                           "State") ) %>%          #<- with `State` column in `data`
  hc_colorAxis(min = min(data_for_map$value),      #<- set colors: min value => minimum population
               max = max(data_for_map$value),      #<- max value => maximum population
               minColor = "#CCCCFF",               #<- min value color
               maxColor = "#000066")               #<- max value color


#=================================================-
#### Slide 18: Set up: creating an interactive population map  ####

interactive_population_map


#=================================================-
#### Slide 19: Adjust: creating an interactive population map   ####

interactive_population_map_adjusted = interactive_population_map %>%
    hc_add_series(mapData = US_map,
                  data = data_for_map, 
                  name = "Population in 1975 ",  
                  joinBy = c("name",                
                           "State"),
                  dataLabels = list(enabled = TRUE,                 #<- Add labels with the   
                                  format =                          #   postal code of the state
                                  '{point.properties.postal-code}')
                                  ) %>%
  hc_tooltip(valueSuffix = " million") %>%                          #<- set value suffix
  hc_mapNavigation(enabled = TRUE) %>%                              #<- Add zoom feature
  hc_title(text = "US States Population in millions (1975)")        #<- set plot title


#=================================================-
#### Slide 20: Adjust: creating an interactive population map   ####

# Double click on area or use the `+` button to zoom in on an area.
# Use the `-` button to zoom out. 
interactive_population_map_adjusted


#=================================================-
#### Slide 21: Save interactive plots: htmlwidgets  ####

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(interactive_population_map_adjusted,        #<- plot object to save
           "interactive_population_map.html", #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself  


#=================================================-
#### Slide 24: Reading in the CDC dataset  ####

# Load the library.
library(highcharter)
# Set working directory to data_dir
setwd(data_dir)

# We can also load non-spatial data from a JSON file. 
data_for_map = fromJSON("drug_overdose.json")
head(data_for_map)


#=================================================-
#### Slide 25: Preparing the data  ####

ds <- data_for_map %>% 
      group_by(fips) %>%                         #<- group by state
      do(state_deaths = list(                    #<- go through each state 
         fips = first(.$fips),                   #<- select the FIPS for that state
         sequence = .$value,                     #<- create a list of values for that state
         value = first(.$value))) %>%            #<- select the first value to initialize the map
      .$state_deaths                             #<- put the three together in a list `state_deaths`


#=================================================-
#### Slide 27: Adding motion to maps (cont'd)  ####

interactive_map_motion <- highchart(type = "map") %>% 
  hc_add_series(data = ds,                          #<- data to plot on shapes
                name = "Drug deaths per 100,000",   #<- series name
                mapData = uscountygeojson,          #<- map data from `highcharter`       
                joinBy = "fips",                    #<- join by `fips` field in `data` and `mapData`
                borderWidth = 0.01) %>%             #<- adjust border line for each shape
  hc_colorAxis(stops = color_stops()) %>%           #<- create a color legend 
  hc_title(text = "Drug Overdose Deaths per 100,000 between 2002 and 2014") %>% 
  hc_motion(                                        #<- add motion
    enabled = TRUE,
    axisLabel = "year",                             #<- name of motion slider
    labels = sort(unique(data_for_map$year)),       #<- label the animation by year
  )


#=================================================-
#### Slide 28: Visualizing the interactive map  ####

interactive_map_motion


#=================================================-
#### Slide 29: Save interactive plots: htmlwidgets  ####

# Set working directory to where you save plots.
setwd(plot_dir)

# Save desired interactive plot to an HTML file.
saveWidget(interactive_map_motion,        #<- plot object to save
           "interactive_map_motion.html", #<- name of file to where the plot is to be saved
           selfcontained = TRUE)              #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded 
                                              #   into the HTML file itself  


#=================================================-
#### Slide 34: Exercise   ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

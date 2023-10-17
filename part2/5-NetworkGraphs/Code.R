#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/5 NETWORKGRAPHS/INTERATIVEVISUALIZATIONWITHR NETWORKGRAPHS 1 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 13: visNetwork  ####

library(visNetwork)

?visNetwork


#=================================================-
#### Slide 14: Directory settings  ####

# Set `main_dir` to the location of your materials folder.

path = box::file()
main_dir = dirname(dirname(path))


#=================================================-
#### Slide 15: Directory settings (cont'd)  ####

# Make `data_dir` from the `main_dir` and
# remainder of the path to data directory.
data_dir = paste0(main_dir, "/data")
# Make `plots_dir` from the `main_dir` and
# remainder of the path to plots directory.
plot_dir = paste0(main_dir, "/plots")


#=================================================-
#### Slide 16: Loading packages   ####

library(htmlwidgets)
library(tidyverse)
library(broom)
library(dplyr)
library(visNetwork)


#=================================================-
#### Slide 17: Loading the dataset  ####

# Read in the healthcare-dataset-stroke dataset.
hds = read.csv(file = file.path(data_dir,"/healthcare-dataset-stroke-data.csv"), #<- provide file path
               header = TRUE,            #<- if file has header set to TRUE
               stringsAsFactors = FALSE) #<- read strings as characters, not as factors
# View the dimensions of the dataset.
dim(hds)
# View first few rows and columns
hds[1:5,1:10]


#=================================================-
#### Slide 18: Subsetting the dataset  ####


# Subset a few columns.
hds_small = hds %>%
              select(age, avg_glucose_level,
                     bmi, stroke)

# View the first few rows of the dataset.
head(hds_small)



#=================================================-
#### Slide 19: Cleaning the dataset  ####

# Convert BMI column to numerical
hds_small$bmi <- as.numeric(as.character(hds_small$bmi))
# Remove rows with NA.
hds_small = na.omit(hds_small)

# We keep only the unique rows since duplicate rows would have a distance of 0.
hds_small= unique(hds_small)

head(hds_small)



#=================================================-
#### Slide 20: Measuring similarity  ####

?dist


#=================================================-
#### Slide 21: Measuring similarity (contd)  ####

# Create distance matrix.
hds_distance = dist(hds_small)

# `dist` returns the lower triangle of the distance matrix as a vector.
head(hds_distance)

# Normalize the distances to values between 0 and 1. 
hds_distance = hds_distance/max(hds_distance)

head(hds_distance)


#=================================================-
#### Slide 22: Interpreting similarity  ####


# Use 1- distance to obtain the value for similarity. 
hds_sim = 1-hds_distance 
head(hds_sim)


#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################
#######################################################
#######################################################
############    COPYRIGHT - DATA SOCIETY   ############
#######################################################
#######################################################

## INTERACTIVEVISUALIZATIONINR/5 NETWORKGRAPHS/INTERATIVEVISUALIZATIONWITHR NETWORKGRAPHS 2 ##

## NOTE: To run individual pieces of code, select the line of code and
##       press ctrl + enter for PCs or command + enter for Macs


#=================================================-
#### Slide 2: Creating the network: edges   ####

library(broom)
# Create edge dataframe. 
hds_edges = tidy(hds_sim)
# Edges dataframe has to be named this way for visNetwork input.
colnames(hds_edges) = c("from", "to", "value")
head(hds_edges)


#=================================================-
#### Slide 4: Setting the number of edges  ####

# We choose the median as the threshold since this gives us the best visualization.
hds_edges = subset(hds_edges,value>median(hds_edges$value))

# Arrange by order of edge thickness.
hds_edges = arrange(hds_edges, desc(value))

# Subset only top 200.
hds_edges = hds_edges[1:200,]



#=================================================-
#### Slide 5: Creating the network: nodes  ####

# Get unique nodes from edges dataframe and combine them 
hds_nodes_from = data.frame(id = unique(hds_edges$from))
hds_nodes_to = data.frame(id = unique(hds_edges$to))
hds_nodes = rbind(hds_nodes_from,hds_nodes_to)

# Retain unique nodes in case nodes are repeated in `from` and `to` columns
hds_nodes = unique(hds_nodes)


#=================================================-
#### Slide 6: Creating the network: nodes  ####

# Add color to the nodes dataframe based on stroke value from original dataframe
hds_small = select(hds_small, stroke)               #<- we only need the target info
hds_small$id = rownames(hds_small)                 

# Merge nodes dataframe with the dataframe with Target value 
hds_nodes = merge(hds_nodes, hds_small,
                    by = "id", all.x = TRUE)            #<- merge() needs the `id` column to 
                                                        #   join the two dataframes
# Assign color to nodes based on the stroke value
hds_nodes$color = factor(hds_nodes$stroke,          #<- create a factor 
labels = c("orange", "darkblue"), #<- assign color 
levels = c(1, 0))                                 #   based on Target value

# Because we aligned colors based on the stroke column, we can drop it
hds_nodes = select(hds_nodes, c(id, color))    



#=================================================-
#### Slide 7: Creating the network: nodes (cont'd)  ####

head(hds_nodes)



#=================================================-
#### Slide 9: Creating the network   ####

# Create network.
hds_network = visNetwork(hds_nodes,                 #<- set nodes
                           hds_edges)           #<- set edges

hds_network


#=================================================-
#### Slide 12: Customizing the network visualization  ####

# Add network visualizations
hds_network = visNetwork(hds_nodes,                 #<- set nodes
                           hds_edges)  %>%            #<- set edges
                 visOptions(highlightNearest = TRUE,    #<- highlight nearest nodes
                                                        #   when clicking on a node 
                           nodesIdSelection = TRUE)     #<- create a dropdown menu to 
                                                        #   select particular nodes  



#=================================================-
#### Slide 13: Customizing the network visualization (cont'd)  ####

hds_network


#=================================================-
#### Slide 14: Saving networks with htmlwidgets  ####

# Set working directory to where you save interactive plots.
setwd(plot_dir)

# Load the library.
library(htmlwidgets)

# Save desired interactive plot to an HTML file.
saveWidget(hds_network,                     #<- plot object to save
           "network.html",                    #<- name of file to where the plot is to be saved
            selfcontained = TRUE)             #<- set `selfcontained` to TRUE, so that 
                                              #   all necessary files and scripts are embedded
                                              #   into the HTML file itself  


#=================================================-
#### Slide 16: Exercise   ####




#######################################################
####  CONGRATULATIONS ON COMPLETING THIS MODULE!   ####
#######################################################

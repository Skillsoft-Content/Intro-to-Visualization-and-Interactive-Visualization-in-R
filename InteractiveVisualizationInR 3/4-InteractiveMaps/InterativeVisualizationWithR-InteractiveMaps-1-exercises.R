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















#================================================-

#### Task 2 ####



# Create an interactive map of the murder rate by state in 1975 named `interactive_murder_map`.

# Use the `US_map` data as the map information and the `data_for_map_2` information for the data. 

# Add the area name to the map.

# Use color codes "#ba3030" for `max` and "#f9f2f2" for `min`.

# Add a tooltip with a "%" as the valueSuffix.

# Set the title for the plot as "US States Murder Rate (1975)". 

# Result:









#================================================-

#### Task 3 ####



# Using the `saveWidget` command, save the plot to `plot_dir`



# Result:



# Set working directory to where you save plots.



# Save desired interactive plot to an HTML file.





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









#================================================-

#### Task 5 ####



# Create a motion map `unemp_map_motion`.

# Name the series `Unemployment rate`.

# Use `uscountygeojson` as mapData.

# Set `borderWidth` to 0.01

# Set plot title to "Unemployment rate between 2000 and 2019".



# Result:





#================================================-

#### Task 6 ####



# Using `saveWidget` command, save the plot to `plot_dir`.



# Result:













#######################################################

#######################################################

############    COPYRIGHT - DATA SOCIETY   ############

#######################################################

#######################################################



## INTERACTIVEVISUALIZATIONINR/5 NETWORKGRAPHS/INTERATIVEVISUALIZATIONWITHR NETWORKGRAPHS 2 EXERCISE ANSWERS ##



## NOTE: To run individual pieces of code, select the line of code and

##       press ctrl + enter for PCs or command + enter for Macs





#### Exercise  ####

# =================================================-



#### Please refer to module 1 of Interactive Visualization With R - Network Graphs - 1 for tasks 1-2

#### Task 1 ####



# Load the necessary libraries.

# Set the working directory to where the data is located.

# Load the 'heart_failure_clinical_records_dataset.csv' dataset and save it as `clinical_records` dataframe. 

# Use na.omit() to remove any NA rows present.

# Keep only the unique rows of the `clinical_records` dataframe as `clinical_records_nw` since we want to see the network with unique nodes. 

# Print out the first few rows of the dataframe `clinical_records_nw`. 



# Result: 















#================================================-

#### Task 2 ####



# Subset the columns "age", "creatinine_phosphokinase", 

# "ejection_fraction","platelets", "serum_creatinine", "serum_sodium"

# since we want to use only numeric variables to create our network. 

# Create a distance matrix `clinical_records_distance` for the `clinical_records_nw` dataframe using the `dist` function.

# Normalize the distances to values between 0 and 1. 

# Next, create a similarity matrix `clinical_records_sim` using `clinical_records_distance`.



# Result: 















#### Please refer to module 2 of Interactive Visualization With R - Network Graphs - 2 for tasks 3-7

#================================================-

#### Task 3 ####



# Create an edge dataframe `clinical_records_edges` using the `tidy` function and the `clinical_records_sim` matrix.

# Rename the columns of `clinical_records_edges` to "from", "to", "value" since this is how visNetwork reads the edge dataframe.

# View the first few rows of the`clinical_records_edges`.



# Result: 











#================================================-

#### Task 4 ####

# Choosing the median as the threshold, subset only those rows in `clinical_records_edges` where `value` is greater than the threshold. 

# Order the `clinical_records_edges` dataframe in descending order of `value`.

# Keep only the top 100 rows in `clinical_records_edges`, as we want to visualize a small network.

















#================================================-

#### Task 5 ####



# Create the nodes dataframe `clinical_records_nodes_from` using the unique values from the "from"" column of `clinical_records_edges` dataframe.

# Create the nodes dataframe `clinical_records_nodes_to` using the unique values from the "to" column of `clinical_records_edges` dataframe.

# Combine the nodes `clinical_records_nodes_from` and `clinical_records_nodes_to` create dataframe `clinical_records_nodes`. 

# Keep only the unique nodes. 



# Result: 













#================================================-

#### Task 6 ####



# Add color to the nodes dataframe based on the target value by doing the following:

# 1. Create a dataframe called `clinical_records_small` with only the `high_blood_pressure` column.

# 2. Create an ID column for the `clinical_records_small` dataframe using the row names of `clinical_records`.

# 3. Merge the `clinical_records_nodes` dataframe with the `clinical_records_small` dataframe using the `id` column.

# 4. Add a `color` variable to the `clinical_records_nodes` dataframe whose value depends on the `high_blood_pressure` variable. Set level 0 as "maroon" and level 1 as "darkblue". 

# 5. Only keep the `id` and `color` columns for `clinical_records_nodes`. 



# Result: 







#================================================-

#### Task 7 ####



# Create the network using `visNetwork` with nodes `clinical_records_nodes` and  edges `clinical_records_edges`.

# Set `highlightNearest` and `nodesIdSelection` as TRUE in visOptions.





# Result: 













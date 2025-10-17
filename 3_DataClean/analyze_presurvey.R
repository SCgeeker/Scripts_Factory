# R script to analyze the presurvey data

# Read the data from the csv file
data <- read.csv("3_DataClean/presurvey.csv")

# Select the columns from q1 to q22
q_data <- data[, paste0("q", 1:22)]

# Get a summary of the data (descriptive statistics)
summary(q_data)

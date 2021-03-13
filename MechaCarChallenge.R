install.packages("tidyverse")
install.packages("ggplot2")

# Load dplyr package and tidyverse:
library(dplyr)
library(tidyverse)

# Read MechaCar_mpg csv:
mecharcar_table <- read.csv(file = "Data/MechaCar_mpg.csv", check.names = F)

# Perform linear regression to predict the mpg of car and add mecharcar_table as the data parameter:
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecharcar_table)

# Determine the p-value and the r-squared value.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mecharcar_table))



# Import and read Suspension_Coil.csv:
suspension_table <- read.csv(file = "Data/Suspension_Coil.csv", check.names = F)

# Create a total_summary data frame:
total_summary <- suspension_table %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), Standard_Deviation = sd(PSI),
                                               number_rows =  n(), .groups = "keep")

# Create a lot_summary using group_by():
lot_summary <- suspension_table %>% group_by(Manufacturing_Lot) %>% summarize(Mean = mean(PSI), Median = median(PSI), Variance = var(PSI), Standard_Deviation  = sd(PSI))



# Test to determine if The PSI for all manufacturing lots is statistically different from the population mean of 1.500# per square inch.
t.test(suspension_table[["PSI"]], mu = 1500)

# Use the subset function to filter the 3 different lots. 
first_lot <- subset(suspension_table, Manufacturing_Lot == "Lot1")
second_lot <- subset(suspension_table, Manufacturing_Lot == "Lot2")
third_lot <- subset(suspension_table, Manufacturing_Lot == "Lot3")

# Test to determine if The PSI for each manufacturing lots is statistically different from the population mean of 1.500# per square inch.
t.test(first_lot[["PSI"]], mu = 1500)
t.test(second_lot[["PSI"]], mu = 1500)
t.test(third_lot[["PSI"]], mu = 1500)
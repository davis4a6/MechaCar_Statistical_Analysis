### Deliverable 1:
# 3. Use library function to load dplyr package
library(dplyr)

# 4. Import csv file and read into dataframe
library(tidyverse)

# 5. Perform linear regression using lm() function and add the dataframe with all six variables
mechacar_data <- read.csv('./Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors=F)

lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_data)

# 6. Use summary function to determine the p-value and r-squared value for the linear regression model
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_data))

## Deliverable 2
# 2. Import and read the suspension_coil file as a table.
suspension_coil_data <- read.csv('./Resources/Suspension_Coil.csv', check.names=F,stringsAsFactors = F)
suspension_coil_data

# 3. Create a total_summary dataframe using the summarize() function to get the mean, median, variance and standard deviation of the suspension coil's PSI colulmn.
total_summary <- suspension_coil_data %>% summarize(Mean= mean(PSI), Median= median(PSI), Var= var(PSI), STD= sd(PSI), .groups = 'keep')

total_summary

# 4. Write a script that creates a lot_summary dataframe using the groupby and the summarize function to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column.
lot_summary <- suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median= median(PSI), Var= var(PSI), STD= sd(PSI), .groups = 'keep')

lot_summary

#Visual
plt1 <- ggplot(suspension_coil_data,aes(y=PSI)) 
#import dataset into ggplot
plt1 + geom_boxplot()

plt2 <- ggplot(suspension_coil_data,aes(x=Manufacturing_Lot,y=PSI))
#import dataset into ggplot
plt2 + geom_boxplot()


## Deliverable 3

# 1. Use t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch

t.test(suspension_coil_data$PSI,mu=1500)

# 2. Use t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch
lot1 <- subset(suspension_coil_data, Manufacturing_Lot=="Lot1")
lot2 <- subset(suspension_coil_data, Manufacturing_Lot=="Lot2")
lot3 <- subset(suspension_coil_data, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)





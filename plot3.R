setwd("~/Coursera/Exploratory_Data_Analysis/ExData_Plotting2")
# Check if data exists. If not load the data.
if (!"NEIData" %in% ls()) {
      NEIData <- readRDS("./summarySCC_PM25.rds")
}
if (!"SCCData" %in% ls()) {
      SCCData <- readRDS("./Source_Classification_Code.rds")
}
head(NEIData)
head(SCCData)
dim(NEIData) # 6497651 6
dim(SCCData) # 11717 15

# Subset data for Baltimore City
subset <- NEIData[NEIData$fips == "24510", ]

# Set graphical parameters and create png file
library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot3.png",
    width = 480, height = 480,
    units = "px")

# Use ggplot to plot the data in "subset"
g <- ggplot(subset, aes(x = year, y = Emissions, color = type))
    g + geom_line(stat = "summary", fun.y = "sum") +
      ylab (expression('Total PM'[2.5]*" Emission")) +
      ggtitle("Total emissions in Baltimore City between 1999 and 2008")

dev.off()

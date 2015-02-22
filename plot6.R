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

subset <- NEIData[NEIData$fips == "24510"|NEIData$fips == "06037", ]

# Set graphical parameters and create png file
library(ggplot2)
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot6.png",
    width = 480, height = 480,
    units = "px")

motor <- grep("motor", SCCData$Short.Name, ignore.case = T)
motor <- SCCData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]


g <- ggplot(motor, aes(year, Emissions, color = fips))
g + geom_line(stat = "summary", fun.y = "sum") +
      ylab(expression('Total PM'[2.5]*" Emissions")) +
      ggtitle("Comparison of Total Emissions From Motor\n Vehicle Sources in Baltimore City\n and Los Angeles County from 1999 to 2008") +
      scale_colour_discrete(name = "Group", label = c("Los Angeles","Baltimore"))
dev.off()

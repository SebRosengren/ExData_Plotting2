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

subset <- NEIData[NEIData$fips == "24510", ]

# Set graphical parameters and create png file
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot5.png",
    width = 480, height = 480,
    units = "px")

motor <- grep("motor", SCCData$Short.Name, ignore.case = T)
motor <- SCCData[motor, ]
motor <- subset[subset$SCC %in% motor$SCC, ]
motorEmissions <- aggregate(motor$Emissions, list(motor$year), FUN = "sum")

plot(motorEmissions, type = "l", xlab = "Year",
     main = "Total Emissions From Motor Vehicle Sources\n from 1999 to 2008 in Baltimore City",
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

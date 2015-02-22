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

head(SCCData$Short.Name)

# Set graphical parameters and create png file
par("mar"=c(5.1, 4.5, 4.1, 2.1))
png(filename = "./plot4.png",
    width = 480, height = 480,
    units = "px")

coal <- grep("coal", SCCData$Short.Name, ignore.case = TRUE)
coal <- SCCData[coal, ]
coal <- NEIData[NEIData$SCC %in% coal$SCC, ]

coalEmissions <- aggregate(coal$Emissions, list(coal$year), FUN = "sum")

# Create plot labels and title
plot(coalEmissions, type = "l", xlab = "Year",
     main = "Total emissions from coal combustion related\n sources from 1999 to 2008",
     ylab = expression('Total PM'[2.5]*" Emission"))

dev.off()

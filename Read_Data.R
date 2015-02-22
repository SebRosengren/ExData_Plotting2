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


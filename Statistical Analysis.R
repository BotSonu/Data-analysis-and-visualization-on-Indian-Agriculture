# Loading the data
agri_data <- read.csv("C:/Users/sreya/OneDrive/Desktop/DATA_ANA_TRY/PRJDATA/India Agriculture Crop Production.csv")

# Showing the Columns of the data frame
colnames(agri_data)

# Descriptive Statistics
install.packages("summarytools")
library(summarytools)
summarytools::descr(agri_data)
summarytools::freq(agri_data)
summarytools::dfSummary(agri_data)

# Cleaning the data
install.packages("tidyr")
library(tidyr)
data<-drop_na(agri_data)
data

# Finding rowwise Mean,Median and Standard Deviation
df <- data[c("Area","Production","Yield")]
df$Mean = apply(df,1,mean)
df$Median = apply(df,1,median)
df$Standard_Deviation = apply(df,1,sd)

# Merging the data
new_data <- cbind(data,df)
data_set <- na.omit(new_data[c(1,6,8,10,14,15,16)])

# Meta analysis
install.packages("meta")
library(meta)
x <- metabin(data = data_set,Mean,Yield,Median,Standard_Deviation,sm = "OR",studlab = State,random = T,fixed = F,method = "MH")
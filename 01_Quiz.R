library(dplyr)
#1
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", 
              dest = "./data/idaho.csv" )
idaho = read.csv("./data/idaho.csv")
str(idaho)
unique(idaho$VAL)
idaho %>% filter(VAL == 24) %>% summarise(count = n())
str(idaho$FES)

# 3
install.packages("xlsx")
install.packages("readxl") # CRAN version
library(readxl)
install.packages("openxlsx")
library(openxlsx)
dat <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx", startRow = 18) %>% 
  select(Zip:Status) %>%
  top_n(5) 

rowIndex <- 18:23 
colIndex <- 7:15 
NGAP = read_excel("./data/NGAP.xlsx", colIndex = 7:15, rowIndex = 18:23)
contractor = read.csv("./data/contractor.csv", sep = ",")
str(contractor)
sum(contractor$Zip*contractor$Ext,na.rm=T)

library(xlsx)
NGAP = read.xlsx("./data/NGAP.xlsx", sheetIndex = 1, header = TRUE)

# 4
install.packages("XML")
library(XML)
fileUrl = "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
baltimore = xmlTreeParse(fileUrl, useInternalNodes = TRUE)
str(baltimore)


# 5
fileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, dest = "./data/idaho_survey.csv")
DT = fread("./data/idaho_survey.csv")
system.time(replicate(1000,mean(DT$pwgtp15, by = DT$SEX)))
system.time(replicate(1000,sapply(split(DT$pwgtp15,DT$SEX),mean)))
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
system.time(replicate(1000,rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2])
system.time(replicate(1000,DT[,mean(pwgtp15),by=SEX]))
system.time(replicate(1000,tapply(DT$pwgtp15,DT$SEX,mean))

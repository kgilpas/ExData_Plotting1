# Set my working directory
setwd("C:/Users/ENVY/Desktop")

# Read in data by unzipping file and loading via read.table
temp <- tempfile() 
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp) 
data <- read.table(unz(temp, "household_power_consumption.txt"),sep=";",header=TRUE,na.strings="?") 
unlink(temp)


#Subset data
pwrConsum <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# Fix dates
pwrConsum$Timestamp <- paste(pwrConsum$Date,pwrConsum$Time, sep=' ')
pwrConsum$Timestamp <- strptime(pwrConsum$Timestamp,format='%d/%m/%Y %H:%M:%S')

# Plot 2

png(file="./plot2.png", width=480,height=480, bg = "transparent")

plot(
  pwrConsum$Timestamp,
  pwrConsum$Global_active_power,
  ylab = "Global Active Power (kilowatts)",
  xlab = '',
  type = "l",
  lwd = 1,
  col = "black"
)

dev.off()
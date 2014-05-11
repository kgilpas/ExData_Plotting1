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

# Plot 3

png(file="./plot3.png", width=480,height=480, bg = "transparent")

# Submeterings

# Submetering 1

plot(
  pwrConsum$Timestamp,
  pwrConsum$Sub_metering_1,
  ylab = "Energy by sub metering",
  xlab = '',
  type = 'n'
)

# Submetering 1

lines(
  pwrConsum$Timestamp,
  pwrConsum$Sub_metering_1,
  lwd = 1,
  col = "black"
)


# Submetering 2

lines(
  pwrConsum$Timestamp,
  pwrConsum$Sub_metering_2,
  lwd = 1,
  col = "red"
)

# Submetering 3

lines(
  pwrConsum$Timestamp,
  pwrConsum$Sub_metering_3,
  lwd = 1,
  col = "blue"
)

# Legend

legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"),
       lty = 1,
       lwd = 1)


dev.off()
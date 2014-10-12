# Import data, then keep only 2 days of the data
powerData <- read.csv("data/powerData.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
partialPowerData <- powerData[(powerData$Date >= "2007-02-01") & (powerData$Date <= "2007-02-02"),]

# Set up DateTime column
partialPowerData$DateTime <- as.POSIXct(paste(partialPowerData$Date, partialPowerData$Time, sep=" "))

# Convert used columns to numeric
partialPowerData$Sub_metering_1 <- as.numeric(partialPowerData$Sub_metering_1)
partialPowerData$Sub_metering_2 <- as.numeric(partialPowerData$Sub_metering_2)
partialPowerData$Sub_metering_3 <- as.numeric(partialPowerData$Sub_metering_3)

# Make plots
x.label <- ""
y.label <- "Energy sub metering"
plot(x = partialPowerData$DateTime, y = partialPowerData$Sub_metering_1, type="l", xlab = x.label, ylab = y.label)
lines(x = partialPowerData$DateTime, y = partialPowerData$Sub_metering_2, type="l", col="red")
lines(x = partialPowerData$DateTime, y = partialPowerData$Sub_metering_3, type="l", col="blue")
legend("topright", lty=c(1,1), col=c("black","red","blue"),
      legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
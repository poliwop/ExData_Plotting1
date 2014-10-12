# Import data, then keep only 2 days of the data
powerData <- read.csv("data/powerData.txt",header=TRUE,sep=";",
                      stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
partialPowerData <- powerData[(powerData$Date >= "2007-02-01") &
                              (powerData$Date <= "2007-02-02"),]

with(partialPowerData, {  
  # Make DateTime column
  DateTime <- as.POSIXct(paste(Date, Time, sep=" "))
  
  # Convert used columns to numeric
  Global_active_power <- as.numeric(Global_active_power)
  Global_reactive_power <- as.numeric(Global_reactive_power)
  Sub_metering_1 <- as.numeric(Sub_metering_1)
  Sub_metering_2 <- as.numeric(Sub_metering_2)
  Sub_metering_3 <- as.numeric(Sub_metering_3)
  Voltage <- as.numeric(Voltage)
  
  # Make plots
  x.label <- "datetime"
  par(mfrow = c(2,2))
  par(mar = c(4,4,4,2))
  par(cex = .7)
  plot(x = DateTime, y = Global_active_power, type="l", xlab = "",
       ylab = "Global Active Power")
  plot(x = DateTime, y = Voltage, type="l", xlab = x.label, ylab = "Voltage")
  plot(x = DateTime, y = Sub_metering_1, type="l", xlab = "",
       ylab = "Energy sub metering")
  lines(x = DateTime, y = Sub_metering_2, type="l", col="red")
  lines(x = DateTime, y = Sub_metering_3, type="l", col="blue")
  legend("topright", lty=c(1,1), col=c("black","red","blue"), bty="n", inset=0.1,
         legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(x = DateTime, y = Global_reactive_power, type="l", xlab=x.label,
       ylab = "Global_reactive_power")
})


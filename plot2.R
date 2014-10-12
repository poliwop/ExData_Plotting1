# Import data, then keep only 2 days of the data
powerData <- read.csv("data/powerData.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
partialPowerData <- powerData[(powerData$Date >= "2007-02-01") & (powerData$Date <= "2007-02-02"),]

# Make DateTime column
partialPowerData$DateTime <- as.POSIXct(paste(partialPowerData$Date, partialPowerData$Time, sep=" "))

# Convert used column to numeric
partialPowerData$Global_active_power <- as.numeric(partialPowerData$Global_active_power)

# Make plot
x.label <- ""
y.label <- "Global Active Power (kilowatts)"
plot(x = partialPowerData$DateTime, y = partialPowerData$Global_active_power, type="l", xlab = x.label, ylab = y.label)
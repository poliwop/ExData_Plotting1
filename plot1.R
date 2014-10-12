# Import data, then keep only 2 days of the data
powerData <- read.csv("data/powerData.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
powerData$Date <- as.Date(powerData$Date, format="%d/%m/%Y")
partialPowerData <- powerData[(powerData$Date >= "2007-02-01") & (powerData$Date <= "2007-02-02"),]

# Convert used column to numeric
partialPowerData$Global_active_power <- as.numeric(partialPowerData$Global_active_power)

# Make plot
plot.label <- "Global Active Power"
x.label <- "Global Active Power (kilowatts)"
plot.color <- "red"
hist(partialPowerData$Global_active_power, main=plot.label, xlab=x.label, col=plot.color)

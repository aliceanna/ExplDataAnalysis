
df <- read.table("./household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
## subset
data <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]
rm(df)

## additional DateTime column
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")




png("plot1.png", width=480, height=480, units = "px", bg = "transparent")

hist(data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

dev.off()
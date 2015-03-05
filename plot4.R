
df <- read.table("./household_power_consumption.txt", 
                 header = TRUE, sep = ";", na.strings = "?", stringsAsFactors=FALSE)

df$Date <- as.Date(df$Date, format="%d/%m/%Y")
## subset
data <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02", ]
rm(df)

## additional DateTime column
data$DateTime <- paste(data$Date, data$Time)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")






png("plot4.png", width=480, height=480, units = "px", bg = "transparent")

Sys.setlocale("LC_TIME", "English")
par(mfcol = c(2,2))

##1
plot(data$DateTime,data$Global_active_power, type="l", xlab="",
     ylab="Global Active Power (kilowatts)")

##2
plot(data$DateTime,data$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", col="black")
lines(data$DateTime,data$Sub_metering_2, type="l", col="red")
lines(data$DateTime,data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))


##3
plot(data$DateTime,data$Voltage, type="l", xlab="datetime", ylab="Voltage")

##4
plot(data$DateTime,data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
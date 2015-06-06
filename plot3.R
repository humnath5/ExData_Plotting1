
		##:::::::::::Assignment1[plot3.R]::::::::::::::::::
                
		#intalling and loading "sqldf" package
		install.packages("sqldf")
		library(sqldf) 

     		#read file [only for required data] using "read.csv.sql()" function 
		#note:downloaded file is in working directory 

		myData<-read.csv.sql("household_power_consumption.csv", 
			sql    = "select * from file where Date in ('1/2/2007','2/2/2007')",
                        header = TRUE, sep  = ";")

                #joinging Date and Time in variable"datetime" and adding one extra column in myDATA

                datetime<-paste(myData$Date,myData$Time)
		myData<-cbind(datetime,myData)

                #strptime fucntion convertes date and time in "POSIXlt" format

		myData$datetime<-strptime(myData$datetime,"%d/%m/%Y %H:%M:%S")


		#//:::::::::::::::::::Plotting:::::::::::::;;::::::::::#//
                #Creates png graphic device with required size
		png(filename="plot3.png",width=480,height=480)
       
		#creates ploting frame with nothing	
		plot(myData$datetime,myData$Sub_metering_1,
				type = "n",			
				xlab = "",
				ylab = "Energy sub metering") 

		#adding different things in plot
               	points(myData$datetime,myData$Sub_metering_1,type="l")
		points(myData$datetime,myData$Sub_metering_2,type="l",col="red")
		points(myData$datetime,myData$Sub_metering_3,type="l",col="blue")
		legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
			lwd = 1,col = c("black","red","blue"))

	        dev.off()# closing graphic device


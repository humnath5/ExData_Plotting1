
		##:::::::::::Assignment1[plot1.R]::::::::::::::::::
                
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


                #//:::::::::::::::::::Plotting:::::::::::#//
                #Creates png graphic device with required size
		png(filename="plot1.png",width=480,height=480)
     
		hist(myData$Global_active_power,
				col = "red",
				main = "Global Active Power",
				xlab = "Global Active Power (kilowatts)")

		dev.off()# closing graphic device


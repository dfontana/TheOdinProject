# Program that will tell you when a billion seconds is from the precise time inputted
def billion
	print "Enter a time in numerical format (Month:Day:Year:Hour:Min:Sec)\n Use military time!:  "
	userInput = gets.chomp.split(":")
	
	month = userInput[0].to_i
	day = userInput[1].to_i
	year = userInput[2].to_i
	hour = userInput[3].to_i
	minute = userInput[4].to_i
	second = userInput[5].to_i
	
	startTime = Time.mktime(year, month, day, hour, minute, second)
	endTime = startTime + 1000000000
	
	print "...1 Billion Seconds later..."
	puts endTime.strftime("  %m-%d-%Y %H:%M:%S")
end

billion()

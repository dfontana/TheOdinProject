#Program that asks for year, month, day of birthday and will compute age. Prints "HOORAY!" for each birthday they've had.

def age
	print "Enter your birthday in 00/00/0000 format\n (Month, Day, Year):  "
	userInput = gets.chomp.split("/")
	
	day = userInput[1].to_i
	month = userInput[0].to_i
	year = userInput[2].to_i
	
	birthday = Time.mktime(year, month, day)
	today = Time.new
	
	if birthday.month < today.month or ((birthday.month == today.month) and (birthday.day <= today.day))
		ageYears = today.year - birthday.year
	elsif birthday.month > today.month or birthday.month == today.month
		ageYears = today.year - birthday.year - 1
	end
	
	puts "\nYou are #{ageYears} Years Old!"
	ageYears.times{puts "HORRAY!" }	
end

age()

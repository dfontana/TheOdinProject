#Program that will ask for a start and end year and then 'puts' all leap
#	years between the two years (inclusive). Leap years are years that are
# divisible by 4 but not 100 unless divisible by 400

def year
	print "Enter a Starting Year:  "
	year1 = gets.chomp.to_i
	
	print "Enter an Ending Year:  "
	year2 = gets.chomp.to_i
	
	while year2 >= year1
		isLeap(year1)
		year1 += 1
	end
end

#puts the year if it is a leap, otherwise does nothing
def isLeap(year)
	if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)
		puts year
	end
end

year()

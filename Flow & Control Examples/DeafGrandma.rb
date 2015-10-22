#Program that responds "HUH?! SPEAK UP, SONNY!" if the user doesn't input in all
#	capital letters. If user does so, the grandma replies with "NO, NOT SINCE XXXX!" 
#	Where XXXX is a random year between 1930 and 1950. The only escape is saying BYE 3
# times in a row

def deaf
	puts "Grandma:  HELLO SONNY!"
	
	loop do
		triggered = false
		if talking() == false
			puts "*Grandma doesn't want to say goodbye*"
			if talking() == false
				puts "*Grandma doesn't want to say goodbye*"
				if talking() == false
					triggered = true
				end
			end
		end
		break if triggered == true
	end
end

def talking
		print "Respond:  "
		userText = gets.chomp
		
		if userText != 'BYE'
			if userText.upcase == userText
				year = rand(21) + 1930
				puts "Grandma:  NO, NOT SINCE #{year}!"
			else
				puts "Grandma:  HUH?! SPEAK UP, SONNY"
			end
			return true
		else
			return false
		end
end

deaf()

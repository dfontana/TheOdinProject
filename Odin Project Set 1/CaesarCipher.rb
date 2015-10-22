# Program that consumes a string and a number and performs a Caesar Cipher on it.
# This type of cipher shifts the letters of the word by the number provided. For example "Hi" 5 would become a right shift, "Mn"
# Negative numbers shift the other way

def cipher(string, offset)
	#Splits the inputted string into an array of characters
	input = string.split('') 
	
	#This will store our output string
	output = ''
	
	#First we define an array of letters to generate our hashes from
	letters = ('a'..'z').to_a 
	
	#Generate the hash mapping numbers to letters
	numToLetter = Hash.new()
	key = 0

	loop do
		value = letters[key]
		numToLetter[key] = value
		key += 1
		break if key == 26
	end
	
	#BEGIN LOOP OF STRING
	posInString = 0  #i is a position tracker in the string
	loop do
		makeUppercase = false #flag tracking case of letter

		#1) Determine if we are dealing with letter or punctuation
		if numToLetter.has_value?(input[posInString].downcase)
			#2) Determine case before we scramble the number.
			if !(numToLetter.has_value?(input[posInString]))
				makeUppercase = true
			end

			#3) Determine the offsetted letter
			hashKey = numToLetter.key(input[posInString].downcase)
			if (hashKey + offset) > 25
				offsetKey = (offset + hashKey) - 26
			elsif (hashKey + offset) < 0
				offsetKey = 26 - (hashKey + offset)
			else
				offsetKey = hashKey + offset
			end
			
			#4)Set the value in the output!
			if makeUppercase
				output[posInString] = numToLetter[offsetKey].upcase
			else
				output[posInString] = numToLetter[offsetKey]
			end

		else #5) It wasn't a letter (aka inside our hash), just map the punctuation
			output[posInString] = input[posInString]
		end

		posInString += 1
		break if posInString > (input.size - 1)
	end #END LOOP OF STRING

	puts "You ciphered \'"+string+"\' into \'"+output+"\'" 
end

cipher('Hi!', 5) #Mn!
cipher('Hi!', -5)
cipher('Does a REALLY odd string! woRk that wEll?', 24)

#Expand upon englishNumber. First, put in thousands. So it should return 'one thousand' instead of 'ten hundred' and 'ten thousand' instead of 'one hundred hundred'.
#Program to output the english counterpart to a positive integer
def englishNumber number
  if number < 0  # No negative numbers.
    return 'Please enter a number that isn\'t negative.'
  end
  if number == 0
    return 'zero'
  end


  numString = ''  # This is the string we will return.

  onesPlace = ['one',     'two',       'three',    'four',     'five',
               'six',     'seven',     'eight',    'nine']
  tensPlace = ['ten',     'twenty',    'thirty',   'forty',    'fifty',
               'sixty',   'seventy',   'eighty',   'ninety']
  teenagers = ['eleven',  'twelve',    'thirteen', 'fourteen', 'fifteen',
               'sixteen', 'seventeen', 'eighteen', 'nineteen']

  # "left" is how much of the number we still have left to write out.
  # "write" is the part we are writing out right now.
  left  = number
	
	write = left/1000000000000				 # How many trillions left to write out?
	left = left - write*1000000000000  # Subtract off those thousands
	
	if write > 0
		trillions = englishNumber write
		numString = numString + trillions + ' trillion'
		
		if left > 0
			numString = numString + ' '
		end
	end
	
	write = left/1000000000				  # How many billions left to write out?
	left = left - write*1000000000  # Subtract off those thousands
	
	if write > 0
		billions = englishNumber write
		numString = numString + billions + ' billion'
		
		if left > 0
			numString = numString + ' '
		end
	end
	
	write = left/1000000				 # How many millions left to write out?
	left = left - write*1000000  # Subtract off those thousands
	
	if write > 0
		millions = englishNumber write
		numString = numString + millions + ' million'
		
		if left > 0
			numString = numString + ' '
		end
	end
	
	write = left/1000 				# How many thousands left to write out?
	left = left - write*1000  # Subtract off those thousands
	
	if write > 0
		thousands = englishNumber write
		numString = numString + thousands + ' thousand'
		
		if left > 0
			numString = numString + ' '
		end
	end
	
  write = left/100          # How many hundreds left to write out?
  left  = left - write*100  # Subtract off those hundreds.

  if write > 0
    hundreds  = englishNumber write
    numString = numString + hundreds + ' hundred'

    if left > 0
      # So we don't write 'two hundredfifty-one'...
      numString = numString + ' '
    end
  end

  write = left/10          # How many tens left to write out?
  left  = left - write*10  # Subtract off those tens.

  if write > 0
		if ((write == 1) and (left > 0)) #Deal with the teens, since we can't connect single digits for their english terms
      numString = numString + teenagers[left-1]
			left = 0 # Nothing left to write because teens deals with the ones place
    else
      numString = numString + tensPlace[write-1]
    end

    if left > 0
      # So we don't write 'sixtyfour'...
      numString = numString + '-'
    end
  end

  write = left  # How many ones left to write out?
  left  = 0     # Subtract off those ones.

  if write > 0
    numString = numString + onesPlace[write-1]
    # The "-1" is because onesPlace[3] is 'four', not 'three'.
  end

  # Now we just return "numString"...
  numString
end


def sing(bottlesLeft)
	#define next amount of bottles to be left on the wall  (and the proper pluralization of 'bottles')
	#edge case: 1, which the next amount is 0 but sung as 'no more'
	extraBottleWord = 'bottles'
	bottlesLeftNum = bottlesLeft
	if bottlesLeft != 1
		nextBottle = englishNumber(bottlesLeft - 1)
		bottleWord = 'bottles'
		if nextBottle == '1'
			extraBottleWord = 'bottle'
		end
	elsif bottlesLeft == 1
		nextBottle = 'No more'
		bottleWord = 'bottle'
	end
	
	#define bottles left on the wall
	#edge case: 0, which is sung as 'no more'
	if bottlesLeft != 0
		bottlesLeft = englishNumber(bottlesLeft)
	elsif bottlesLeft == 0
		bottlesLeft = 'No more'
	end
	


	#Sing the song on recursive mode, until the final phrase
	puts bottlesLeft + " " + bottleWord + " of beer on the wall, " + bottlesLeft + " " + bottleWord + " of beer!"
	if bottlesLeftNum > 0
		puts "You take one down, pass it around, " + nextBottle + " " + extraBottleWord + " of beer on the wall!"
		sing(bottlesLeftNum - 1)
	elsif bottlesLeft == 'No more'	
		puts "Go to the store and buy some more, 99 bottles of beer on the wall."
	end
end

#Start the song!
sing(99)

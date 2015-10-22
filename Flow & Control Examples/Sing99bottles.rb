#Program to print the lyrics to the song 99 Bottles of Beer on the Wall

def sing(bottlesLeft=99)
	#define next amount of bottles to be left on the wall  (and the proper pluralization of 'bottles')
	#edge case: 1, which the next amount is 0 but sung as 'no more'
	extraBottleWord = 'bottles'
	if bottlesLeft != 1
		nextBottle = (bottlesLeft - 1).to_s
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
		bottlesLeft = bottlesLeft.to_s
	elsif bottlesLeft == 0
		bottlesLeft = 'No more'
	end
	


	#Sing the song on recursive mode, until the final phrase
	puts bottlesLeft + " " + bottleWord + " of beer on the wall, " + bottlesLeft + " " + bottleWord + " of beer!"
	if bottlesLeft.to_i > 0
		puts "You take one down, pass it around, " + nextBottle + " " + extraBottleWord + " of beer on the wall!"
		sing(bottlesLeft.to_i - 1)
	elsif bottlesLeft == 'No more'	
		puts "Go to the store and buy some more, 99 bottles of beer on the wall."
	end
end

#Start the song!
sing()

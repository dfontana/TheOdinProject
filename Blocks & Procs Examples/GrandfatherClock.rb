=begin
Write a method which takes a block and calls it once for each hour that has passed today. 
Test your method out with a few different blocks (if I were to pass in the block do puts 'DONG!' end). 

Hint: You can use  Time.now.hour to get the current hour. However, this returns a number between 0 and 23, so you will have to alter those numbers in order to get ordinary clock-face numbers (1 to 12).
A grandfather clock charms the according to the hour (so 12 for 12 or 1 for 1, no matter Am or PM)
=end

def grandfather(&procBlock)
	
	crtTime = Time.now.hour #0 - 23
	
	if crtTime >= 13   # Adjust the evening hours to be 1-11
		crtTime -= 12 
	elsif crtTime == 0 # Adjust 0 to be 12
		crtTime = 12
	end								 # 1-12 don't need adjustment, so they are fine.
	
	loop do
		crtTime.times{procBlock.call}
		
		crtTime -= 1
		break if crtTime == 0
	end
end

grandfather do 
	puts 'DONG!' 
end

grandfather do
  number = 1

  25000.times do
    number = number + number
  end

  # Show the number of digits in this HUGE number.
  puts number.to_s.length.to_s+' digits'
end

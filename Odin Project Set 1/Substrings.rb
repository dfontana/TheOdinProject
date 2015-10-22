#Program that consumes an array of valid substrings (the dictionary), and a
# phrase, returning a hash of all substrings found in the phrase and their 
# frequencies

def substrings(phrase, substrings)
	
	#1) Break phrase into words array and initilize the Hash
	input = phrase.downcase.split(" ")
	frequencies = Hash.new(0)
	
	#2) Iterate through input, looking for each element in substring. Add to hash
	#		as appropriate
	input.each{|word| substrings.each{|substring|
		if word.include?(substring)
			frequencies[substring] += 1
		end}}
	
	#3) Return the Completed Hash
	return frequencies
end

def printHash(hash)
	hash.each{|key, value| puts "  #{key}:  #{value}"}
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i",
	            "low","own","part","partner","sit"]

puts "1st Hash:::"
printHash(substrings("below", dictionary))
puts "2nd Hash:::"
printHash(substrings("Howdy partner, sit down! How's it going?", dictionary))

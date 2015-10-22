#Program that takes an array of "stock prices" (integers) of size 7 (one for 
# each hypothetical day) and produces an array of size 2 indicating the best 
# day to buy and sell respectively. (Start at 0) Watch out for ordering: You 
# have to buy before selling.

def stock_picker(stocks)
	#1) Find Pairs
	pairs = stocks.combination(2).to_a
	
	#2) Iterate pairs and find pair with largest difference
	bestPair = [0,0]
	pairs.each{|pair| 
		if (pair[1] - pair[0]) > (bestPair[1] - bestPair[0])
			bestPair.replace(pair)
		end}
	
	#3) Check if a pair was found
	if bestPair[0] == 0 and bestPair[1] == 0
		puts "No profit margin found in given range."
	else
		#4) Find the indexes, Low always appears first. 
		lowIndex = stocks.index(bestPair[0]) 
		highIndex = Array.new()
		loop do
			highIndex = stocks.index(bestPair[1])
			break if highIndex > lowIndex
		end
		
		#5) Return the good day pair
		return [lowIndex, highIndex]
	end
end

puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect #expect [1,4]
puts stock_picker([17,16,15,14,13,12,11,10,9]).inspect

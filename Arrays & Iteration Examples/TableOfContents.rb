#Program that takes an array of information reguarding chapter titles and page number and produces a formatted table of contents in the command line
# The program allows the user to continuously add and remove lines, showing a preview after each command
def main
	lineWidth = 80
	contents = []
	makeTable = true
	printHelp()

	loop do
		print "\nCommand:  "
		userInput = gets.chomp
		break if userInput.downcase == 'finished'
		
		breakdown = userInput.split(",")
		command = breakdown[0].downcase
		
		if command == 'add'
			if breakdown.length == 4
				contents = addToArray(contents, breakdown)
				makeTable = true
			else
				makeTable = false
				puts "Invalid Syntax. Please Try Again or Type 'Help'"
			end
		elsif command == 'remove'
			if breakdown.length == 2 && contents.length != 0
				contents = removeFromArray(contents, breakdown)
				makeTable = true
			else
				makeTable = false
				puts "Invalid Syntax or Size. Please Try Again or Type 'Help'"
			end
		elsif command == 'help'
			printHelp()
			makeTable = false
		else
			puts "Invalid Command. Please Try Again."
			makeTable = false
		end
		
		if makeTable
			makeTable(lineWidth, contents)
		end
	end
end


def addToArray(contents, breakdown)
	return contents.push(breakdown[1].strip.to_i).push(breakdown[2]).push(breakdown[3].strip.to_i)
end

def removeFromArray(contents, breakdown)
	index = contents.index(breakdown[1].strip.to_i)
	if contents[index] == contents[index + 1]
		index += 1
	end
	contents.delete_at(index)
	contents.delete_at(index)
	contents.delete_at(index)
	return contents
end

def makeTable(lineWidth, contents)
	puts
	puts 'Table Of Contents'.center(lineWidth)
	puts
	contents.each_slice(3){|chapter| puts ("Chapter #{chapter[0]}: " + chapter[1].strip).ljust(lineWidth/2) + ("Page #{chapter[2]}").rjust(lineWidth/2)}
end


def printHelp
	puts "Instructions:"
	puts "  Type 'Add,' followed by the Chapter Number, Chapter Name, and starting page"
	puts "    to add a chapter to the table. Example: Add, 1, Hello World, 1"
	puts "  Type Keyword 'Remove,' followed by Chapter Number to remove that chapter"
	puts "    Example: Remove, 1"
	puts "  To finish entering data, type 'Finished'"
	puts
	puts "  To See these instructions again type 'Help'"
	puts "  **NOTE** Capitalization does not matter for Keywords."
end

main()
	
	

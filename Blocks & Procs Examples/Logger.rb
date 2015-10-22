=begin
Basic Logger
+ Write a method called log which takes a string description of a block and a block. 
+ It should puts a string telling that it has started the block, and another string telling you when it has finished the block
	and telling you what the block returned. 
+ Test your method by sending it a code block. Inside the block, put another call to log, passing another block to it. (This is called nesting.)

Better Logger
+ Add indenting to inner logger calls. To do this, you'll need to keep track of how deeply nested you are every time the logger wants to write something. To do this, use a global variable, a variable you can see from anywhere in your code. To make a global variable, just precede your variable name with $, like these:  $global, $nestingDepth, and $bigTopPeeWee. In the end, your logger should output code like this:
=end

$nestingDepth = 0

def logger(description, &block)
	$nestingDepth.times{print "  "}			#Indent beginnings
	puts "Beginning \'"+description+"\'..."
	
	$nestingDepth += 1
	retval = block.call
	$nestingDepth -= 1
	
	$nestingDepth.times{print "  "}	
	puts "...\'"+description+"\' finished. Returned: #{retval}"
	
	
end

logger 'isDone' do 
	
	logger 'add 5' do
		number = 1
		number += 5
	end
	
	logger 'dongGiver' do
		'dong'
	end
	
	true
end

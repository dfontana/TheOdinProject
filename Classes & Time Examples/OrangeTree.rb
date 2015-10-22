=begin
DONE: Make an OrangeTree class. 
DONE: It should have a height method which returns its height
DONE: a  oneYearPasses method, which, when called, ages the tree one year. Each year the tree grows taller, and after some number of years (again, your call) the tree should die. For the first few years, it should not produce fruit, but after a while it should, and I guess that older trees produce more each year than younger trees... whatever you think makes most sense. 

DONE: countTheOranges (which returns the number of oranges on the tree), and pickAnOrange (which reduces the @orangeCount by one and returns a string telling you how delicious the orange was, or else it just tells you that there are no more oranges to pick this year). Make sure that any oranges you don't pick one year fall off before the next year.
=end

class OrangeTree
	@height
	@age
	@fruitCount
	@productionPerYear
	
	
	def initialize
		puts "You plant an Orange Tree..."
		@height = 0
		@age = 0
		@fruitCount = 0
		@productionPerYear = 0
	end
	
	def height
		return @height
	end
	
	def oneYearPasses
		@fruitCount = 0
		@age += 1
		@height += 1
		
		puts "A year has passed and the tree is #{@age} years old and #{@height} feet tall!"
		
		if @age >= 5
			print "The tree is producing fruit this year!"
			@productionPerYear += @age * 2
			@fruitCount += @productionPerYear
			print " It made #{@fruitCount} Oranges, Wow!\n"
		end
		
		if @age >= 10
			puts "The orange tree has grown too old died this year :("
			exit # Program over
		end
		
		
	end
	
	def countTheOranges
		return @fruitCount
	end
	
	def pickAnOrange

		if @fruitCount > 0 and @age >= 5
			@fruitCount -= 1
			puts "This one is really tasty!"
		elsif @age >= 5
			puts "Sadly, there are no more oranges this year :("
		else
			puts "The tree hasn't started making fruit yet!"
		end
	end
end

myTree = OrangeTree.new
myTree.oneYearPasses   #1
myTree.oneYearPasses
myTree.oneYearPasses
myTree.oneYearPasses
myTree.oneYearPasses 	 #5 Should say tree is making fruit
11.times{myTree.pickAnOrange} #Should end with sadly, not more oranges...
myTree.oneYearPasses
myTree.oneYearPasses
myTree.oneYearPasses
myTree.oneYearPasses #9 about to die
myTree.oneYearPasses #should exit!



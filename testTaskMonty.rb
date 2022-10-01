class Monty
	attr_reader :changeDoor

	def initialize(chD = false)
		@changeDoor = chD
		
	end

	def simulate
		win = false

		doors = Array.new(3, false)

		#it chooses random dorr with car
		carNum = rand(3)
		doors[carNum] = true
		
		theArray = [0, 1, 2]

		#it (as player) chooses random door. 
		chooseDoor = rand(3)

		theArray.delete_if{|num| num == carNum}
		theArray.delete_if{|num| num == chooseDoor}

		if (theArray.length > 1) 
			goatDoor = theArray[rand(2)]
		else goatDoor = theArray[0]
		end

		if (@changeDoor)
			theArray = [0, 1, 2]
			theArray.delete_if{|num| num == goatDoor}
			theArray.delete_if{|num| num == chooseDoor}
			chooseDoor = theArray[0]
		end

		if chooseDoor == carNum
			win = true
		end

		return win
	end

	def simulateN(n = 100)

		testcount = n
		wincount = 0
		percent = 0.0

		for i in 1..testcount 
			res = self.simulate()

			if res == true 
				wincount+=1
			end	
		end

		percent = ((wincount.to_f * 100)/testcount.to_f)

		puts "was coice changed?: #{@changeDoor}"
		puts "tests count: #{testcount}"
		puts "wins: #{wincount}"
		puts "percentage : #{percent}"
		puts

		return percent
	end
	
end

#=============================================#

changeDoor = Monty.new(true)
noChangeDoor = Monty.new(false)

changePercent = changeDoor.simulateN(1000)
noChangePercent = noChangeDoor.simulateN(1000)

puts
puts 'Result:'
puts "Percentage of wins if player changes door -- #{changePercent}%"
puts "Percentage of wins if player does NOT change door -- #{noChangePercent}%"


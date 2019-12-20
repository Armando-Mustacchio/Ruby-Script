#!/usr/bin/ruby
#Histogram



#Ask user to input the number of random integers to generate
puts("How many random integer numbers do you want to generate?")
INTEGER_NUMBERS = gets.chomp.to_i

#Ask input for the maximum value for the random number
puts("Please input the maximum value for the random numbers?")
MAXIMUM_VALUE = gets.chomp.to_i

#Create the array with rand method
myArray = Array.new
num = Array.new(INTEGER_NUMBERS)

for i in 0..INTEGER_NUMBERS-1
	num[i] =rand(MAXIMUM_VALUE) + 1
end


histogram = Hash.new(0)

#Correctly store frequencies in hash in ascending order
num.each { |index| histogram[index]+= 1}
histogram = histogram.sort{|a,b| a[0]<=>b[0]}

#Display frequencies in ascending order of number
histogram.each do |k,v|
	line = "The frequency of: " + k.to_s + "|"
	for index in 0..v-1
		line += ("#")
	end


puts line
end

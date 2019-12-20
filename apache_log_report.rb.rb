#!/usr/bin/ruby
#Armando Mustacchio
#CIT 383 001
#10/20/19


#Read log file access_log
line_array = File.readlines("access_log.txt")

#Create empty array 
ip_address = Hash.new(0)
url_accessed = Hash.new(0)
http_summary = Hash.new(0)

#iterate over the lines with the regex to get the output needed
line_array.each do |line| 
	md = line.match(/^([:\d\.]+) .*\[.*\].*\"[A-Z]+ *(.+) (HTTP) *([^\s]+) *([^\s]+)/)
	ip_address[md[1]]+=1
	
	url_accessed[md[2]]+=1
	
	http_summary[md[5]]+=1
end

#Print out the answers in a histogram format
puts "Frequency of Client IP Addresses:"

ip_address.each do |k, v|
	printf k.ljust(20)
	v.times {print "*"}	
	print "\n"
end

puts "Frequency of URLs Accesses:"
url_accessed.each do |k,v|
	print k.ljust(60)	
	print v
	print "\n"

end

#Display URL percentages that result in each status code
puts "HTTP Status Code Summary:"
http_summary.each do |k,v|
	puts " #{k} #{(v * 100.0 / line_array.size).round(2)}%"
	# printf("%-5s",k)
	  # puts ("#{percentage}%")
end


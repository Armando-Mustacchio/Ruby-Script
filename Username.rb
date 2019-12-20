#!/usr/bin/ruby
#Armando Mustacchio
#CIT383 Final
#12/12/19


#Required library
require 'csv'
require 'securerandom'

#Create empty array used to store data
name = []
fname = []
mname = []
lname = []
username = []
userinfo = []

#Iterate to recored the information in CSV file
CSV.foreach('employee_data.csv', :headers => true) do |record|
	name = record.values_at(0..2)
	fname = name[0]
	mname = name[-1]
	lname = name[1]
	#Crate the uname adding all the names together
	uname = lname +fname[0]+mname[-1]

	#Use if statement to add suffic at the end of a uname if ther eis a duplicate
	if username.include?(uname)
		suffic = uname[-1]
		if suffix.to_i >= 1
			suffic = suffic.to_i+1
			uname += suffic.to_s
		else
			uname += 1.to_s
		end
	end

#Append the array to a username
username<<uname
userinfo<<[fname,mname,lname,uname,SecureRandom.base64(6)]
end

#comment out permission denied
#system(useradd -c "#{fname}","#{mname},"#{lname}","#{uname}")

#Using csv.open to create the users account to send info from userinfo
CSV.open('useraccounts.csv', "w") do |writer|
	userinfo.each{|record| writer<<record}
end

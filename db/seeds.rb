# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'CSV'
c = CSV.open 'public/data.csv'
c.drop(1).first(3900).each  do |row|
	match = row[2].match(/(\d{2}):\d{2}:\d{2}\s(\w{2})/)
	Call.create(address: row[0], call_type: row[1], call_time: "#{match[1]} #{match[2]}", location: row[5])
end

class CallsController < ApplicationController
	def heat_map
		@calls = Call.all
		@points = ""
		@calls.each do |call|
			@points += "new google.maps.LatLng#{call.location},"
		end
		@points
	end

	def type
		@data = ""
		@calls = Call.all
		types_array = @calls.collect {|call| call.call_type}
		other = 0
		types_array.uniq.each do |call|
			value = (types_array.count(call)/ @calls.count.to_f) * 100
			if value > 1
				@data += "{value: #{value.to_i} , label: '#{call}'},"
			else
				other += value
			end
		end
		@data += "{value: #{other.to_i} , label: 'Other'},"
	end

	def time
		am_hours = (1..12).to_a.reverse.map! { |n| "#{n} AM"  }
		pm_hours = (1..12).to_a.reverse.map! { |n| "#{n} PM"  }
		all_hours = am_hours + pm_hours
		@calls = Call.all.collect {|call| call.call_time}
		puts "______________"

		puts Call.where(call_time: "9 AM").count
		@data = ""
		all_hours.reverse.each do |hour|
			@data += "{x: '#{hour}' , y: #{@calls.count(hour)}},"
		end
		@data
		# {x: '2011 Q1', y: 3, z: 2, a: 3},
	end
end

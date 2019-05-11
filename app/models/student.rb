class Student < ActiveRecord::Base
	
	def self.table_name
		'students'
	end
end

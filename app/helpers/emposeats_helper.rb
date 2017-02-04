module EmposeatsHelper
	def get_color_class(average)
		case average
		when 0..50
			'level1'
		when 51..100
			'level2'
		when 101..200
			'level3'
		when 201..300
			'level4'
		when 301..600
			'level5'
		end
	end
end

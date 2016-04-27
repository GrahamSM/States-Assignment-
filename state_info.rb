require 'pp'
require 'pry'

states = {
  OR: {
  	name: 'Oregon',
  	cities: ['Bexley', 'Campbell', 'Celina']
  		},
  FL: {
  	name: 'Florida',
  	cities: ['Orlando', 'Naples']
  },
  CA: {
  	name: 'California',
  	cities: ['Berkley', 'Los Angeles']
  },
  NY: {
  	name: 'New York',
  	cities: ['New York', 'Ogdensburg']
  },
  MI: {
  	name: 'Michigan',
  	cities: ['Anarbour', 'Acme', 'Clare']
  },
}

taxes = {
	OR: 7.5,
	FL: 8.6,
	CA: 12.4,
	NY: 18,
	MY: 4.2,
	OH: 7.6,
}

def describe_state(code, states)
	code = code.to_sym
	num_cities = states[code][:cities].length
	all_cities = ""
	states[code][:cities].each {|i| all_cities << (i+", ")}
	description = "#{code} is for #{states[code][:name]}. It has #{num_cities} major cities " + all_cities
end

def calculate_tax(code, amount, taxes)
	tax = taxes[code.to_sym]
	taxable_amount = tax/100
	total_tax = "Tax payable: " + (amount*taxable_amount).to_s
end

def find_state_for_city(target_city, states)
	states.each do |state, detail_hash|
		detail_hash[:cities].each do |i|
			if i.to_s == target_city
				return state, target_city
			end
		end
	end
end


ohio_described = describe_state("FL", states)
puts ohio_described

ohio_purchase = calculate_tax("OH", 126, taxes)
puts ohio_purchase

puts "Searching... "
state, city = find_state_for_city("Anarbour", states)
puts "State found. #{city}'s state is: " + states[state][:name]

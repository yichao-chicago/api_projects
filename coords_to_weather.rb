require 'open-uri'
require 'json'

puts "Let's get the weather forecast for your location."

puts "What is the latitude?"
the_latitude = gets.chomp

puts "What is the longitude?"
the_longitude = gets.chomp

# Your code goes below. Use the same approach as you did in
#   address_to_coords.rb to read from a remote API and parse
#   the results.
url_of_data_we_want = "https://api.forecast.io/forecast/353acb2f354f8e32c73768faf808d6c0/#{the_latitude},#{the_longitude}"
raw_data = open(url_of_data_we_want).read
parsed_data = JSON.parse(raw_data)

# Ultimately, we want the following line to work when uncommented:
the_temperature = parsed_data["currently"]["temperature"]
the_hour_outlook = parsed_data["hourly"]["data"][0]["summary"]
the_day_outlook = parsed_data["daily"]["data"][0]["summary"]

puts "The current temperature at #{the_latitude}, #{the_longitude} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"

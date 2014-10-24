require 'open-uri'
require 'json'
# Tc = (Tf - 32)*5/9

puts "Let's get the weather forecast for your address."

puts "What is the address you would like to know the weather for?"
the_address = gets.chomp
url_safe_address = URI.encode(the_address)

# Your code goes below.
url_for_geocoding = "https://maps.googleapis.com/maps/api/geocode/json?address=" + url_safe_address
parsed_data = JSON.parse(open(url_for_geocoding).read)
the_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
the_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

url_for_forecastAPI = "https://api.forecast.io/forecast/353acb2f354f8e32c73768faf808d6c0/#{the_latitude},#{the_longitude}"
parsed_data2 = JSON.parse(open(url_for_forecastAPI).read)

the_temperature = parsed_data2["currently"]["temperature"]
the_hour_outlook = parsed_data2["hourly"]["data"][0]["summary"]
the_day_outlook = parsed_data2["daily"]["data"][0]["summary"]

# Ultimately, we want the following line to work when uncommented:

puts "The current temperature at #{the_address} is #{the_temperature} degrees."
puts "The outlook for the next hour is: #{the_hour_outlook}"
puts "The outlook for the next day is: #{the_day_outlook}"

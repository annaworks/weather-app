require 'weatherboy'

def get_weather (city)
	
	weatherboy = Weatherboy.new(city)
	w = weatherboy.current
	weather = w.weather
	temp = w.temp_c
	puts "The weather in #{city} is #{weather} and the temperature is #{temp} Celsius."
	

end

def get_forecast(city)
	forecast = Weatherboy.new(city).forecasts
	require 'date'
	today = Date.today
	date = [today, today+1, today+2, today+3, today+4, today+5]
	date.zip(forecast).each do |date,forecast|
		weekday = date.strftime('%w').to_i
		todaynum = Time.now.strftime('%w').to_i
		if weekday == todaynum
			dayName = 'Today'
		elsif weekday == todaynum + 1
			dayName = "Tomorrow"
		else
			dayName = date.strftime('%A')
		end
		puts (dayName + ", " + date.strftime('%b') + ", " + date.strftime('%d') + ", " + date.strftime('%Y'))
		puts "Temp High/Low: " + forecast.low_c + "C/" + forecast.high_c + "C   Conditions:" + forecast.conditions + "."
	end
end

puts "City:"
city = gets.chomp
get_weather(city)
get_forecast(city)
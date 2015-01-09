require 'soda'
require 'pry'

my_app_token = 'xQSxQTgxE84h7p1i4byfItWMR'

client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => "xQSxQTgxE84h7p1i4byfItWMR"})

puts "Welcome to NYC SAT SCORE searcher."
puts "Enter a minimum score that you want to search by (between 0 and 800)"
score = gets.chomp
puts "Please enter the subject of SAT score you want to search by:"
puts "Your options are 'critical_reading_mean', 'writing_mean' and 'mathematics_mean'"
subject = gets.chomp

score_response = client.get("zt9s-n5aj", {'$where' => "#{subject} > #{score}"})

score_response.each do |school|
  p school.school_name
end




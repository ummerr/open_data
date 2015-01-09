require 'soda'
require 'pry'

my_app_token = 'xQSxQTgxE84h7p1i4byfItWMR'

client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => "xQSxQTgxE84h7p1i4byfItWMR"})

score_response = client.get("zt9s-n5aj")

score_response.each do |row|
  row.each do |element|
    p element
  end
end




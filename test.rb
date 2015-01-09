# api_endpoint = https://data.cityofnewyork.us/resource/zt9s-n5aj.json
require 'soda'

my_app_token = 'xQSxQTgxE84h7p1i4byfItWMR'

client = SODA::Client.new({:domain => "data.cityofnewyork.us", :app_token => "xQSxQTgxE84h7p1i4byfItWMR"})

# reading_response = client.get("zt9s-n5aj", {'$where' => "critical_reading_mean > 600"})
# math_response = client.get("zt9s-n5aj", {'$where' => "mathematics_mean > 600"})
# writing_response = client.get("zt9s-n5aj", {'$where' => "writing_mean > 600"})

score_response = client.get("zt9s-n5aj", {'$where' => "writing_mean > 600", '$where' => "critical_reading_mean > 600", '$where' => "mathematics_mean > 600"})

schools = score_response.each do |school|
            puts school.school_name
          end

p schools

# p reading_response
# p math_response
# p writing_response

require 'net/http'
require 'uri'

uri = URI.parse("https://rnm.franceagrimer.fr/prix?M2503:MARCHE")
response = Net::HTTP.get_response(uri)

# puts response.code
puts response.body
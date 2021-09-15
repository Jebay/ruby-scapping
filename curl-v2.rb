require 'net/http'
require 'open-uri'
require 'nokogiri'


uri = Nokogiri::HTML(URI.open('https://rnm.franceagrimer.fr/prix?M2503:MARCHE'))

# https://readysteadycode.com/howto-parse-html-with-ruby-and-nokogiri
uri.search('a').each do |link|
    puts link.content
  end
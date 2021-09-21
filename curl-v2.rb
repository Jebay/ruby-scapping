#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

def web_scraper(url)
    uri = Nokogiri::HTML(URI.open(url))

    # https://readysteadycode.com/howto-parse-html-with-ruby-and-nokogiri

    uri.css('td').each do |link|
        filter = /[[:upper:]]{3,} [[A-Z]]{0,1}[a-z]+/.match(link.content) # Filter fruits & vegetables
        filter_price = /[[\-+]]{0,1}[[:digit:]]{1,}[[.]]{0,1}[[:digit:]]{0,}/.match(link.content) # Filter price
    
    if filter.to_s.length > 0
            puts filter
    end
    if filter_price.to_s.length > 0
            puts filter_price
    end
end

web_scraper('https://rnm.franceagrimer.fr/prix?M2503:MARCHE')
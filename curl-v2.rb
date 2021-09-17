#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

def web_scraper(url)
    uri = Nokogiri::HTML(URI.open(url))

    # https://readysteadycode.com/howto-parse-html-with-ruby-and-nokogiri

    uri.css('td').each do |link|
        filter = /[[:upper:]]{3,} [[A-Z]]{0,1}[a-z]+/.match(link.content) # Filter fruits & vegetables
        # filter = /\d*\R{0}/.match(link.content)
    
    if filter.to_s.length > 0
            puts filter
        end
        # puts link.content
    end
end

web_scraper('https://rnm.franceagrimer.fr/prix?M2503:MARCHE')
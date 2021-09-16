#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

uri = Nokogiri::HTML(URI.open('https://rnm.franceagrimer.fr/prix?M2503:MARCHE'))

# https://readysteadycode.com/howto-parse-html-with-ruby-and-nokogiri

uri.css('a').each do |link|
    puts link.content
  end
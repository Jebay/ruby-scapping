#! /usr/bin/env ruby
# frozen_string_literal: true

# This code was generated with the help of ChatGPT, a language processing model trained by OpenAI.

require 'nokogiri'
require 'open-uri'
require_relative 'fruit'

def web_scraper
  # URL to scrape
  page = Nokogiri::HTML(URI.parse('https://rnm.franceagrimer.fr/prix?M2503:MARCHE').open)

  # Array to store the Fruit objects
  fruits = []

  page.css('table tr').each do |row|
    name = row.css('td:nth-child(1)').text.strip
    price = row.css('td:nth-child(2)').text.strip
    varia = row.css('td:nth-child(3)').text.strip
    min = row.css('td:nth-child(4)').text.strip
    max = row.css('td:nth-child(5)').text.strip

    # Check that the price contains only numbers
    fruits << Fruit.new(name, price, varia, min, max) if /^[0-9]/.match?(price)
  end

  # Print the fruits array
  fruits.each(&:display)
end

web_scraper

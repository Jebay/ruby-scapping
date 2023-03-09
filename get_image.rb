#! /usr/bin/env ruby
# frozen_string_literal: true

require 'i18n'
require 'open-uri'
require 'json'
require 'nokogiri'

def get_image_url(query)
  I18n.available_locales = [:en]
  query = I18n.transliterate(query.to_s)

  url = "https://www.istockphoto.com/fr/search/2/image?&mediatype=photography&excludenudity=true&phrase=#{query}"

  # Send a GET request to the API URL
  response = Nokogiri::HTML(URI.parse(url).open)

  # Extract URLs
  img_tags = response.css('img')
  img_urls = img_tags.map { |img| img['src'] }

  # Find the first URL that contains "https"
  img_urls.find { |url| url.include?('https') }
end

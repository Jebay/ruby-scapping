#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require_relative 'food'

def web_scraper(url)
    filter_result_array = []
    uri = Nokogiri::HTML(URI.open(url))

    uri.css('td').each do |link|
        filter = /[[:upper:]]{3,} [[A-Z]]{0,1}[a-z]+/.match(link.content) # Filter fruits & vegetables
        filter_price = /[[\-+]]{0,1}[[:digit:]]{1,}[[.]]{0,1}[[:digit:]]{0,}/.match(link.content) # Filter price

        if filter.to_s.length > 0
            filter_result_array.push(filter)
            # puts filter
        end
        if filter_price.to_s.length > 0
            filter_result_array.push(filter_price)
            # puts filter_price
        end
    end
    print filter_result_array
end

def create_food_objects(list)
    food_tmp = Food.new("", [])
    res_list = []
    for i in 0..list.length-1
        tmp = /[[:upper:]]{3,} [[A-Z]]{0,1}[a-z]+/.match(list[i])
        tmp_price = /[[\-+]]{0,1}[[:digit:]]{1,}[[.]]{0,1}[[:digit:]]{0,}/.match(list[i])
        if tmp.to_s.length > 0
            if i != 0
                res_list.push(food_tmp)
                food_tmp = Food.new("", [])
            end
            food_tmp.set_name = list[i]
            next
        end
        if tmp_price.to_s.length > 0
            food_tmp.fill_prices = list[i]
            next
        end
    end
    return res_list
end

# web_scraper('https://rnm.franceagrimer.fr/prix?M2503:MARCHE')
test_list = ["RAISIN noir", "6.21", "-0.61", "4.98", "7.99", "RAISIN noir", "5.01", "+0.13", "3.25", "6.49"]
res =  create_food_objects(test_list)
print res
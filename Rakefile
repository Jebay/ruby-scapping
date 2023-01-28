#! /usr/bin/env ruby
# frozen_string_literal: true

# This code was generated with the help of ChatGPT, a language processing model trained by OpenAI.

require 'erb'
require 'nokogiri'
require 'open-uri'
require_relative 'food'

fruits_list = ["ABRICOT", "ANANAS", "BANANE", "CERISE", "CITRON", "CITRON VERT", "CLÉMENTINE", "COING", "DATTE", "FIGUE", "FRAISE", "FRAMBOISE", "FRUIT DE LA PASSION", "GRENADE", "GROSEILLE", "KAKI", "KIWI", "LIMON", "LITCHI", "MANDARINE", "MANGUE", "MELON", "MIRABELLES", "MÛRE", "MYRTILLE", "NOISETTE", "NOIX", "ORANGE", "PAMPLEMOUSSE", "PECHE", "POIRE", "POMME", "PRUNE", "RAISIN"]

vegetables_list = ["AIL", "ARTICHAUT", "ASPERGE", "AUBERGINE", "AVOCAT", "BASILIC", "BETTERAVE", "BETTE", "BROCOLI", "CAROTTE", "CELERI","CÈPE",  "CERFEUIL", "CHAMPIGNON", "CHANTERELLE", "CHAYOTTE", "CHICORÉE", "CHOU", "CHOU-FLEUR", "CHOU-RAVE", "CIBOULETTE", "CONCOMBRE", "CORNICHON", "COURGE", "COURGETTE", "CRESSON", "CÈPE", "ÉCHALOTE", "ENDIVE", "ÉPINARD", "FENOUIL", "GINGEMBRE", "GIROLLE", "HARICOT", "HERBE", "HUILE", "LAITUE", "MÂCHE", "NAVET", "OIGNON", "PATATE", "POIREAU", "POTIRON", "RADIS", "RHUBARBE", "ROQUETTE", "SALADE", "SALSIFIS", "TOMATE", "TOPINAMBOUR", "TOURNESOL", "TURBOT", "VINAIGRE", "WAKAME"]

desc 'Scrape website and generate HMTML'
task :web_scraper do
  # URL to scrape
  page = Nokogiri::HTML(URI.parse('https://rnm.franceagrimer.fr/prix?M0123:MARCHE').open)

  # Array to store the Fruit objects
  fruits =      []
  vegetables =  []

  page.css('table tr').each do |row|
    name = row.css('td:nth-child(1)').text.strip
    price = row.css('td:nth-child(2)').text.strip
    varia = row.css('td:nth-child(3)').text.strip
    min = row.css('td:nth-child(4)').text.strip
    max = row.css('td:nth-child(5)').text.strip

    # Check that the price contains only numbers
    if /^[0-9]/.match?(price)
      if fruits_list.any? { |fruit| name.include?(fruit) }
        fruits << Food.new(name, price, varia, min, max)
      elsif vegetables_list.any? { |vegetable| name.include?(vegetable) }
        vegetables << Food.new(name, price, varia, min, max)
      end
    end
  end

  generate_html(vegetables, 'vegetables.html')
  generate_html(fruits, 'fruits.html')
end

def generate_html(list, output)
  template = File.read('index.html.erb')
  renderer = ERB.new(template)

  # Create a new binding with 'list' as an instance variable
  context = binding
  context.local_variable_set(:foods, list)

  # Render the template with the new binding
  result = renderer.result(context)

  # Write the result to the 'output' HTML file
  File.write(output, result)
end
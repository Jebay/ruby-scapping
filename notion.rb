#! /usr/bin/env ruby
# frozen_string_literal: true

require 'notion-ruby-client'

# Get the NOTION_TOKEN from GitHub Secrets
notion_token = ENV["NOTION_TOKEN"]
page_id = ENV["PAGE_ID"]

# Initialize the Notion API client
notion = Notion::Client.new(token: notion_token)

# retrieves the first page
response = notion.database_query(database_id: page_id)  

# Print the response
puts response
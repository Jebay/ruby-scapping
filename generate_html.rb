#! /usr/bin/env ruby
# frozen_string_literal: true

require 'erb'

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

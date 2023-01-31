# frozen_string_literal: true

# rubocop:disable Metrics/ParameterLists
# Food class to store the attributes of each food
class Food
  def initialize(name, price, varia, min, max, image)
    @name   = name
    @price  = price
    @varia  = varia
    @min    = min
    @max    = max
    @image  = image
  end

  def get_name
    @name
  end

  def set_name=(name)
    @name = name
  end

  def get_price
    @price
  end

  def set_price=(price)
    @price = price
  end

  def get_varia
    @varia
  end

  def set_varia
    @varia = varia
  end

  def get_min
    @min
  end

  def set_min
    @min = min
  end

  def get_max
    @max
  end

  def set_max
    @max = max
  end

  def get_image
    @image
  end

  def set_image
    @image = image
  end

  def display
    puts "#{@name}: Average price #{@price}, delta #{@varia}%, Min price #{@min}, Max price #{@max}, URL #{@image}"
  end
end
# rubocop:enable Metrics/ParameterLists

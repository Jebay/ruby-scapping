class Food
    def initialize(name, prices)
        @name = name
        @prices = prices
    end

    def get_name
        @name
    end
    
    def set_name=(name)
        @name = name
    end

    def get_prices
        @prices
    end
    
    def set_prices=(prices)
        @prices = prices
    end

    def fill_prices=(price)
        @prices = @prices.push(price)
    end

    def display
        puts "#{@name} : Average price #{@prices[0]}, delta #{@price[1]}, Min price #{@price[2]}, Max price #{@price[3]}"
    end
end
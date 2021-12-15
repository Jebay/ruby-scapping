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
        puts "#{@name} : Average price #{@prices[0]}, delta #{@prices[1]}, Min price #{@prices[2]}, Max price #{@prices[3]}"
    end
end
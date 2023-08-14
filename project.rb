 
 class Project
    attr_accessor :type, :revenue, :profit

    def initialize(type, revenue)
      @type = type
      @revenue = revenue
    end

    def calculate_profit
      @profit = @revenue * 0.2 if @type == 'Service'
      @profit = @revenue * 0.4 if @type == 'Product'
    end
  end

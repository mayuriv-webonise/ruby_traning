#Prototype programming
class Car
    attr_accessor :make, :model
  
    def initialize(make, model)
      @make = make
      @model = model
    end
  
    def clone
      Car.new(make, model)
    end
  end
  
  original_car = Car.new("Toyota", "Camry")
  cloned_car = original_car.clone
  
  cloned_car.model = "Corolla"
  
  puts original_car.model  
  puts cloned_car.model  
  

#open classes

module Repetation
    def calculate
        puts "calculated values..."
    end
end
 class MyOpenClass
 include Repetation
end

obj = MyOpenClass.new
puts obj.calculate


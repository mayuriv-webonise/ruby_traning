#Modules and mixins
module Greet
    def geeks_people
      puts 'Hello World!'
    end
  end
  class Class_user
    include Greet
  end
  class Class_employee
    extend Greet
  end
  
  puts Class_user.new.geeks_people
  puts Class_employee.geeks_people
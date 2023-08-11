#class eval, instance eval

class MyClass
end

MyClass.class_eval do
  def self.my_class_method
    puts "This is a class method"
  end
end

MyClass.my_class_method  
class Person
end

person = Person.new
person.instance_eval do
  def greet
    puts "Hello, I'm an instance method"
  end
end

person.greet  
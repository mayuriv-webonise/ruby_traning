#Blocks, Procks and Lambda

#All three mechanisms allow you to encapsulate code for reuse, but they have subtle differences in their behavior and how they handle certain situations. 
#Blocks are used for inline code within method invocations, 
#procs are general-purpose saved blocks,
# and lambdas are special type of procs with stricter argument handling.

#Use Blocks, Procs and Lambda each to write a program which takes array of integers as an input and finds the count of even numbers in the array


#using Blocks
def count_even_numbers(array)
    count = 0
    array.each do |num|
      count += 1 if num.even?
    end
    count
  end
  
 numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  puts "Count of even numbers: #{count_even_numbers(numbers)}"

  #using Procs
  count_even = Proc.new { |num| num.even? }
def count_numbers(array, condition)
  array.count(&condition)
end


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"

#using lambda

count_even = lambda { |num| num.even? }
def count_numbers(array, condition)
  array.count(&condition)
end


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"


#####################################################################################################################################################

require 'csv'

class Employee
  attr_accessor :name, :age, :department, :division, :designation

  def initialize(name, age, department, division, designation)
    @name = name
    @age = age
    @department = department
    @division = division
    @designation = designation
  end
end

class Hr
    attr_reader :employees
  
    def initialize
      @employees = []
    end
  
    def add_employee(name, age, department, division, designation)
      employee = Employee.new(name, age, department, division, designation)
      @employees << employee
      save_to_csv
    end
  
    def get_all_employees
      @employees
    end
  
    private
  
    def save_to_csv
      CSV.open('employees.csv', 'w') do |csv|
        csv << ['Name', 'Age', 'Department', 'Division', 'Designation']
        @employees.each do |employee|
            puts employee
          csv << [employee.name, employee.age, employee.department, employee.division, employee.designation]
        end
      end
    end
  end

  class Department
    attr_reader :name, :department_head, :employees
  
    def initialize(name, department_head)
      @name = name
      @department_head = department_head
      @employees = []
    end
  
    def add_employee(employee)
      @employees << employee
    end
  
    def get_department_employees
      @employees
    end
  end

  class Project
    attr_accessor :type, :revenue, :profit
  
    def initialize(type, revenue, profit)
      @type = type
      @revenue = revenue
      @profit = profit
    end
  end

  hr = Hr.new
engineering = Department.new('Engineering', 'Engineering Head')
hr.add_employee('M testuser', 30, 'Engineering', 'Development', 'Software Engineer')
engineering.add_employee(hr.get_all_employees.last)

service_project = Project.new('Service', 100000, 50000)
product_project = Project.new('Product', 500000, 200000)

puts "Engineering Department Employees: #{engineering.get_department_employees}"
puts "Service Project Revenue: #{service_project.revenue}"
puts "Product Project Profit: #{product_project.profit}"

  
  
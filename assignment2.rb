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

class Department
  attr_accessor :name, :department_head, :employees

  def initialize(name, department_head)
    @name = name
    @department_head = department_head
    @employees = []
  end
end

class Project
  attr_accessor :name, :type, :clients, :profit

  def initialize(name, type, clients, profit)
    @name = name
    @type = type
    @clients = clients
    @profit = profit
  end

end

class Company
  attr_accessor :departments, :projects, :yearly_revenue, :service_profit, :product_profit

  def initialize
    @departments = []
    @projects = []
    @yearly_revenue = 0
    @service_profit = 0
    @product_profit = 0
  end

  def add_department(department)
    @departments << department
  end

  def add_project(project)
    @projects << project
  end

  def add_employee(hr, employee)
    hr.add_employee(employee)
  end

  def get_all_employee_details(hr)
    hr.get_all_employee_details
  end
  def calculate_yearly_revenue()
    
    @projects.each do |project|
 
    @yearly_revenue = project.profit + @yearly_revenue
    end
  end
  def calculate_yearly_profit()
  
    @projects.each do |project|
     if project.type == 'Service'

         @service_profit =  @service_profit + project.profit
     else
  
         @product_profit = @product_profit + project.profit
     end
    end
  end
end

class HR
  attr_accessor :name, :employees

  def initialize(name)
    @name = name
    @employees = []
  end

  def add_employee(employee)
    @employees << employee
    save_to_csv(employee)
  end

  def get_all_employee_details
    @employees.each do |employee|
      puts "Name: #{employee.name}, Age: #{employee.age}, Department: #{employee.department}, Division: #{employee.division}, Designation: #{employee.designation}"
    end
  end

  private

  def save_to_csv(employee)
    CSV.open('employees.csv', 'a+') do |csv|
      csv << [employee.name, employee.age, employee.department, employee.division, employee.designation]
    end
  end
end

# Example usage
company = Company.new

hr_department = Department.new('HR', 'HR Department Head')
engineering_department = Department.new('Engineering', 'Engineering Department Head')
sales_department = Department.new('Sales', 'Sales Department Head')
marketing_department = Department.new('Marketing', 'Marketing Department Head')

company.add_department(hr_department)
company.add_department(engineering_department)
company.add_department(sales_department)
company.add_department(marketing_department)

service_project = Project.new('Healthcare web','Service', 'client 1', 50000)
product_project = Project.new('webonise portal','Product', 'client 2', 200000)


company.add_project(service_project);
company.add_project(product_project);

hr = HR.new('HR Manager')

employee1 = Employee.new('John Doe', 30, 'HR', 'Recruitment', 'Recruiter')
employee2 = Employee.new('Jane Smith', 28, 'Engineering', 'Development', 'Software Engineer')

company.add_employee(hr, employee1)
company.add_employee(hr, employee2)
engineering_department.employees << employee2

company.get_all_employee_details(hr)
company.calculate_yearly_revenue
company.calculate_yearly_profit
puts company.yearly_revenue
puts company.service_profit
puts company.product_profit

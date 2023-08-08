require 'csv'

class Employee
  attr_reader :name, :age, :department, :division, :designation

  def initialize(name, age, department, division, designation)
    @name = name
    @age = age
    @department = department
    @division = division
    @designation = designation
  end

  def to_csv_row
    [name, age, department, division, designation]
  end
end

# Subclasses for different divisions
class DevelopmentEmployee < Employee; end
class QAEmployee < Employee; end
class DevopsEmployee < Employee; end

class EmployeeFactory
  def create_employee(name, age, department, division, designation)
    case division
    when 'Development'
      DevelopmentEmployee.new(name, age, department, division, designation)
    when 'QA'
      QAEmployee.new(name, age, department, division, designation)
    when 'Devops'
      DevopsEmployee.new(name, age, department, division, designation)
    else
      Employee.new(name, age, department, division, designation)
    end
  end
end

class HR
  attr_reader :employees

  def initialize
    @employees = []
  end

  def add_employee(name, age, department, division, designation)
    employee = EmployeeFactory.new.create_employee(name, age, department, division, designation)
    @employees << employee
  end

  def get_all_employees
    @employees
  end

  def save_employees_to_csv
    CSV.open('employees.csv', 'w') do |csv|
      csv << ['Name', 'Age', 'Department', 'Division', 'Designation']
      @employees.each do |employee|
        csv << employee.to_csv_row
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

  def initialize(type, revenue)
    @type = type
    @revenue = revenue
  end

  def calculate_profit
    @profit = @revenue * 0.2 if @type == 'Service'
    @profit = @revenue * 0.4 if @type == 'Product'
  end
end

# Sample usage:
hr = HR.new

hr.add_employee('John Doe', 30, 'Engineering', 'Development', 'Software Engineer')
hr.add_employee('Jane Smith', 28, 'Engineering', 'QA', 'QA Engineer')
hr.add_employee('Mike Johnson', 35, 'Engineering', 'Devops', 'Devops Engineer')
hr.add_employee('Alice Brown', 29, 'Sales', 'Sales', 'Sales Representative')
hr.add_employee('Bob Wilson', 32, 'HR', 'Recruitment', 'Recruitment Specialist')

engineering = Department.new('Engineering', 'Engineering Head')
sales = Department.new('Sales', 'Sales Head')
hr_department = Department.new('HR', 'HR Head')

engineering.add_employee(hr.employees[0])
engineering.add_employee(hr.employees[1])
engineering.add_employee(hr.employees[2])

sales.add_employee(hr.employees[3])

hr_department.add_employee(hr.employees[4])

service_project = Project.new('Service', 100000)
service_project.calculate_profit

product_project = Project.new('Product', 500000)
product_project.calculate_profit

# Save employees to CSV
hr.save_employees_to_csv

# Display department details
puts "Engineering Department Employees:"
engineering.get_department_employees.each do |employee|
  puts "#{employee.name}, #{employee.designation}"
end

puts "Sales Department Employees:"
sales.get_department_employees.each do |employee|
  puts "#{employee.name}, #{employee.designation}"
end

puts "HR Department Employees:"
hr_department.get_department_employees.each do |employee|
  puts "#{employee.name}, #{employee.designation}"
end



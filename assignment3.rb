require 'csv'
require("./employee.rb")
require("./factory_method.rb")
require("./hr.rb")
require("./department.rb")
require("./project.rb")

# Sample usage:
hr = Hr.new

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



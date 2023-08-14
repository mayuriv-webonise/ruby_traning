  require("./assignment3.rb")

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

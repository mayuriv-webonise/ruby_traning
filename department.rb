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
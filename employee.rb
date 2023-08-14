  require("./assignment3.rb")

  class Employee
    attr_reader :name, :age, :department, :division, :designation

    def initialize(name, age, department, designation)
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





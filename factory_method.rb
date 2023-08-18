  # Subclasses for different divisions
class Development < Employee; end
class QA < Employee; end
class Devops < Employee; end

class EmployeeFactory
	def create_employee(name, age, department, division, designation)
		case division
		when 'Development'
			Development.new(name, age, department, designation)
		when 'QA'
			QA.new(name, age, department, designation)
		when 'Devops'
			Devops.new(name, age, department, designation)
		else
			Employee.new(name, age, department, designation)
		end
	end
end

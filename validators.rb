class DynamicValidator
  def initialize(attribute, rules)
    @attribute = attribute
    @rules = rules
  end
  def generate_validations(klass)
    @rules.each do |rule|
      define_validation_method(klass, rule)
    end
  end
  private
  def define_validation_method(klass, rule)
    method_name = "validate_#{rule}_of_#{@attribute}"
    attribute = @attribute.to_sym
    klass.class_eval do
      define_method(method_name) do
        value = send(attribute)
        case rule
        when :presence
          if value.nil? || (value.respond_to?(:empty?) && value.empty?)
            puts "#{attribute.capitalize} can't be empty"
          end
        when :length
          if value.respond_to?(:length) && value.length < 5
            puts "#{attribute.capitalize} length should be at least 5 characters"
          end
        when :age_limit
          if attribute == :age && (value.nil? || value < 18)
            puts "Minimum age required is 18 for #{attribute}"
          end
        else
          puts "Validation rule '#{rule}' is not supported"
        end
      end
    end
  end
end
class User
  attr_accessor :name, :email, :age
  def initialize(name, email, age)
    @name = name
    @email = email
    @age = age
  end
end
name_validator = DynamicValidator.new(:name, [:presence, :length])
email_validator = DynamicValidator.new(:email, [:presence])
age_validator = DynamicValidator.new(:age, [:presence, :age_limit])
# Generate the validation methods for User class attributes
name_validator.generate_validations(User)
email_validator.generate_validations(User)
age_validator.generate_validations(User)
user = User.new("", "test@gmail.com", 15)
user.send(:validate_presence_of_name)
user.send(:validate_presence_of_email)
user.send(:validate_presence_of_age)
user.send(:validate_age_limit_of_age)

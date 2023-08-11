  #define_method
  class Doctor
      ["surgery", "checkup"].each do |action|
        define_method("take_#{action}") do |argument|
          "The doctor takes a #{action} at #{argument}."
        end
      end
    end
    
    doctor = Doctor.new
    puts doctor.take_surgery("9 AM")
    puts doctor.take_checkup("10 PM")
    puts doctor.take_checkup("9 AM")
    puts doctor.take_surgery("10 PM")
  #ghost methods

  class DynamicMethods
      def method_missing(method_name, *args)
        puts "Undefined method: #{method_name}"
      end
    end
    
    obj = DynamicMethods.new
    obj.undefined_method 
    
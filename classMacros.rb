  class MyMacroClass
      def MyMacroClass.my_class_method
        puts "Running class method my_class_method..."
      end
      def self.show_method_detail
        puts "I'm in show_method_detail..."
      end
  end

  puts MyMacroClass.my_class_method
  puts MyMacroClass.show_method_detail

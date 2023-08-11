#monkey Patching

class String
    def reverse_words
      split.reverse.join(' ')
    end
  end
  
  original_string = "Hello, world!"
  reversed_words = original_string.reverse_words
  
  puts reversed_words 
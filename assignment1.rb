
#Compute the sum of cubes for a given range a through b. Write a method called sum_of_cubes to accomplish this task. Example Given range 1 to 3 the method should return 36.


def sum_of_cubes(a, b)
    sum = 0
    (a..b).each do |num|
        sum += num ** 3
    end
    sum
end
start =1
endval = 3
result = sum_of_cubes(start, endval)
puts "Sum of cubes of given range : #{result}"

###########################################

#Given an Array, return the elements that are present exactly once in the array. You need to write a method called non_duplicated_values to accomplish this task. Example: Given [1,2,2,3,3,4,5], the method should return [1,4,5]

def non_duplicated_values(arr)
    puts arr.uniq
    arr.select { |num| arr.count(num) == 1 }
end

testArr=[1,1,5,4,9,9]
resularr = non_duplicated_values(testArr)
puts "Sum of cubes of given range :#{resularr}"

#########################################################################

# Given a sentence, return true if the sentence is a palindrome. You are supposed to write a method palindrome? to accomplish this task. 
# Note: Ignore whitespace and cases of characters. Example: Given ""Never odd or even"" the method should return true.

def check_palindrom(str)
    str == str.reverse
end

puts check_palindrom('level')
puts check_palindrom('test')

########################################################################

#9 is a Kaprekar number since 9 ^ 2 = 81 and 8 + 1 = 9, 297 is also Kaprekar number since 297 ^ 2 = 88209 and 88 + 209 = 297. In short, for a Kaprekar number k with n-digits, if you square it and add the right n digits to the left n or n-1 digits, the resultant sum is k. Find if a given number is a Kaprekar number.

def kaprekar_number?(num)
    square = num**2
    square_str = square.to_s
    num_str = num.to_s
    result = false
    num_str.length.times do |i|
      left_part = square_str[0..i]
      right_part = square_str[i+1..-1]
  
    break result = true  if (left_part.to_i + right_part.to_i) == num
    end
  return result
  end

puts 'example'
    puts kaprekar_number?(9)    
    puts kaprekar_number?(297)  
    puts kaprekar_number?(45)   
    puts kaprekar_number?(2973)

  ################################################################################

#   Find occurrence of RUBY from string 1.

# Find the position where RUBY occurs in the string 1.

# Create array of words in string 1 & print them using a recursive function.

# Capitalise string 1

# Combine string 1 & 2.

# Cut the string 1 into 4 parts & print it.

# Divide the string 1 by occurrences of '.'. Combine the array in reverse word sequence

# Remove the HTML characters from string.

# Print the 'RUBY' word from string 1 by traversing it using string functions

# Find the length of string 1 & 2.

str1 = "RUBY parses a file by looking for <br/> one of the special tags that tells it to start interpreting the text as RUBY code. The parser then executes all of the code it finds until it runs into a RUBY closing <br/> tag."
str2 = "RUBY does not require (or support) explicit type definition in variable declaration; a variable's type is determined by the context in which the variable is used."
arr = str1.split(" ")
count = 0
position = []
arr.each_with_index do |elem , index|
    puts elem
  if elem == "RUBY"
    position << index
    count += 1
  end
end
puts "The word 'RUBY' appears #{count} times in the string."
puts "The word 'RUBY' appears at position #{position}  in the string."
puts str1.capitalize
puts str1 + str2
puts str1.gsub(/<.*?>/, '')

###########################################################################################
#Dates Print current date.

# Print 12th Jan 2012

# Add 7 days in current date

# Compare two dates. (12-04-2010 & 12-05-2011). Calculate the days between these two dates.

# Print date after 20 days from current date

# Print date in array format.

require 'date'

current_date = Date.today
puts current_date


date_12th_jan_2012 = Date.new(2012, 1, 12)
puts date_12th_jan_2012


current_date = Date.today
date_after_7_days = current_date + 7
puts date_after_7_days

date1 = Date.new(2010, 4, 12)
date2 = Date.new(2011, 5, 12)

days_difference = (date2 - date1).to_i
puts "Days between the two dates: #{days_difference}"

current_date = Date.today
date_after_20_days = current_date + 20
puts date_after_20_days

current_date = Date.today
date_array = [current_date.year, current_date.month, current_date.day]
puts date_array.inspect

########################################################################################

#Print prime numbers from the given array
require 'prime'

def print_prime_numbers(array)
  prime_numbers = array.select { |num| Prime.prime?(num) }

  puts "Prime numbers in the array: #{prime_numbers.inspect}"
end

# Example usage:
numbers_array = [2, 3, 5, 6, 7, 8, 9, 10, 11]
print_prime_numbers(numbers_array)

#############################################################################################

#Write a program for fuel indication. Ex: 0 -> Out of fuel, 1-10 -> Low, Please fill, 11-30 -> Good for now, 31-50 -> Almost Full, > 50 -> Full
def fuel_indication(fuel_level)
    case fuel_level
    when nil
        puts "Please enter valid input"
    when 0
      puts "Out of fuel"
    when 1..10
      puts "Low, Please fill"
    when 11..30
      puts "Good for now"
    when 31..49
      puts "Almost Full"
    when  50
      puts "Full"
    else
        puts "invalid input"
    end
  end
  
 
  fuel_level = 0
  puts "Fuel Indication: #{fuel_indication(nil)}"
  puts "Fuel Indication: #{fuel_indication('')}"
  puts "Fuel Indication: #{fuel_indication(fuel_level)}"
  puts "Fuel Indication: #{fuel_indication(50)}"
  puts "Fuel Indication: #{fuel_indication(23)}"
  puts "Fuel Indication: #{fuel_indication(45)}"

  ##############################################################################################

  #Swap the given values(without the third variable)
  def swap_values(a, b)
    a, b = b, a
    [a, b]
  end
  
  # Example usage:
  x = 59
  y = 11
  
  puts "Before swapping: x = #{x}, y = #{y}"
  x, y = swap_values(x, y)
  puts "After swapping: x = #{x}, y = #{y}"

  ##################################################################################################

#Program to Randomly Select an Element From the Array
  def random_element(array)
    array.sample
  end

  
  puts random_element([2,7,'hi', 9, 'welcome'])
  puts random_element(['test','hi', 9, 'welcome'])
  puts random_element(['webonise', 66, 'welcome'])
  

  #####################################################################################################

  #Program to Count the Number of Each Vowel

 def count_vowels(str)
    vowels = { 'A' => 0, 'E' => 0, 'I' => 0, 'O' => 0, 'U' => 0 }
  
    str.upcase.each_char do |char|
      if vowels.key?(char)
        vowels[char] += 1
      end
    end
  
    vowels
  end
  
  # Example usage:
  input_string = "Hello, World!"
  result = count_vowels(input_string)
  
  puts "Vowel counts: #{result}"
  
  #################################################################################################
#Program to Sort a Hash by Value
  def sort_hash_by_value(hash)
    sorted_hash = hash.sort_by { |key, value| value }
  
    # Convert the sorted array back to a hash
    sorted_hash.to_h
  end
  
  # Example usage:
  unsorted_hash = { "apple" => 3, "banana" => 1, "cherry" => 2, "orange" => 5 }
  sorted_hash = sort_hash_by_value(unsorted_hash)
  
  puts "Sorted hash by value: #{sorted_hash}"

  
  ##################################################################################################

  #Program to Convert Two Arrays Into a Hash

  def arrays_to_hash(keys, values)
    hash = keys.zip(values).to_h
  end
  
  # Example usage:
  keys = ["name", "age", "city"]
  values = ["John", 30, "New York"]
  result_hash = arrays_to_hash(keys, values)
  
  puts "Resulting hash: #{result_hash}"
  

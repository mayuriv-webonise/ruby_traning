#using Blocks
def count_even_numbers(array)
    count = 0
    array.each do |num|
      count += 1 if num.even?
    end
    count
end
  
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_even_numbers(numbers)}"

  #using Procs
count_even = Proc.new { |num| num.even? }
def count_numbers(array, condition)
  array.count(&condition)
end


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"

#using lambda

count_even = lambda { |num| num.even? }
def count_numbers(array, condition)
  array.count(&condition)
end


numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
puts "Count of even numbers: #{count_numbers(numbers, count_even)}"


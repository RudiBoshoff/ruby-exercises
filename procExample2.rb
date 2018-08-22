=begin
  To create a proc, all you have to do is call Proc.new, and then pass in the
  block of code that you want to store. Any time you pass a proc to a method
  that usually expects a block, you have to use the ampersand (&) operator to
  then call that proc's instructions (or block of code). Whenever calling a
  proc in a method that usually takes a block, make sure to put the proc inside
  parenthesis like so: .some_method( &some_proc ). Or a simpler version is to
  use the .call method. It would look like this: some_proc.call.
=end

# EXAMPLE
multiples_of_3 = Proc.new do |n|
    n % 3 == 0
end

(1..100).to_a.select(&multiples_of_3)

# ==> 3, 6, 9, 12, 15, 18, 21, 24, 27 ...


# ANOTHER EXAMPLE
numbers = [5, 10, 15, 20, 25, 30]

cubed = Proc.new { |n| puts n ** 3 }
numbers.map( &cubed )

# ==> Cubes each element in the number array, and then puts them on the console

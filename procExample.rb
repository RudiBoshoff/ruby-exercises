# Passing a Proc in a method

def action someProc
  someProc.call
end

hello = Proc.new do
  puts "Hello World!"
end

# Passing a Proc that has a parameter in a method
def action2 (someProc, name)
  someProc.call(name) # have to pass the name to the call function
end

bye = Proc.new do |name|
  puts "Ewwww that is a terrible name. Goodbye #{name}!" # a proc with a parameter being passed to a method
end

action(hello)
puts "Enter your name"
name = gets.chomp
action2(bye, name) # passes the Proc and the Proc's_Argument to the method

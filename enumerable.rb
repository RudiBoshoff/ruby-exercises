module Enumerable
  # iterate over array and run block on each element
  def my_each
    for i in 0..self.length-1
      yield(self[i]) if block_given?
    end
    self
  end

  # iterate over array and run block on each element with element index
  def my_each_with_index
    for i in 0..self.length-1
      yield(self[i], i) if block_given?
    end
    self
  end

  # iterate over array and return new array with elements passing condition
  def my_select
    if block_given?
      new_array = []
      self.my_each{|item| array_new << item if yield(self)}
      # This is the same as:
      # for i in 0..self.length-1
      #   new_array << self[i] if yield(self[i])
      # end
      new_array
    end
  end

  # iterate over array and return true if all elements pass condition
  def my_all?
    if block_given?
      self.my_each{|item| return false if yield(item) == false }
      # return true unless one is false
      true
    else
      # if no block given return true
      true
    end
  end

  # iterate over array and return true if an element passes condition
  def my_any?
    if block_given?
      self.my_each{|item| return true if yield(item)}
      #  return false unless one is true
      false
    else
      # if no block given return true
      true
    end
  end

  # iterate over array and return true if all elements fail to pass condition
  def my_none?
    if block_given?
      self.my_each{|item| return false if yield(item)}
      #  return false unless one is true
      true
    else
      # if no block given return false
      false
    end
  end

  # iterate over array, return num of elements of all elements passing condition
  def my_count
    if block_given?
      num = 0
      self.my_each{|item| num += 1 if yield(item)}
      num
    else
      # if no block given return size of array
      self.length
    end
  end

  # iterate over array and return new array with elements edited by block
  def my_map
    if block_given?
      new_array = []
      self.my_each{|item| new_array << yield(item)}
      new_array
    else
      # if no block given return enumerator
      "#<Enumerator: #{self}:my_map>"
    end
  end

  # iterate over array, passing a total to the next iteration
  def my_inject(default = nil)
    # if no initial value given then
    default ? total = default : total = self[0]
    for i in 1..self.length
      total = yield(total, i)
    end
    total
  end

  def multiply_els(array)
    array.my_inject { |total, num| total * num }
  end
end

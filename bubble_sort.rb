=begin

    The most straightforward logic would be this:
        for i in 0..size-2
           for j in 1..size-1
              if array[i] < array[j]
                  swap values

    I have however done this a different way that is less optimized but gets The
    job done as more of a fun challenge rather than optimal coding.

    The logic used here is:
      > have a loop that checks each pair from start to end
      > create a new array with each swap
      > run the loop again with an outside loop that continues to check pairs
=end


# NORMAL SORTING METHOD

def bubble_sort(array_to_sort)
  size = array_to_sort.length
  puts "array to sort: "
  p array_to_sort
  for i in 0..size-1
    for index in 0..size-2
        # p array_to_sort
        if array_to_sort[index].to_i > array_to_sort[index + 1].to_i
          temp_item = array_to_sort[index]
          array_to_sort[index] = array_to_sort[index + 1]
          array_to_sort[index + 1] = temp_item
        end
      end
    end
    puts 'sorted using bubble sort'
    return array_to_sort
end

p bubble_sort([8, 4, 6, 2, 5, 1, 3, 9, 7])
puts 'sorted using sort'
p [8, 4, 6, 2, 5, 1, 3, 9, 7].sort

# USING YIELD AND A BLOCK TO SORT

def bubble_sort_by(array_to_sort)
  size = array_to_sort.length
  puts "array to sort: "
  p array_to_sort
  for i in 0..size-1
    for index in 0..size-2
        left = array_to_sort[index]
        right = array_to_sort[index + 1]
        if yield(left, right) > 0
          temp_item = array_to_sort[index]
          array_to_sort[index] = array_to_sort[index + 1]
          array_to_sort[index + 1] = temp_item
        end
      end
    end
    puts 'sorted using yield block'
    p array_to_sort
end

bubble_sort_by([1,4,5,6,1,2,4]) do |left,right|
    left - right
end

puts 'sorted using sort'
p [1,4,5,6,1,2,4].sort

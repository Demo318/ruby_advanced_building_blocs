def bubble_sort(arr)
  swaps = 1
  current_index = 0
  while swaps != 0 && current_index != (arr.length - 1)
    swaps = 0
    arr.each_with_index do |item, index|
      if index < (arr.length - 1) && item > arr[index + 1]
        arr.insert(index, arr.delete_at(index + 1))
        swaps += 1
        current_index = index
      end
    end
  end
  return arr
end

def bubble_sort_by(arr)
  swaps = 1
  current_index = 0
  while swaps != 0 && current_index != (arr.length - 1)
    swaps = 0
    arr.each_with_index do |item, index|
      if index < arr.length - 1 && index > 0
        indicator = yield(item, arr[index+1])
        if indicator < 0
          arr.insert(index - 1, arr.delete_at(index))
          swaps += 1
        elsif indicator > 0
          arr.insert((index + 1), arr.delete_at(index))
          swaps += 1
        end
      end
      current_index = index
    end
  end
  arr
end

puts "Is #bubble_sort working?"
puts bubble_sort([5, 2, 3, 4, 6, 1, 4, 3]) == [1, 2, 3, 3, 4, 4, 5, 6]

puts "Is #bubble_sort_by working?"
puts ["hi", "hey", "hello"] == bubble_sort_by(["hi","hello","hey"]) { |left,right| left.length - right.length }

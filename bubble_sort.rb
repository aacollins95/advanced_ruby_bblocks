def bubble_sort(numbers)
  swaps = -1
  until swaps == 0 do
    i,swaps = 0,0
    (numbers.length - 1).times do
      left,right = numbers[i],numbers[i + 1]
      if (left > right)
        numbers[i+1],numbers[i] = left,right
        swaps += 1
      end
      i += 1
    end
  end
  return numbers
end

n = [4,4,3,5,4,5,9,3,3,3,4,1,0,7,4,0,1,1,8,1]
print bubble_sort(n)

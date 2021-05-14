

# phase 1

def my_min(arr)
  
  l = arr.length # constant or 1

  (0...l).each do |i1| # n times
    (0...l).each do |i2| # 3n times
      if arr[i1] < arr[i2] # 1 ??
        arr[i1], arr[i2] = arr[i2], arr[i1] # 1
      end
    end
  end

  arr[0] # 1
end
# complexity of 3n^2 so BIG O (n^2)
# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

# Phase 2
def my_min(arr)
  l = arr.length - 1
  # min = 0 # is this more efficient than swapping? 

  
  (0...l).each do |i| 
    if arr[i] < arr[i+1]
      arr[i], arr[i+1] = arr[i+1], arr[i]
    end
  end

  arr.first
end
list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
p my_min(list)  # =>  -5










# Question List

# what is line 11 of (if arr[i1] < arr[i2] # 1 ??)
# refer back to line 26
    # temp = arr[i]
    # arr[i] = arr[i+1]
    # arr[i+1] = temp

    
require 'byebug'

# # Phase 1
# def my_min(arr)
#   l = arr.length # constant or 1
#   (0...l).each do |i1| # n times
#     (0...l).each do |i2| # 2n times
#       if arr[i1] < arr[i2] # 1 ??
#         arr[i1], arr[i2] = arr[i2], arr[i1] # 1
#       end
#     end
#   end

#   arr[0] # 1
# end
# complexity of 3n^2 so BIG O (n^2)

# Phase 2
def my_min(arr)
  l = arr.length - 1 # constant
  # min = 0 # is this more efficient than swapping?   
  (0...l).each do |i| # n times1
    if arr[i] < arr[i+1] # 1
      arr[i], arr[i+1] = arr[i+1], arr[i] # 1
    end
  end

  arr.last # 1
end 

#complexity of 2n + 2

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list)  # =>  -5

#-------------------------------------------

#Largest Contiguous Sub-sum

# get all the sub arrays
# iterate over all sub arrays and get sums
# get the largest sum among them
# use a hash and return the key with the largest value

# def largest_contiguous_subsum(list)
#   l = list.length # 1
#   result = [] # 1
#   hash = Hash.new(0) # 1

#   (0...l).each do |i1| # n
#     (0...l).each do |i2| # n
#       result << list[i1..i2] if i2 >= i1 # 1
#     end
#   end

#   result.each do |sub_arr| # n
#     hash[sub_arr] = sub_arr.sum # 1
#   end

#   sorted_by_val = hash.sort_by { |k, v| v } # n, 
#   sorted_by_val[-1][1] # 
# end

# Phase II

def largest_contiguous_subsum(list)
  l = list.length           #constant
  largest_sum = list.first  #constant

  (0...l).each do |i1| # n
    (i1...l).each do |i2| # n-m, where m = 0..i1
      sum = list[i1..i2].sum                 #constant
      largest_sum = sum if largest_sum < sum #constant
    end
  end

  largest_sum #constant
end

def largest_contiguous_subsum(list) # [-5, -3, -1]
  largest = list.first #-1
  current_sum = list.first #-1

  (1..list.length-1).each do |i| # -1
    if current_sum < 0
      current_sum = 0 # 0
    end

    current_sum += list[i] # 

    if current_sum > largest
      largest = current_sum
    end

  end
  largest # -1
end

#time complexity 2n(n-m) + 3??

# list = [5, 3, -7]
# p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

# # list = [2, 3, -6, 7, -6, 7]
# # p largest_contiguous_subsum(list) # => 8 (from [7, -6, 7])

list = [-5, -1, -3]
p largest_contiguous_subsum(list) # => -1 (from [-1])




# Question List

# what is line 11 of (if arr[i1] < arr[i2] # 1 ??)
# refer back to line 26
    # temp = arr[i]
    # arr[i] = arr[i+1]
    # arr[i+1] = temp


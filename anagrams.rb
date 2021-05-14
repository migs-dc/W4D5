require "byebug"

def permutations(arr)
  return arr if arr.length <= 1
  return [ [arr[0],arr[1]], [arr[1], arr[0]] ] if arr.length == 2 # [[1,2],[2,1]]

  res = []
  arr.each_with_index do |ele, i| #go through every element in the arr
    rest = permutations( arr[0...i] + arr[i+1..-1] ) #get permutations of all elements excluding ele
    rest.each do |per|
      res << [ele] + per
    end
  end
  res
end

#phase 1

def first_anagram?(str1, str2)

  perms = permutations(str1.split("")) # n!
  perms = perms.map { |ele| ele.join("") } #n
  perms.include?(str2) #n

end 

#time complexity is n! + 2n

# p (1..15).to_a.permutation.to_a.length

# 2 - 2
# 3 - 6
# 4 - 24
# 5 - 120
# 6 - 720
# 7 - 5,040
#10 - 3,628,800
#15 - 1,307,674,368,000
#100 - 93,326,215,443,944,200,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000,000

# p permutations([1, 2, 3, 4]).length # => [[1, 2, 3], [1, 3, 2],
#                                    #     [2, 1, 3], [2, 3, 1],
#                                    #     [3, 1, 2], [3, 2, 1]]


#phase 2

def second_anagram?(str1, str2)
  # debugger
  arr = str2.split("") #
  str1.each_char do |char|
    if arr.include?(char)
      i = arr.index(char)    
      arr.delete_at(i)
    end
  end
  arr.join("") == ""
end


# Anagrams
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
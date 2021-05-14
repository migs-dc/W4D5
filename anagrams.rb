# Anagrams
# anagram?("gizmo", "sally")    #=> false
# anagram?("elvis", "lives")    #=> true

def first_anagram?()

end


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

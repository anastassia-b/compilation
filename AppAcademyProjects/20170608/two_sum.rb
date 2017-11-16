
def bad_two_sum?(arr, target)
  pairs = subpairs(arr)
  pairs.each do |pair|
    return true if pair.reduce(:+) == target
  end
  false
end

def subpairs(arr)
  result = []
  arr.each_with_index do |el, i|
    arr.each_with_index do |el2, i2|
      next if i2 <= i
      result << [el, el2]
    end
  end
  result
end

arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6)
p bad_two_sum?(arr, 10)

def okay_two_sum?(arr, target)
  sorted = arr.sort
  mid = arr.length / 2

  if sorted[mid] <= target
    bad_two_sum?((arr[0..mid]), target)
  else
    okay_two_sum?(arr[0..mid], target)
  end
end

arr = [0, 1, 5, 7]
p okay_two_sum?(arr, 6)
p okay_two_sum?(arr, 10)

def hash_map(arr,target)

  new_hash = Hash.new
  arr.each do |el|
    return true if new_hash.keys.include?(target - el)
    new_hash[el] = true
  end
  false
end

arr = [0, 1, 5, 7]
p hash_map(arr, 6)
p hash_map(arr, 10)

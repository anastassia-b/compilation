#Anastassia Bobokalonova
#May 31, 2017

def range(min, max)
  return [] if max <= min
  range(min, max - 1) + [max]
end

def sum_of(num_array)
  return num_array[0] if num_array.length <= 1
  sum_of(num_array[0...-1]) + num_array.last
end

#Will make n calls
def exp1(b, n)
  return 1 if n == 0
  b * exp1(b, n - 1)
end

#Will make n/2 calls every call, much faster
def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    exp2(b, n / 2) ** 2
  else
    b * (exp2(b, (n - 1) / 2) ** 2)
  end
end

class Array
  def deep_dup
    result = []
    self.each do |el|
        result << (el.is_a?(Array) ? el.deep_dup : el)
    end
    result
  end

  def subsets
    return [[]] if empty?
    new_subset = self[0...-1].subsets.map do |el|
      el << self[-1]
    end
    self[0...-1].subsets + new_subset
  end

end


def permutations(arr)
  return arr if arr.length <= 1
  first = array.shift
  combos = permutations(array)

  total_permutations = []
  combos.each do |combo|
    (0..combo.length).each do |i|
      total_permutations << combo[0...i] + [first] + perm[i..-1]
    end
  end

  total_permutations
end

def bsearch(arr, target)
  i = arr.length / 2
  value = arr[i]

  return nil unless arr.include?(target)
  return i if target == value

  if target > value
    bsearch(arr[i..-1], target) + i
  else
    bsearch(arr[0...i], target)
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
  return nil if arr.length == 0
  return arr if arr.length == 1

  mid = arr.length / 2
  left_half = merge_sort(arr[0..mid])
  right_half = merge_sort(arr[mid..-1])

  merge(left_half, right_half)
end

def merge(left_half, right_half)
  merged = []
  
  until left_half.empty? || right_half.empty?
    merged << ((left_half.first < right_half.first) ? left.shift : right.shift)
  end

  merged + left_half + right_half
end

def greedy_make_change(amount, coins = [25, 10, 5, 1])
  return amount if coins[0] == amount
  matches = []

  if amount > coins[0]
    matches << coins[0]
    remaining_amount = amount - coins[0]
    matches << greedy_make_change(remaining_amount, coins)
  else
    remaining_amount = amount
    matches << greedy_make_change(remaining_amount, coins[1..-1])
  end

  matches.flatten
end

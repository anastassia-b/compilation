
def my_min_phase_1(arr)

  arr.each_with_index do |el, i|
    if i == arr.size
      subarr = arr[0...-1]
    else
      subarr = arr[0...i] + arr[(i+1)..-1]
    end
    return el if subarr.all? { |el2| el2 > el }
  end

end

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_phase_1(list)

def my_min_phase_2(arr)
  min = arr[0]
  arr.each do |el|
    min = el if el < min
  end
  min
end
#
# p my_min_phase_2(list)

def sub_sum_1(arr)
  subarrs = subsets(arr)[1..-1]
  max = subarrs[0].reduce(:+)
  subarrs.each do |arr|
    #  p arr
    sum = arr.reduce(:+)
    max = sum if sum > max
  end
  return max
end

def subsets(arr)
  return [[]] if arr.empty?

  subs = subsets(arr[0..-2])
  subs.concat(subs.map {|el| el += [arr.last]})
end

#
def sub_sum_2(arr)

  prev_sum = nil
  current_sum = 0
  # max_sum = 0

  i = 0
  while i < arr.size
    if arr[i] >= 0
      current_sum += arr[i]
      # p current_sum
      i += 1
    elsif (current_sum + arr[i] > 0) && (i < arr.size - 1)
      current_sum += arr[i]
      i += 1
    else
      prev_sum = current_sum if prev_sum == nil || (current_sum > prev_sum)
      # p prev_sum
      current_sum = 0
      i += 1
    end
  end
  prev_sum == nil ? current_sum : prev_sum
end

p sub_sum_2([5, 3, -7])
# p subsets([5, 3, -7])
# p sub_sum_2([5, 3, -7])
p sub_sum_2([2,3,-6,7,-6,7])
# p sub_sum_2([-5,-1,-3])

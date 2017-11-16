
def my_uniq(arr)
  storage = []
  arr.each { |el| storage << el unless storage.include?(el)}
  storage
end

def two_sum(arr)
  pairs = []
  (0...arr.length - 1).each do |i|
    ((i+1)...arr.length).each do |j|
      pairs << [i, j] if arr[i] + arr[j] == 0
    end
  end
  pairs
end

def my_transpose(arr)
  results = Array.new(arr.length){ [] }
  (0...arr.length).each do |i|
    (0...arr.length).each do |j|
      results[i] << arr[j][i]
    end
  end
  results
end

def stockpicker(arr)
  min_val = arr.min
  max_val = arr.max
  if arr.index(min_val) < arr.index(max_val)
    return [arr.index(min_val), arr.index(max_val)]
  else
    min_val = arr.min(2)[1]
    return [arr.index(min_val), arr.index(max_val)]
  end
end

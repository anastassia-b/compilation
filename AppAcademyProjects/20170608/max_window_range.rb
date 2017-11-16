
def windowed_max_range_one(arr,window)
  current_max_range = nil
  (0..arr.size-window).each do |idx|
    sub_arr = arr[idx..(idx+ window - 1)]
    p sub_arr
    range = sub_arr.max - sub_arr.min
    current_max_range = range if current_max_range.nil? || range > current_max_range
  end
  current_max_range
end

p windowed_max_range_one([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range_one([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range_one([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range_one([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8


def windowed_max_range_two(arr,window)
  
end

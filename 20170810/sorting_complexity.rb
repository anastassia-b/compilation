
class SortingDemo

  #Bubble sort is O(n^2)

  def self.bubble_sort(array)
    bubble_sort!(array.dup)
    #why not calling on class method?
  end

  def self.bubble_sort!(array)
    sorted = false

    until sorted
      sorted = true
      (0...array.length - 1).each do |idx|
        if array[idx] > array[idx + 1]
          array[idx], array[idx + 1] = array[idx + 1], array[idx]
          sorted = false
        end
      end
    end

    array
  end

  #Merge sort is O(nlogn)

  def self.merge_sort(array, &prc)
    return array if array.length <= 1

    mid = array.length / 2
    merge(
      merge_sort(array.take(mid), &prc),
      merge_sort(array.drop(mid), &prc),
      &prc
    )
  end

  def self.merge(left, right, &prc)
    prc ||= Proc.new { |num1, num2| num1 <=> num2 }
    merged_array = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged_array << left.shift
      when 0
        merged_array << left.shift
      when 1
        merged_array << right.shift
      end
    end

    merged_array + left + right
  end


end

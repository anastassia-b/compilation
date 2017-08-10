
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



end

require 'io/console'
require 'benchmark'

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

  def self.performance_test(size, count)
    arrays_to_test = Array.new(count) { random_arr(size) }

    Benchmark.benchmark(Benchmark::CAPTION, 9, Benchmark::FORMAT,
                        "Avg. Merge: ", "Avg. Bubble: ") do |b|
      merge = b.report("Tot. Merge: ") { run_merge_sort(arrays_to_test) }
      bubble = b.report("Tot. Bubble: ") { run_bubble_sort(arrays_to_test) }
      [merge/count, bubble/count]
    end
  end

  def self.random_arr(n)
    Array.new(n) { rand(n) }
  end

  def self.run_bubble_sort(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      bubble_sort(array_to_test)
    end
  end

  def self.run_merge_sort(arrays)
    arrays.each do |array|
      array_to_test = array.dup
      merge_sort(array_to_test)
    end
  end

  def self.run_performance_tests(multiplier = 5, rounds = 3)
    [1, 10, 100, 1000, 10000].each do |size|
      size *= multiplier
      wait_for_keypress(
        "\nPress any key to benchmark sorts for #{size} elements"
      )
      performance_test(size, rounds)
    end
  end

  def self.wait_for_keypress(prompt)
    puts prompt
    STDIN.getch
  end
end

SortingDemo.run_performance_tests

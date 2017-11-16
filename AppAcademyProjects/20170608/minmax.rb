
class MyQueue
  def initialize
    @store = []
  end

  def enqueue(el)
    @store.push(el)
  end

  def dequeue
    @store.unshift

  end

  def peek
    @store[0]
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

end


class MyStack

  def initialize(arr = [])
    @store = arr
    @max_hash = {}#{1 => 1, 0 => 0}
    @min_hash = {} #{1 => 1}
  end

  def pop
    @store.pop
  end

  def push(el)

    @max_hash.empty? ? (max_val = el) : (max_val = @max_hash[peek])
    el > max_val ? max_val = el : max_val
    @max_hash[el] = max_val

    @min_hash.empty? ? (min_val = el) : (min_val = @min_hash[peek])
    el < min_val ? min_val = el : min_val
    @min_hash[el] = min_val

    @store.push(el)
  end

  def size
    @store.length
  end

  def empty?
    @store.empty?
  end

  def peek
    @store[-1]
  end

  def max
    @max_hash[peek]
  end

  def min
    @min_hash[peek]
  end
end


class StackQueue
  attr_reader :stack1, :stack2
  def initialize(arr=[])
    @stack1 = MyStack.new(arr)
    @stack2 = MyStack.new
    # @store = arr
  end

  def enqueue(el)
    @stack1.push(el)
  end

  def dequeue
    @stack1.size.times do
      el = @stack1.pop
      @stack2.push(el)
    end
    @stack2.pop
  end

  def size
    @stack1.size + @stack2.size
  end

  def empty?
    @stack1.empty? && @stack2.empty?
  end

end

class MinMaxStackQueue
  def initialize

  end

  def enqueue

  end

  def enqueue

  end

  def max

  end

  def min

  end
  
end
# StackQueue

# s = StackQueue.new([1,2,3])
# p s.size
# p s.enqueue(100)
# p s.stack1
# p s.size
# p s.dequeue

# stack = MyStack.new
# p stack.push(5)
# p stack.push(0)
# p stack.push(1)
# p stack.max
# p stack.min

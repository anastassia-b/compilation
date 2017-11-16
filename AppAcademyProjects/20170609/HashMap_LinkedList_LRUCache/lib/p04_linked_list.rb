class Link
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @prev.next = @next
    @next.prev = @prev
  end
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new(:head)
    @tail = Link.new(:tail)
    @head.next = @tail
    @tail.prev = @head

  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next.key == :tail
  end

  def get(key)
    self.each do |link|
      return link.val if link.key == key
    end
    nil
  end

  def include?(key)
    self.each do |link|
      return true if link.key == key
    end
    false
  end

  def append(key, val)
    next_link = Link.new(key, val)

    @tail.prev.next = next_link
    next_link.prev = @tail.prev

    @tail.prev = next_link
    next_link.next = @tail
    next_link
  end

  def update(key, val)
    if include?(key)
      self.each do |link|
        link.val = val if link.key == key
      end
    end
  end

  def remove(key)
    self.each do |link|
      link.remove if link.key == key
    end
  end

  def each(&prc)
    prc ||= Proc.new { |el| el }
    curr_link = first
    until curr_link.key == :tail
      prc.call(curr_link)
      curr_link = curr_link.next
    end
    self
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

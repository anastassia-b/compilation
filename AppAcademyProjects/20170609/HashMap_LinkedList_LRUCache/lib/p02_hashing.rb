class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    id = 0
    self.each_with_index do |el, idx|
      id -= (idx.hash ^ el.hash)
    end
    id
  end
end

class String
  def hash
    arr = self.chars.map { |ch| ch.ord.hash }
    arr.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    id = 0
    self.each do |key, val|
      id += (key.hash ^ val.hash)
    end
    id
  end
end

require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if map[key]
      link = map[key]
      update_link!(link)
      link.val
    else
      calc!(key)
    end

  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private
  attr_reader :store, :map
  def calc!(key)
    @map.set(key, @store.append(key, @prc.call(key)))
    eject! if count == @max
  end

  def update_link!(link)
    link.remove
    store.append(link.key, link.val))
  end

  def eject!
    @map.delete(@store.first.key)
    @store.first.remove
  end
end

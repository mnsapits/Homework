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
end

class LinkedList
  include Enumerable

  def initialize
    @head = Link.new()
    @tail = Link.new()
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
    @head.next == @tail
  end

  def get(key)
    current_node = first
    until current_node.next == nil
      return current_node.val if current_node.key == key
      current_node = current_node.next
    end
    nil
  end

  def include?(key)
    current_node = first
    until current_node.next == nil
      return true if current_node.key == key
      current_node = current_node.next
    end
    false
  end

  def insert(key, val)
    new_addition = Link.new(key, val)
    if self.include?(key)
      self.each do |link|
        if link.key == key
          link.val = val
          break
        end
      end
    end
    new_addition.prev = self.last
    new_addition.next = @tail

    last.next = new_addition
    @tail.prev = new_addition
  end

  def remove(key)
    current_node = first
    until current_node.next == nil
      if current_node.key == key
        current_node.prev.next = current_node.next
        current_node.next.prev = current_node.prev
      end
      current_node = current_node.next
    end
    nil
  end

  def each(&prc)
    current_node = first
    until current_node.next == nil
      prc.call(current_node)
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end
end

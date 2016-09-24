class MaxIntSet
  def initialize(max = 1)
    @max = max
    @store = Array.new(max) {false}
  end

  def insert(num)
    error_check(num)
    @store[num] = true
  end

  def remove(num)
    error_check(num)
    @store[num] = false
  end

  def include?(num)
    error_check(num)
    @store[num]
  end

  def error_check(num)
    raise "Out of bounds" unless num.is_a? Fixnum
    raise "Out of bounds" if num > @store.length || num < 0
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if num_buckets == @count
      resize!
    end
    @count += 1
    self[num] << num
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
  end

  # private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_store = ResizingIntSet.new(self.num_buckets * 2)
    @store.each do |bucket|
      bucket.each do |num|
        new_store.insert(num)
      end
    end
    @store = new_store.store
  end
end

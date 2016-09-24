require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    @store.each do |linked_list|
      return true if linked_list.include?(key)
    end
    false
  end

  def set(key, val)
    @store[bucket(key)].insert(key, val)
    resize! if @count == num_buckets
    @count += 1 ##Updating but not adding? still add?
  end

  def get(key)
    list = @store[bucket(key)]
    list.get(key)
  end

  def delete(key)
    @store.each do |linked_list|
      linked_list.remove(key)
    end
    @count -= 1
  end

  def each(&prc)
    @store.each do |linked_list|
      linked_list.each do |link|
        prc.call(link.key, link.val)
      end
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  # private

  def num_buckets
    @store.length
  end

  def resize!
    new_map = HashMap.new(num_buckets * 2)
    @store.each do |link_list|
      link_list.each do |link|
        new_map.set(link.key, link.val)
      end
    end
    @store = new_map.store
  end

  def bucket(key)
    key.hash % num_buckets
  end
end

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    self.map { |el| el.to_s.ord.to_s}.join.to_i
  end
end

class String
  def hash
    self.chars.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    uniq_arr = []
    
    self.map do |key, val|
      uniq_arr << key.to_s
      uniq_arr << val.to_s
    end

    uniq_arr.sort.hash
  end
end

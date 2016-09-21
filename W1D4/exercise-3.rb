class Map
  def initialize
    @map = []
  end

  def assign(key, value)
    if lookup(key)
      @map.each do |pair|
        if pair[0] == key
          pair[1] = value
        end
      end
    else
      @map << [key,value]
    end
  end

  def lookup(key)
    @map.each do |pair|
      return pair.last if pair.first == key
    end
    nil
  end

  def remove(key)
    @map.reject { |pair| pair[0] == key}
  end

  def show
    @map
  end

end

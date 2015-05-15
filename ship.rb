class Ship
  def initialize(length)
    @length = length
    @ship_placed = []
    @hits = 0
  end

  def length
    @length
  end

  def place(x, y, horizontal)
    return false unless @ship_placed.empty?
    if horizontal == true
      tail = x + @length -1
      (x..tail).map {|x| @ship_placed << [x, y] }
      return @ship_placed
    else
      tail = y + @length -1
      (y..tail).map {|y| @ship_placed << [x, y] }
      return @ship_placed
    end
  end

  def covers?(x, y)
    @ship_placed.include?([x, y])
  end

  def overlaps_with?(ship)
    result =  @ship_placed[0..-1].map { |sub_array| ship.covers?(sub_array[0], sub_array[1]) }
    result.include?(true)
  end

  def fire_at(x, y)
    @hits += 1 if self.covers?(x, y)
  end

  def sunk?
    @hits >= @length
  end
end

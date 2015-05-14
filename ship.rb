class Ship
  def initialize(length)
    @length = length
    @ship_placed = []
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
    #map each of the coordinates from @ship_placed & compare to ship.covered?(for the 2nd ship)
  end
end

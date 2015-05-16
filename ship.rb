class Ship
  attr_reader :ship_placed

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
      (x..tail).map {|x| @ship_placed << Hole.new(x, y) }
      return @ship_placed
    else
      tail = y + @length -1
      (y..tail).map {|y| @ship_placed << Hole.new(x, y) }
      return @ship_placed
    end
  end

  def covers?(x, y)
    @ship_placed.any? {|hole| hole.x == x && hole.y == y }
  end

  def overlaps_with?(ship)
    a = []
    b = []
    @ship_placed.map {|hole| a << [hole.x, hole.y] }
    ship.ship_placed.map {|hole| b << [hole.x, hole.y] }
    (a & b).any?  
  end

  def fire_at(x, y)
    @hits += 1 if self.covers?(x, y)
  end

  def sunk?
    @hits >= @length
  end
end

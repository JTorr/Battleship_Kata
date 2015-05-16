class Ship
  include Enumerable
  attr_reader :ship_placed

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
      (x..tail).map {|x| @ship_placed << Hole.new(x, y) }
      return @ship_placed
    else
      tail = y + @length -1
      (y..tail).map {|y| @ship_placed << Hole.new(x, y) }
      return @ship_placed
    end
  end

  def covers?(x, y)
    covered_hole = @ship_placed.select {|hole| hole.x == x && hole.y == y }
    if covered_hole.empty?
      return false
    else
      covered_hole
    end
  end

  def overlaps_with?(ship)
    a = []
    b = []
    @ship_placed.map {|hole| a << [hole.x, hole.y] }
    ship.ship_placed.map {|hole| b << [hole.x, hole.y] }
    (a & b).any?  
  end

  def fire_at(x, y)
    covered_hole = self.covers?(x,y)
    covered_hole.select {|hole| hole.mark_hit } if covered_hole
  end

  def sunk?
    require 'pry'
    binding.pry
    @ship_placed.all? {|hole| hole.hit? }
  end
end

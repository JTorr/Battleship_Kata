class Hole
  attr_reader :x
  attr_reader :y

  def initialize(x, y)
    @x = x
    @y = y
    @hit = false
  end

  def hit?
    @hit
  end

  def mark_hit
    @hit = true
  end
end

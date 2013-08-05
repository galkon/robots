class Robot
  attr_reader :x, :y, :direction

  def self.supported_directions
    ['NORTH', 'EAST', 'SOUTH', 'WEST']
  end

  def initialize
    @direction = "NORTH"
  end

  def place(x, y, direction)
    @x = x if x >= 0 and x <= 4
    @y = y if y >= 0 and y <= 4

    if Robot.supported_directions.include? direction.upcase
      @direction = direction.upcase
    end
  end

  def move
    return if not placed?

    case direction
    when "NORTH"
      @y += 1 unless @y + 1 > 4
    when "EAST"
      @x += 1 unless @x + 1 > 4
    when "SOUTH"
      @y -= 1 unless @y - 1 < 0
    when "WEST"
      @x -= 1 unless @x - 1 < 0
    end
  end

  def placed?
    @x and @y
  end
end
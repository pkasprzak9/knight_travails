# frozen_string_literal: false

class Knight
  attr_accessor :location, :moves, :children, :parent

  def initialize(location, parent = [])
    @parent = parent
    @location = location
    @moves = possible_moves(location)
    @children = []
  end

  def possible_moves(loc, results = [])
    moves = move_dir
    loc_x, loc_y = loc
    moves.each do |move|
      mov_x, mov_y = move
      x = loc_x + mov_x
      y = loc_y + mov_y
      results << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    results
  end

  def move_dir
    [[1, 2],
     [1, -2],
     [2, 1],
     [2, -1],
     [-1, 2],
     [-1, -2],
     [-2, 1],
     [-2, -1]]
  end

  def to_s
    '♞'
  end
end

# frozen_string_literal: false

require_relative 'knight'

class ChessBoard
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def knight_moves(start, destination)
    current = make_tree(start, destination)
    history = []
    make_history(current, history, start) unless current.nil?
    history.reverse.each do |move|
      @grid[move[0]][move[1]] = Knight.new(move)
      print_board
      sleep 1
    end
    unless current.nil?
      print_history(history, start, destination)
    else
      puts 'Wrong destination'
    end
  end

  def make_tree(start, destination)
    x, y = destination
    return nil if x > 7 || y > 7 || x.negative? || y.negative?

    queue = [Knight.new(start)]
    current = queue.shift
    until current.location == destination
      current.moves.each do |move|
        current.children << knight = Knight.new(move, current)
        queue << knight
      end
      current = queue.shift
    end
    current
  end

  def make_history(current, history, start)
    until current.location == start
      history << current.location
      current = current.parent
    end
    history << current.location
  end

  def print_history(history, start, destination)
    puts "You made it in #{history.size - 1} moves!"
    puts "To get from #{start} to #{destination} you must traverse the following path:"
    history.reverse.each { |move| puts move.to_s }
  end

  def print_board
    8.times do |r|
      puts '----------------------------------------'
      8.times do |c|
        if grid[r][c].nil?
          print '    |'
        else
          print " #{grid[r][c]} |"
        end
      end
      puts ''
    end
  end
end

board = ChessBoard.new
board.print_board
board.knight_moves([0, 0], [1, 1])

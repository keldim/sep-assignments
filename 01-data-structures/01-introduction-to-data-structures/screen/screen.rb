require_relative 'pixel'
require 'pry'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @matrix = grid = Array.new(@width) { Array.new(@height) }
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    matrix[x][y] = pixel
  end

  def at(x, y)
    matrix[x][y]
  end

  private

  def inbounds(x, y)
  end

end

class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right
  attr_accessor :parent
  attr_accessor :parnet_counter
  attr_accessor :temp_right

  def initialize(title, rating)
    @title = title
    @rating = rating
    @left = nil
    @right = nil
    @parent = nil
    @parent_counter = 0
    @temp_right = nil
  end
end

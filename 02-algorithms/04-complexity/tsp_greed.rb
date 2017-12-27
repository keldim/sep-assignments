class City
  attr_accessor :name
  attr_accessor :x
  attr_accessor :y

  def initialize (name, x, y)
    @name = name
    @x = x
    @y = y
  end

end

def distance_apart(city1, city2)
  Math.hypot(city2.x - city1.x, city2.y - city1.y)
end


def nearest_possible_neighbor (graph_of_cities, current_city)
  final_route = []
  while graph_of_cities.empty? == false
    graph_of_cities.delete(current_city)
    final_route.push(current_city.name)
    current_city = graph_of_cities.min_by {|x| distance_apart(current_city, x)}

  end

  final_route
end

chicago = City.new("chicago", 88, 42)
nyc = City.new("nyc", 74, 41)
la = City.new("la", 118, 34)
seattle = City.new("seattle", 122, 48)
ft_lauderdale = City.new("ft_lauderdale", 80, 26)

test_route = [chicago, nyc, la, seattle, ft_lauderdale]
puts nearest_possible_neighbor(test_route, chicago)

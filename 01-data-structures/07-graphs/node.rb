class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :temp_result


  def initialize (name, hash)
    @name = name
    @film_actor_hash = hash
    @temp_result = []
  end

end

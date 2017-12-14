require_relative 'node'

class SixDegrees

  def find_kevin_bacon(start)
    one = start.film_actor_hash
    one.each do |key, value|
      value.each do |spot|
        if spot.name == "Kevin_Bacon"
          start.temp_result.push(key)
          if start.temp_result.length <= 6
            final = start.temp_result
            start.temp_result = []
            return final
          else
            start.temp_result = []
          end
        else
          start.temp_result.push(key)
          spot.temp_result = start.temp_result
          start.temp_result = []
          find_kevin_bacon(spot)
        end
      end
    end

end

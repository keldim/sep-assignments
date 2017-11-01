# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members.push(person)
  end

  def leave(person)
    num = self.members.index(person)
    self.members[num] = nil
    self.members.compact!
  end

  def front
    self.members[0]
  end

  def middle
    mid = (self.members.length/2).floor
    self.members[mid]
  end

  def back
    total=self.members.length
    self.members[total-1]
  end

  def search(person)
    num1 = self.members.index(person)
    if num1 == nil
      return nil
    end
    self.members[num1]
  end

  private

  def index(person)
  end

end

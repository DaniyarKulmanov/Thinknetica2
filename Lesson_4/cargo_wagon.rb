require '../Lesson_4/wagon'

class CargoWagon < Wagon
  attr_reader :capacity, :roof

  def initialize(capacity, roof = true)
    super(9, 7)
    @capacity = capacity
    @roof = roof
  end
end

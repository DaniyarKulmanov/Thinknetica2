require '../Lesson_4/wagon'

class PassengerWagon < Wagon
  # количество пассажирских мест
  # купейный, пласкарт или сидячий
  # wifi / без wifi
  attr_reader :seats, :type

  def initialize(seats, type)
    super(8, 6)
    @seats = seats
    @type = type
  end

end

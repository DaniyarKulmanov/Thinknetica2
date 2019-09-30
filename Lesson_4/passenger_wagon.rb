require '../Lesson_4/wagon'

class PassengerWagon < Wagon
  attr_reader :seats, :type
  attr_accessor :wifi

  def initialize(seats, type, wifi = true)
    super(8, 6)
    @seats = seats
    @type = type
    @wifi = wifi
  end

end

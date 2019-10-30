require_relative 'wagon'

class PassengerWagon < Wagon
  attr_reader  :type
  attr_accessor_with_history :free_seats, :wifi, :reserved_seats

  def initialize(seats, type, wifi = true)
    super(8, 2.5)
    @free_seats = seats
    @reserved_seats = 0
    @type = type
    @wifi = wifi
  end

  def reserve_seat
    @free_seats -= 1 unless @free_seats.zero?
    @reserved_seats += 1 unless @free_seats < 0
  end
end

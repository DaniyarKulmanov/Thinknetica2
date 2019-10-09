require_relative 'wagon'

class CargoWagon < Wagon
  attr_reader :free_capacity, :roof, :reserved_capacity, :max_capacity

  def initialize(capacity, roof = true)
    super(9, 7)
    @max_capacity = capacity
    @free_capacity = capacity
    @reserved_capacity = 0
    @roof = roof
  end

  def reserve_capacity(capacity)
    @free_capacity -= capacity if @free_capacity >= capacity
    @reserved_capacity += capacity unless @reserved_capacity + capacity > @max_capacity
  end

end

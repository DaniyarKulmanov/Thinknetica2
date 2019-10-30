require_relative 'wagon'

class CargoWagon < Wagon

  attr_accessor_with_history :free_capacity, :roof, :reserved_capacity, :max_capacity

  def initialize(capacity, roof = true)
    super(9, 3)
    @max_capacity = capacity
    @free_capacity = capacity
    @reserved_capacity = 0
    @roof = roof
  end

  def reserve_capacity(capacity)
    target_capacity = @reserved_capacity + capacity
    self.free_capacity -= capacity if @free_capacity >= capacity
    self.reserved_capacity = target_capacity unless target_capacity > @max_capacity
  end
end

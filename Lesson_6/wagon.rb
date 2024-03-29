require_relative 'manufacturer'

class Wagon
  include Manufacturer

  attr_reader :length, :height

  def initialize(length, height)
    @length = length
    @height = height
    validate!
  end

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise 'Длинна не должна превышать 10 метров' if length > 10
    raise 'Высота не должна превышать 3 метров' if height > 3
  end
end

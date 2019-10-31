require_relative 'manufacturer'
require_relative 'accessors'

class Wagon
  extend Accessors
  include Manufacturer

  strong_accessor :length, class: 'Integer'
  strong_accessor :height, class: 'Integer'

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

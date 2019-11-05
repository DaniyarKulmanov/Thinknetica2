require_relative 'manufacturer'
require_relative 'accessors'
require_relative 'validation'

class Wagon
  extend Accessors
  include Manufacturer
  include Validation

  LENGTH_RULE = 'Длинна не должна превышать ='.freeze
  HEIGHT_RULE = 'Высота не должна превышать ='.freeze

  strong_accessor :wagon_length, class: 'Integer'
  strong_accessor :wagon_height, class: 'Integer'

  def initialize(length, height)
    @wagon_length = length
    @wagon_height = height
    attributes_check
  end

  protected

  def attributes_check
    validate :wagon_length, :length, 10, LENGTH_RULE
    validate :wagon_height, :length, 3, HEIGHT_RULE
    validate!
  end
end

class Wagon
  
  include Manufacturer

  attr_reader :length, :height

  def initialize(length, height)
    @length = length
    @height = height
  end
end

require_relative 'instance_counter'
require_relative 'accessors'
require_relative 'validation'

class Route
  extend Accessors
  include InstanceCounter
  include Validation

  attr_reader :stations, :first_station, :last_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
    attributes_check
  end

  def add_station(station)
    @stations.insert(1, station)
  end

  def remove_station
    puts 'Отсутствуют промежуточные станции' if @stations.size == 2
    @stations.delete_at(1) if @stations.size > 2
  end

  private

  def attributes_check
    self.class.validate :first_station, :presence
    self.class.validate :last_station, :presence
    validate!
  end
end

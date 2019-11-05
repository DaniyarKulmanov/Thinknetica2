require_relative 'instance_counter'
require_relative 'accessors'
require_relative 'validation'

class Station
  extend Accessors
  include InstanceCounter
  include Validation

  RUSWPORDS = /^[а-я]/i
  NAME_RULE = 'Название должно состоять из кириллицы'.freeze
  LENGTH_RULE = 'Длина названия должна быть не больше'.freeze

  attr_reader :trains
  attr_accessor :name

  class << self
    attr_accessor :stations
  end

  validate :name, :format, RUSWPORDS, NAME_RULE
  validate :name, :length, 5, LENGTH_RULE

  def initialize(name)
    @name = name
    @trains = []
    validate!
    self.class.stations ||= []
    self.class.stations << self
    register_instance
  end

  def arrival(train)
    @trains << train
  end

  def trains_by_type
    @trains.sort
    @trains.each { |train| puts train.type }
  end

  def departure(train)
    @trains.delete(train)
  end

  def trains_seek
    trains.each do |train|
      yield(train)
    end
  end
end

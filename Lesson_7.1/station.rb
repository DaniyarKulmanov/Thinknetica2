require_relative 'instance_counter'

class Station

  RUSWPORDS = /^[а-я]/i

  @@stations = []

  def self.all
    @@stations
  end

  include InstanceCounter

  attr_reader :trains
  attr_accessor :name

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
    validate!
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

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise 'Название должно состоять из кириллицы' if @name !~ RUSWPORDS
    raise 'Длина названия должна быть не меньшу 3 букв' if @name.length < 3
  end

end


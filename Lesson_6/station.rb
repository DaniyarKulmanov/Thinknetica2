require_relative 'instance_counter'

class Station

  RUSWPORDS = /^[а-я]/

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
    puts "Поезд #{train.id} прибыл на станицию #{@name}"
    @trains << train
  end

  def trains_by_type
    @trains.sort
    @trains.each { |train| puts train.type }
  end

  def departure(train)
    puts "Поезд #{train.id} выехал со станции #{@name}"
    @trains.delete(train)
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


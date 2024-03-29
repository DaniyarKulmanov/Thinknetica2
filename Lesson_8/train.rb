require_relative 'manufacturer'
require_relative 'instance_counter'
require_relative 'accessors'
require_relative 'validation'

class Train
  extend Accessors
  include Manufacturer
  include InstanceCounter
  include Validation

  PROPERID = /^([а-я]|\d){3}-*([а-я]|\d){2}$/i
  ID_RULE = 'ID ошибка, кириллица и цифры (xxx-xx), дефис не обязателен'.freeze

  attr_reader :wagons, :route
  attr_reader :previous_station, :current_station, :next_station
  attr_accessor :id

  strong_accessor :speed, class: 'Integer'

  validate :id, :length, 5
  validate :id, :format, PROPERID, ID_RULE

  class << self
    attr_accessor :trains

    def find(search)
      @trains[search.to_sym]
    end
  end

  def initialize(id)
    @id = id
    @wagons = []
    @speed = 0
    validate!
    self.class.trains ||= {}
    self.class.trains[id.to_sym] = self
    register_instance
  end

  def stop
    @speed = 0
  end

  def attach_wagon(wagon)
    conditions_check
    @wagons << wagon if speed.zero?
  end

  def remove_wagon(wagon)
    conditions_check
    @wagons.delete(wagon) if speed.zero?
  end

  def add_route(route)
    @route = route
    @route.stations.first.arrival self
    stations current_position
  end

  def travel(direction) # replace case with hash
    if direction != 'forward' && direction != 'back'
      puts 'Please enter forward or back'
    else
      case direction
      when 'forward'then index = current_position + 1
      when 'back' then index = current_position - 1
      end
      move_train index
    end
  end

  def wagons_seek
    wagons.each do |wagon|
      yield(wagon)
    end
  end

  protected

  def accelerate
    @speed += 10
  end

  private

  def conditions_check
    puts 'First stop train' if speed != 0
  end

  def current_position
    @route.stations.find_index { |station| station.trains.include?(self) }
  end

  def move_train(new_position)
    if nil_or_negative? new_position
      puts 'First or Last station reached'
    else
      stations new_position
      @route.stations[current_position].departure(self)
      @route.stations[new_position].arrival(self)
    end
  end

  def stations(set)
    @next_station = nil
    @previous_station = nil
    previous = @route.stations[set - 1]
    following = @route.stations[set + 1]
    @previous_station = previous unless nil_or_negative?(set - 1)
    @current_station = @route.stations[set].name
    @next_station = following unless nil_or_negative?(set + 1)
  end

  def nil_or_negative?(number)
    @route.stations[number].nil? || number.negative?
  end
end

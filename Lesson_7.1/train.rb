require_relative 'manufacturer'
require_relative 'instance_counter'

class Train
  include Manufacturer
  include InstanceCounter

  PROPERID = /^([а-я]|\d){3}-*([а-я]|\d){2}$/i
  IDLENGTH = 'Длина номера не должна превышать 5 букв'.freeze
  IDFORMAT = 'Не верный формат, заполните по шаблону: ххх-xx или ххххх!'.freeze

  @@trains = {}

  attr_reader :speed, :wagons, :routes
  attr_reader :previous_station, :current_station, :next_station
  attr_accessor :id

  def self.find(search)
    @@trains[search.to_sym]
  end

  def initialize(id)
    @id = id
    @wagons = []
    @speed = 0
    validate!
    @@trains[id.to_sym] = self
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

  def valid?
    validate!
    true
  rescue
    false
  end

  protected

  def validate!
    raise IDLENGTH if @id.delete('-').length > 5
    raise IDFORMAT if @id !~ PROPERID
  end

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
    previous = set - 1
    nextt = set + 1
    @previous_station = @route.stations[previous].name unless nil_or_negative? previous
    @current_station = @route.stations[set].name
    @next_station = @route.stations[nextt].name unless nil_or_negative? nextt
  end

  def nil_or_negative?(number)
    @route.stations[number].nil? || number.negative?
  end
end
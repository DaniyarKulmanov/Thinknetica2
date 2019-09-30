require '../Lesson_3/railway_station'
require '../Lesson_3/railway_route'

class RailwayTrain
  attr_reader :speed, :wagons, :route
  attr_reader :previous_station, :current_station, :next_station

  def initialize(id, type, wagons)
    @id = id
    @type = type
    @wagons = wagons
    @speed = 0
  end

  def accelerate
    @speed += 10
  end

  def stop
    @speed = 0
  end

  def attach_wagon
    conditions_check
    @wagons += 1 if speed.zero?
  end

  def remove_wagon
    conditions_check
    @wagons -= 1 if speed.zero?
  end

  def add_route(route)
    @route = route
    @route.stations.first.arrival self
    stations current_position
  end

  def travel(direction)
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

  private

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
    @previous_station = @route.stations[previous].name unless nil_or_negative?previous
    @current_station = @route.stations[set].name
    @next_station = @route.stations[nextt].name unless nil_or_negative? nextt
  end

  def conditions_check
    puts 'First stop train' if speed != 0
    puts 'No wagons to remove' if @wagons.zero?
  end

  def nil_or_negative?(number)
    @route.stations[number].nil? || number.negative?
  end
end

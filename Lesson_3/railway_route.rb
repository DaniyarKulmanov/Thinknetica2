require '../Lesson_3/railway_station'

class Route
  attr_reader :stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @stations = [first_station, last_station]
  end

  def add_station(station)
    @stations.insert(1, station)
   end

  def remove_station(station)
    puts "No middle stations to delete" if @stations.size == 2
    @stations.delete_at(1) if @stations.size > 2
  end
end


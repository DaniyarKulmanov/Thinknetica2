# вызывать self.speed в другом методе без знака "="
require '../Lesson_3/railway_train'

class RailwayStation
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def arrival(train)
    puts "Trains #{train} arrived to #{@name}"
    @trains << train
  end

  def trains_by_type
    @trains.sort
    @trains.each { |train| puts train.type }
  end

  def departure(train)
    puts "Train #{train} departed from #{@name}"
    @trains.delete(train)
  end
end

require '../Lesson_3/railway_train'

class Station
  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
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
end

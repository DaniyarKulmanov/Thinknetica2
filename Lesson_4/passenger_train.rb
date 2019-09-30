require '../Lesson_4/train'
require 'Lesson_4/passenger_wagon'

class PassengerTrain < Train
  MAX_SPEED = 100

  def attach_wagon(wagon)
    if wagon.class == PassengerWagon
      super
    else
      puts "Wagon = #{wagon}, must be Passenger wagon"
    end
  end

  def accelerate
    if @speed >= MAX_SPEED
      puts 'Max speed reached'
    else
      super
    end
  end
end

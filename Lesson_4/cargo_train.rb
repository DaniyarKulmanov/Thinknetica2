require '../Lesson_4/train'
require '../Lesson_4/cargo_wagon'

class CargoTrain < Train
  MAX_SPEED = 80

  def attach_wagon(wagon)
    if wagon.class == CargoWagon
    super
    else
      puts "Wagon = #{wagon}, must be Cargo wagon"
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

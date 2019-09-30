require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'cargo_wagon'
require_relative 'passenger_wagon'

def create_wagon(train)
  wagon = PassengerWagon.new 100, 'coupe' if train.class == PassengerTrain
  wagon = CargoWagon.new 100, 'coupe' if train.class == CargoTrain
  train.attach_wagon(wagon)
end

def remove_wagon(train)
  train.remove_wagon(train.wagons.last)
end

def wagons_management(trains, operation)
  puts 'Выберите поезд из списка поездов:'
  list_trains(trains)
  puts 'Введите номер поезда для добавления/удаления вагона, пример 1'
  index = gets.chomp.to_i
  true_index = index - 1
  if trains[true_index].nil?
    puts "Выберите поезд из диапозона 0 - #{trains.size}"
  else
    create_wagon(trains[true_index]) if operation == 'add'
    remove_wagon(trains[true_index]) if operation == 'remove'
    puts "Поезд имеет #{trains[true_index].wagons.size} вагонов"
  end
end



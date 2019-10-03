require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'wagons_management'

def create_train(trains)
  loop do
    puts 'Введите номер поезда:'
    id = gets.chomp
    puts 'Выберите тип поезда:', '1. Пассажирский', '2. Грузовой'
    type = gets.chomp
    train = PassengerTrain.new(id) if type.to_i == 1
    train = CargoTrain.new(id) if type.to_i == 2
    trains << train
    break
  end
end

def list_trains(trains)
  trains.each_with_index do |train, index|
    type = 'пассажирский' if train.class == PassengerTrain
    type = 'грузовой' if train.class == CargoTrain
    puts "#{index + 1}. Поезд №#{train.id}, тип #{type}, вагонов #{train.wagons.size}"
  end
end

def move_trains(trains, direction)
  puts 'Выберите поезд из списка поездов:'
  list_trains(trains)
  puts 'Введите номер поезда для выполнения операции, пример 1'
  index = gets.chomp.to_i
  index -= 1
  if trains[index].nil?
    puts "Выберите поезд из диапозона 1 - #{trains.size}"
  elsif trains[index].route.nil?
    puts 'Не присвоен маршрут'
  else
    trains[index].travel(direction)
  end
end

def trains_management(trains)
  loop do
    puts 'Что Вы хотите сделать?',
         '1. Создать поезд',
         '2. Посмотреть поезда',
         '3. Добавить вагон',
         '4. Отцепить вагон',
         '5. Переместить поезд на следующую станцию',
         '6. Переместить поезд на предыдущую станцию',
         '0. Назад'
    input = gets.chomp.to_i
    case input
    when 1 then create_train(trains)
    when 2 then list_trains(trains)
    when 3 then wagons_management(trains, 'add')
    when 4 then wagons_management(trains, 'remove')
    when 5 then move_trains(trains, 'forward')
    when 6 then move_trains(trains, 'back')
    else
      puts 'Введите цифру от 0 до 6'
    end
    break if input.zero?
  end
end

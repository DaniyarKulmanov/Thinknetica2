require_relative 'train'
require_relative 'station'
require_relative 'wagon'
require_relative 'passenger_wagon'
require_relative 'cargo_wagon'

stations = []
wagons = []
trains = []

# values for test data
random_words = (('А'..'Я').to_a + ('а'..'я').to_a + (0..9).to_a).shuffle
random_cities = %w[Астана Алматы Шымкент Жезказган]

# hypen generation
hyphen = proc do |x|
  x = ['-', ''].shuffle
  x[0]
end

# test data generation
# stations
2.times do
  station_id = random_cities[rand(3)]
  random_cities.delete(station_id)
  stations.push Station.new station_id
end

# trains
2.times do
  train_id = ''
  5.times { train_id += random_words[rand(60)].to_s }
  train_id.insert(3, hyphen.call)
  trains.push Train.new train_id
end

# wagons
wagons.push PassengerWagon.new 20, 'coupe'
rand(10).times { wagons[0].reserve_seat }
wagons.push CargoWagon.new 100, false
wagons[1].reserve_capacity rand(99)

# friendship
(0..1).each do |i|
  stations[i].arrival trains[i]
  trains[i].attach_wagon wagons[i]
end

# demonstration print - - - -
puts '=====================Станции======================='
stations.each do |station|
  puts "Станция #{station.name}, поезда на станции:"
  station.trains.each do |train|
    puts "поезд № #{train.id}, вагонов #{train.wagons.size}"
  end
end

puts '=====================Поезда======================='
trains.each do |train|
  puts "Поезд #{train.id}, вагоны:"
  train.wagons.each_with_index do |wagon, index|
    if wagon.class == PassengerWagon
      puts "#{index + 1}. Пассажирский вагон"
      puts "Свободных мест = #{wagon.free_seats}"
      puts "Занятых мест = #{wagon.reserved_seats}"
    elsif wagon.class == CargoWagon
      puts "#{index + 1}. Грузовой вагон"
      puts "Свободный объём = #{wagon.free_capacity}"
      puts "Занятый объём = #{wagon.reserved_capacity}"
    end
  end
end

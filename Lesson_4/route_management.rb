require_relative '../Lesson_4/route'
require_relative '../Lesson_4/station'
require_relative '../Lesson_4/station_management'

def create_route(stations, routes)
  puts 'Выберите станицию из списка:'
  list_stations(stations)
  puts 'Введите номер начальной станции для выполнения операции, пример 1'
  first_station = gets.chomp.to_i - 1

  puts 'Введите номер конечной станции для выполнения операции, пример 1'
  last_station = gets.chomp.to_i - 1
  if stations[first_station].nil? || stations[last_station].nil?
    puts "Выберите станцию из диапозона 1 - #{stations.size}"
  else
    routes << Route.new(stations[first_station], stations[last_station])
    puts 'Маршрут создан'
  end
end

def list_routes(routes)
  routes.each_with_index do |route, index|
    puts '==========================================='
    puts "#{index + 1}. маршрут #{route.first_station.name} - #{route.last_station.name}"
    puts 'Всего станций в маршруте:'
    route.stations.each { |station| puts station.name }
    puts '==========================================='
  end
end


def choose_route(stations, routes, input)
  puts "Выбрите маршрут из диапозона 1 - #{routes.size}:"
  list_routes(routes)
  choice = gets.chomp.to_i

  route = routes[choice - 1]
  puts 'Выберите станицию из списка:'
  list_stations(stations)
  choice = gets.chomp.to_i
  choice -= 1

  if stations[choice].nil?
    puts "Выберите стнацию из диапозона 1 - #{stations.size}"
  else
    route.add_station(stations[choice]) if input == 2
    route.remove_station if input == 3
  end
end


def route_management(routes, stations)
  loop do
    puts 'Что Вы хотите сделать?',
         '1. Создать маршрут',
         '2. Добавить станцию в маршрут',
         '3. Удалить станцию в маршруте',
         '4. Просмотреть все маршруты',
         '0. Назад'
    input = gets.chomp.to_i
    case input
      when 1 then create_route(stations, routes)
      when (2..3) then choose_route(stations, routes, input)
      when 4 then list_routes(routes)
    end
    break if input.zero?
  end
end

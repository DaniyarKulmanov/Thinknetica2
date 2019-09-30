require_relative 'include'
stations = []

loop do
  puts 'Выберите пункт меню:',
       '1. Станции',
       '2. Позда',
       '3. Маршруты',
       '0. Выход'
  input = gets.chomp.to_i
  case input
  when 1
    station_management(stations)
  when 2
    trains
  when 3
    routes
  else
    puts 'Введите цифровое значение'
    break if input.zero?
  end
end

puts 'До свидания!'

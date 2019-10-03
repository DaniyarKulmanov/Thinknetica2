require_relative 'include'
stations = []
trains = []
routes = []

loop do
  main_menu
  input = gets.chomp.to_i
  case input
  when 1
    station_management(stations)
  when 2
    trains_management(trains)
  when 3
    route_management(routes, stations)
  else
    break if input.zero?
  end
end

puts 'До свидания!'

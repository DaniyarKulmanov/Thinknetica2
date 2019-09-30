require_relative 'station'

def create_station(stations)
  loop do
    puts 'Введите имя новой станции:'
    name = gets.chomp.to_s
    station = Station.new name
    stations << station
    puts "Станция #{station.name} создана" #unless stations[station].nil?
    break
  end
end
def station_management(stations)
  loop do
    puts 'Что Вы хотите сделать?',
         '1. Создать станцию',
         '2. Посмотреть список станций',
         '0. Назад'
    input = gets.chomp.to_i
    case input
    when 1 then create_station(stations)
    when 2 then stations.each { |station| puts "Станция = #{station.name}" }
    end
    break if input.zero?
  end
end

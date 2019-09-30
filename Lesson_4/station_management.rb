require_relative 'station'
stations = []

def create_station
  loop do
    puts 'Please enter station name:'
    name = gets.chomp.to_s
    station = Station.new name
    stations << station
    puts "Station #{station} successfully created" unless stations[station].nil?
  end
end
def station_management
  loop do
    puts 'Что Вы хотите сделать?',
         '1. Создать станцию',
         '2. Посмотреть список станций',
         '0. Назад'
    input = gets.chomp.to_i
    case input
    when 1 then create_station
    when 2 then stations.each { |station| puts "Station = #{station}" }
    end
    break if input.zero?
  end
end

require_relative 'train'

trains = {}
MESSAGE = 'Введите номер поезда, формат ххх-хх'

loop do
  puts 'Что Вы хотите сделать?',
       '1. Создать поезд',
       '2. Посмотреть поезда',
       '0. Выход'
  input = gets.chomp.to_i
  break if input.zero?
  case input
  when 1
    puts MESSAGE
    id = gets.chomp
    begin
      trains[id.to_sym] = Train.new id
      puts "Поезд с номером #{id} успешно создан"
    rescue StandardError => e
    puts e.message
    puts 'Создание не успешно, повторите операцию'
    end
  when 2
    puts 'Нет поездов' if trains.empty?
    trains.each { |key, value| puts "Поезд № #{key}" }
  end
end

puts 'До свиданья!'

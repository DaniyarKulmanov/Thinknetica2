puts 'Введите год:'
year = gets.chomp.to_i

puts 'Введите месяц:'
month = gets.chomp.to_i

puts 'Введите дату текущего дня:'
current_day = gets.chomp.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if year != 2000 && ((year % 4).zero? && year % 100 != 0 || (year % 400).zero?)
  months[1] += 1
end

(1...month).each{ |i| current_day += months[i] }

puts "Текущий порядковый номер дня = #{current_day}"

puts "Все значения должны быть числовыми!"
puts "Введите Ваш вес:"

ves = Integer(gets.chomp)

puts "Введите Ваш рост:"

rost = Integer(gets.chomp)

best_ves = rost - 110

if best_ves >= 0
  puts "Ваш идеальный вес = #{best_ves}"
else
  puts "Ваш вес оптимален"
end
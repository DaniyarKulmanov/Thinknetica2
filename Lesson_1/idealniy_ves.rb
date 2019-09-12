puts "Все значения должны быть числовыми!"
puts "Введите Ваше имя:"
name = gets.chomp.to_s

puts "Введите Ваш рост:"

height = Integer(gets.chomp)

best_weight = height - 110

if best_weight >= 0
  puts "#{name} Ваш идеальный вес = #{best_weight}"
else
  puts "#{name} Ваш вес оптимален"
end

puts "Все значения должны быть числовыми!"

puts "Введите высоту треугольника:"
visota = Integer(gets.chomp)

puts "Введите основание треугольника"
osnovanie = Integer(gets.chomp)

puts "Площадь треугольника = #{visota * (osnovanie / 2)}"

def koeff (name)
  puts "Введите коэфцент #{name}"
  gets.chomp.to_f
end

a = koeff('A')
b = koeff('B')
c = koeff('C')

d = b**2 - 4 * a * c

if d > 0
  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a
  puts "Корень 1 = #{x1}, корень 2 = #{x2}"
elsif d == 0
  x1 = -b / 2 * a
  puts "Корни равны = #{x1}"
elsif d < 0
  puts "корней нет!"
end
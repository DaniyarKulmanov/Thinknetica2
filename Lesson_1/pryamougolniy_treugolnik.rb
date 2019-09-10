puts "Все значения должны быть числовыми!"

def storona (x,name)
  puts "Введите сторону #{name}"
  x = gets.chomp.to_f
end

a = storona(a, "A")
b = storona(b, "B")
c = storona(c, "C")

if a > b && a > c
  puts "Треугольник приямоугольный" if a**2 == b**2 + c**2
elsif b > a && b > c
  puts "Треугольник приямоугольный" if b**2 == a**2 + c**2
elsif c > a && c > b
  puts "Треугольник приямоугольный" if c**2 == b**2 + a**2
end
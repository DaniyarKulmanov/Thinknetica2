puts "Все значения должны быть числовыми!"

def storona (name)
  puts "Введите сторону #{name}"
  gets.chomp.to_f
end

a = storona('A')
b = storona('B')
c = storona('C')

if a > b && a > c
  puts "Треугольник приямоугольный" if a**2 == b**2 + c**2
elsif b > a && b > c
  puts "Треугольник приямоугольный" if b**2 == a**2 + c**2
elsif c > a && c > b
  puts "Треугольник приямоугольный" if c**2 == b**2 + a**2
end
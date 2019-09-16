my_purchases = {}
total_cost = 0

loop do

  puts 'Ввести название товара или стоп для остановки покупок'
  name = gets.chomp
  break if name.downcase == 'стоп'

  puts "Введите цену за единицу товара #{name}"
  cost = gets.chomp.to_i

  puts "Введите количество товара #{name}"
  amount = gets.chomp.to_i

  my_purchases[name] = { цена: cost, количество: amount }
end

my_purchases.each do |product, details|
  cost = details[:цена] * details[:количество]
  puts "Наименование товара = #{product}"
  puts "Цена за единицу #{details[:цена]}, количество #{details[:количество]}"
  puts "Итоговая сумма #{cost}"
  (total_cost += cost).round(2)
end

puts "Общая сумма: #{total_cost}"

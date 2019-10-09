require_relative 'train'

# values for test data
random_words = (('А'..'Я').to_a + ('а'..'я').to_a + (0..9).to_a).shuffle
random_cities = %w([Astana] [Almaty] [Shymkent] [Zhezkazgan])
random_seats = [18, 21, 24]
random_capacity = [86, 104, 120]

# hypen generation
hyphen = Proc.new do |x|
  x = ['-', ''].shuffle
  x[0]
end

# test data generation
train_id = ''
5.times { train_id += random_words[rand(60)].to_s }
train_id.insert(3, hyphen.call)

tr1 = Train.new train_id

puts tr1.inspect

# test data print


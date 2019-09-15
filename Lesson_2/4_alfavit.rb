words = ('a'..'z').to_a
vowel = %w[a e i o u]
vowels = {}

words.each_with_index do |letter, value|
  vowels[letter] = value + 1 if vowel.include? letter
end

print vowels

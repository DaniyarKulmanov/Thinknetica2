words = ('a'..'z').to_a
vowel = %w[a e i o u]
vowels = {}

words.each.with_index(1) do |letter, value|
  vowels[letter] = value if vowel.include? letter
end

print vowels

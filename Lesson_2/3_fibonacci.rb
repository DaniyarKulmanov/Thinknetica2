fibonacci = [0, 1]

def count(arr)
  arr[-1] + arr[-2]
end

fibonacci << count(fibonacci) while count(fibonacci) < 100

print fibonacci


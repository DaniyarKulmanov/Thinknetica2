fibonacci = []
fibonacci[0] = 0
fibonacci[1] = 1

fibonacci << fibonacci[-1] + fibonacci[-2] while fibonacci[-1] < 89

print fibonacci


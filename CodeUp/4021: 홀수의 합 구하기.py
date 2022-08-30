data = list(map(int, input().split()))

sum = 0
for i in data:
    if i%2 == 0:
        continue
    sum += i
    
if sum != 0:
    print(sum)
else:
    print("-1")

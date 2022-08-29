c = int(input())

change = [50000, 10000, 5000, 1000, 500, 100, 50, 10]
count = 0

for i in change:
    while c >= i:
        count += 1
        c -= i
    
print(count)

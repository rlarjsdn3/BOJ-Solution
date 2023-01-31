n = int(input())
m = list(map(int, input().split()))

count = 0
next_milk = 0
for i in range(0, len(m)):
    if m[i]==next_milk:
        next_milk = ((next_milk+1)%3)
        count += 1
print(count)

import code

n = int(input())

code_name = []
for i in range(n):
    name = input()
    tmp = ''
    for j in range(len(name)-1, -1, -1):
        tmp += name[j]
    code_name.append(tmp)

for c in code_name:
    print(c)

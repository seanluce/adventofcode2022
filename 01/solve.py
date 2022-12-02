with open('./01/input.txt') as data:
    rows = data.readlines()

elfArray = []
elfTotal = 0

for row in rows:
    if row != '\n':
        elfTotal += int(row)
    else:
        elfArray.append(elfTotal)
        elfTotal = 0

elfArray = sorted(elfArray)

print(elfArray[len(elfArray)-1])

print(elfArray[len(elfArray)-1] + elfArray[len(elfArray)-2] + elfArray[len(elfArray)-3])



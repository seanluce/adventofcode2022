with open('./02/input.txt') as data:
    rows = data.read().split('\n')

score = 0

for row in rows:
    if row == 'A X':
        score += 4
    elif row == 'A Y':
        score += 8
    elif row == 'A Z':
        score += 3
    elif row == 'B X':
        score += 1
    elif row == 'B Y':
        score += 5
    elif row == 'B Z':
        score += 9
    elif row == 'C X':
        score += 7
    elif row == 'C Y':
        score += 2
    elif row == 'C Z':
        score += 6

print(score)

score = 0

for row in rows:
    if row == 'A X':
        score += 3
    elif row == 'A Y':
        score += 4
    elif row == 'A Z':
        score += 8
    elif row == 'B X':
        score += 1
    elif row == 'B Y':
        score += 5
    elif row == 'B Z':
        score += 9
    elif row == 'C X':
        score += 2
    elif row == 'C Y':
        score += 6
    elif row == 'C Z':
        score += 7

print(score)
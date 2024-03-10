source = 3
destination = 4

supply = [100, 500, 700]
demand = [400, 400, 300, 200]

allocationMatrix = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

totalCost = 0

cost = [[5, 6, 7, 4], [8, 6, 9, 6], [9, 4, 8, 7]]

costNotFound = True

i = 0
j = 0

while costNotFound:
    if i <source and j<destination:
        if supply[i] == demand[j]:
            allocationMatrix[i][j]= supply[i]
            i+= 1
            j+= j
        elif supply[i]> demand[j]:
            supply[i]-= demand[j]
            allocationMatrix[i][j] = demand[j]
            j+=1

        elif supply[i] <demand[j]:
            demand[j] -= supply[i]
            allocationMatrix[i][j] = supply[i]

    else:
        costNotFound = False

print('Allocated Matrix = ')
print(allocationMatrix[0])
print(allocationMatrix[1])
print(allocationMatrix[2])
print('')

for x in range(source):
    for y in range(destination):
        totalCost += cost[x][y] * allocationMatrix[x][y]
       
       
print(f'Total Cost = {totalCost}')
source = 3
destination = 4

supply = [250,300,400]
demand = [200,225,275,250]

allocationMatrix = [[0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0]]

totalCost = 0

cost = [[11,13,17,14], [16,18,14,10], [21,24,13,10]]

costNotFound = True

i = 0
j = 0
print(supply)
print(demand)
while i <source and j<destination:
    if supply[i] == demand[j]:
        allocationMatrix[i][j] = supply[i]
        supply[i] -= supply[i]
        demand[i] -= demand[i]
        i += 1
        j += 1
    elif supply[i] < demand[j]:
        allocationMatrix[i][j] = supply[i]
        demand[j] -= supply[i]
        supply[i] = 0
        i += 1
    elif supply[i] > demand[j]:
        allocationMatrix[i][j] = demand[j]
        supply[i] -= demand[j]
        demand[j] = 0
        j += 1
    print("supply", supply)
    print("demand", demand)
    print("-------------------")

print('Allocated Matrix = ')
print(allocationMatrix[0])
print(allocationMatrix[1])
print(allocationMatrix[2])
print('')

for x in range(source):
    for y in range(destination):
        totalCost += cost[x][y] * allocationMatrix[x][y]
       
       
print(f'Total Cost = {totalCost}')
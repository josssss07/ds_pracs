print("---------------")
no_of_eqns = 3
matrix = [[3,5,2,19],[4,2,-3,3],[1,5,6,29]]
result = [[],[],[]]

op_coeff = 0

for x in range(3):
    op_coeff = matrix[x][x]
    print(op_coeff)

    for y in range(4):
        matrix[x][y] = round((matrix[x][y] / op_coeff),4)

    for z in range(3):
        op_to_be_mul = matrix[z][x]
        print(f"OP:{z,op_to_be_mul}")
        if z == x:
            print("Skipping self row")
        else:
            # matrix[z] is row
            for ya in range(4):
                matrix[z][ya] = round((matrix[z][ya] - (op_to_be_mul*matrix[x][ya])),4)
            print(matrix[z][1])
    
    print(matrix)
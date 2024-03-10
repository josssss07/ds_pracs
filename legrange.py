
dep_val_num = int(input("No. of dependent values n = "))


xVal = []
yVal = []
i = 0


print("Enter values of x : ")


for x in range(dep_val_num):
    xi = int(input(f"x{i} = "))
    xVal.append(xi)
    i = i + 1


print(f'Values of x = {xVal}')
i = 0
print("Enter values of y : ")


for y in range(dep_val_num):
    yi = int(input(f"y{i} = "))
    yVal.append(yi)
    i = i + 1


print(f'Values of y = {yVal}')


xc = int(input("Value of xc = "))
yc = 0


for x in range(dep_val_num):
    sum = 1
    for xn in xVal:
        if xn == xVal[x]:
            pass
        else:
            sum = sum * (xc - xn)/(xVal[x] - xn)
    sum *= yVal[x]

    yc += sum


print("")
print("By Lagrange's Interpolation,")
print(f'yc = {yc}')
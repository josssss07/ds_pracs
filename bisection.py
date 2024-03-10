def sign(value):
    return value >= 0  

def bisection(degree, coeff):
    ans = 0
    x1 = 0
    x2 = 1
    x0 = 0
    func_x0 = 0
    prev_ans = 0

    for x in range(degree + 1):
        prev_ans += coeff[x] * pow(degree, x)

    while True:
        x0 = (x1 + x2) / 2
        func_x0 = coeff[0]  
        for x in range(1, degree + 1):
            func_x0 += coeff[x] * pow(x0, x)

        print(f'{"{:.5f}".format(x1)} | {"{:.5f}".format(x2)} | {"{:.5f}".format(x0)} | {"{:.5f}".format(func_x0)}')
        print('-' * 40)  

        if (x2 - x1) < 0.001:
            break

        if sign(func_x0):
            x2 = x0
        else:
            x1 = x0

    return x2

if __name__ == "__main__":
    poly_degree = int(input("Degree of the polynomial = "))
    poly_coeff = []
    for x in range(poly_degree + 1):
        next_coeff = int(input(f"Coefficient {x} = "))
        poly_coeff.append(next_coeff)

    poly_coeff.reverse()

    print(f'Root of the polynomial (approximately) = {bisection(poly_degree, poly_coeff)}')

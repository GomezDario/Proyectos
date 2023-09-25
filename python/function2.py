def suma(valor1, valor2, valor3):
    return valor1 + valor2 + valor3

def division(valor1, valor2):
    return valor1 / valor2

# resultado = division(60,2) + suma(50,74,11)
# print(resultado)

def multiplesValores():
    return "String", 1, True, 25,6


miVariable = suma

result = miVariable(6,8,4)
#print(result)

def mostrarResult(funcion):
    print(funcion(6,8,4))

mostrarResult(suma)






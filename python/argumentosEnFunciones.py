# def suma(*argumento):
#     resultado = 0
#     for valor in argumento:
#         resultado = resultado + valor
#     return resultado
#  
# 
# resultado = suma(1,2,3,4,5,6,7,8,9)
# print(resultado)


def suma(**kwargs):
    valor = kwargs.get('h', ' No contiene el valor')
    print(valor)

resultado = suma(valor = 'Eduardo', x = 2, y = 9, z = True)
print(resultado)
# lista = []
# 
# for valor in range(0,101):
#         lista.append(valor)
# 
# print(lista)

lista = [valor for valor in range(0,101) if valor % 2 == 0]
# 1. valor a agregar en la lista
# 2. el ciclo for con un rango especifico

tupla = tuple(valor for valor in range(0,101) if valor % 2 == 0)

dicc = {indice for indice, valor in enumerate(lista) if indice < 25}

# print(lista)
# print(tupla)
print(dicc)
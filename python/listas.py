miLista = ["String", 1, 2, True, False]
miLista.append(False)
miLista.append(17)
miLista.append(17)
miLista.append(17)
miLista.append(17)

miLista.insert(0, "Otro String")
miLista.remove(17)
unElemento = miLista.pop(2)

# print(miLista)
# print(miLista.count(17))
# print(unElemento)

unaLista = [1,2,3]
otraLista = [4,5,6]
unaLista.extend(otraLista)

print(unaLista)



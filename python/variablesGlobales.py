def palidromo(frase):
    frase = frase.replace(' ','') #variable local de esta funcion
    #print(frase)  
    return frase == frase[::-1]

frase = 'anita lava la tina' #variable global
# print(frase)
resultado = palidromo(frase)
# print(resultado)


def valorGlobal():
    global variableGlobal # para modificar una viriable global en una funcion a nivel local
    variableGlobal = 'Cambiar valor'

variableGlobal = 'Un valor'
print(variableGlobal)

valorGlobal()

print(variableGlobal)


def crearGlobal(unValor):
    global nuevaVariable
    nuevaVariable = unValor

crearGlobal(5)
print(nuevaVariable)
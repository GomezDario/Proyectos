miDiccionario = {"a" : 55, "b" : 56}
miDiccionario["c"] = "Un string " #agrega un nuevo valor a una nueva clave
miDiccionario["a"] = 54 #cambia el valor presente en esa clave

valor = miDiccionario["a"] #obtengo el valor dado en esa clave
#valor2 = miDiccionario.get("z", "Error no existe dicha clave en el diccionario")

#del miDiccionario["a"]

llaves = miDiccionario.keys()
valores = miDiccionario.values()

#print(valor2)
miDiccionario.update({"w" : 7})

print(miDiccionario)
print(list(llaves))
print(list(valores)) 


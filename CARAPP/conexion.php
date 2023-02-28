<?php

$conexion = mysqli_connect('localhost', 'root', '', 'autosdatos') or die(mysql_error($mysqli));

insertar($conexion);

function insertar($conexion){
$marca = $_POST['marca'];
$modelo = $_POST['modelo'];
$potencia = $_POST['potencia'];
$anio = $_POST['anio'];

$consulta = "INSERT INTO coches(marca, modelo, potencia, anio)
VALUES ('$marca', '$modelo', '$potencia', '$anio')";

mysqli_query($conexion, $consulta);
mysqli_close($conexion);

};

if (isset($_POST['consultar'])) {

     $conexion = mysqli_connect('localhost', 'root', '', 'autosdatos') or die(mysql_error($mysqli));

     $marca = $_POST['marca'];

     $resultados = mysqli_query($conexion,"SELECT * FROM coches WHERE marca = '$marca'");
    
     while($consulta = mysqli_fetch_array($resultados)){
        
        echo $consulta['modelo'];
        echo "<br>";
     }

    mysqli_close($conexion);

}







?>

























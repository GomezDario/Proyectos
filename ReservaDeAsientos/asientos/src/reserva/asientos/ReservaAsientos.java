package reserva.asientos;

import java.util.Iterator;
import java.util.Scanner;


public class ReservaAsientos {

	public static void main(String [] args) {
		
		char asientos [][] = new char[10][10]; // matriz 10x10
		boolean bandera = false;
		Scanner teclado = new Scanner(System.in);
		int fila = 0, asiento = 0;
		String respuesta;
		String verMapa;
		
		// Matriz de asientos en libre
		for (int f = 0; f < 10; f++) {
			
			for (int c = 0; c < 10; c++) {
				asientos[f][c]= 'L'; // esta libre
				
			}
			
			
		}
		// bienvenida
		System.out.println("Bienvenido al sistema de reservas");
		
		
		
		// reserva
		while (bandera != true) {
			
			// visualizacion de mapa
			System.out.println("Desea ver los asientos disponibles? S: si / Cualquier otra letra No");
			
			verMapa = teclado.next();	
			
			if (verMapa.equalsIgnoreCase("S")) {
				// aca se llama al metodo 
				dibujarMapa(asientos);
				
			}
			
			// reserva	
			boolean estaOk = false;
			while (estaOk != true) {
				
				
		
			System.out.println("Ingrese fila y asiento que quiere reservar");
			System.out.print("Fila (entre 0 y 9): ");
			fila = teclado.nextInt();
			
			
			System.out.print("Asiento (entre 0 y 9): ");
			asiento = teclado.nextInt();
			
			if (fila <= 9 && fila >= 0) {
				
				if (asiento <= 9 && asiento >= 0) {
					
					estaOk = true;
					
				}else {
					System.out.println("El numero de asiento no es valido");
				      }
				
				
			} else {
				System.out.println("El numero de fila no es valido");
				   }
			
			
			
			}
			
			
			if (asientos[fila][asiento] == 'L') {
				
				asientos[fila][asiento] = 'X';
				System.out.println("El Asiento fue reservado correctamente");
				

			} else {
				System.out.println("El asiento esta ocupado, por favor elija otro");
				
				
				
				
				
			}
			
			System.out.println("Desea seguir reservando asientos? y/n");
			respuesta = teclado.next();
			
			if (respuesta.equalsIgnoreCase("S")) {
				bandera = true;
			}
		
				
			
			
			
			
		}
		
		
		
		
		
	}
	
	static void dibujarMapa(char asientos[][]) {
		
		for (int f = 0; f < 10; f++) {
			
			System.out.print(f + " ");
			
			for (int c = 0; c < 10; c++) {

				System.out.print("[ " + asientos[f][c] + " ]");
			}
			
			System.out.println("");
		}
		
			
		
		
		
	}
	
}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	


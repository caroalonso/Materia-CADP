{ 7.Realizar un módulo que reciba como parámetro: el radio de un círculo y retorne su diámetro y su
perímetro.

a. Utilizando el módulo anterior,realizar un programa que analice información de planetas obtenidas
del Telescopio Espacial Kepler.
De cada planeta se lee
nombre,
su radio (medido en kilómetros)
y la distancia (medida en años luz) a la Tierra.

La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.

Informar:
- Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra
(12.700 km) y mayor o igual que el de Marte (6.780 km).

- Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).    
}

program punto7;

procedure modulo(radio: real; var diametro: real; var perimetro: real);
begin
  diametro := radio * 2;
  perimetro := 2 * 3.1416 * radio;
end;

var
  nombre: string;
  radio: real;
  distancia: real;
  contador: integer;
  diametro: real;
  perimetro: real;
begin
  contador := 0;
  
  repeat
    writeln('Ingrese el radio del planeta (0 para finalizar):');
    readln(radio);
    
    if (radio <> 0) then begin
      writeln('Ingrese el nombre del planeta:');
      readln(nombre);
      writeln('Ingrese la distancia del planeta (en años luz):');
      readln(distancia);
      
      modulo(radio, diametro, perimetro);
      
      // Informar planetas con diámetro entre 6,780 km y 12,700 km
      if (diametro <= 12700) and (diametro >= 6780) then begin
        writeln('Planeta: ', nombre, ', Distancia: ', distancia:0:2, ' años luz');
      end;
      
      // Contar planetas con perímetro superior al de Júpiter
      if (perimetro > 439264) then 
        contador := contador + 1;
    end;
  until (radio = 0);
  
  writeln('Cantidad de planetas con un perímetro superior al del planeta Júpiter: ', contador);
end.

{
7.Realizar un módulo que reciba como parámetro: el radio de un círculo y retorne su diámetro y su
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

procedure modulo( radio:real; var diametro:real; var perimetro:real);
begin
  diametro:= radio*2;
  perimetro:=2*3.1416*radio;
end;

var
  nombre:string[10];
  radio:real;
  distancia:real;
  contador:integer;
  diametro:real;
  perimetro:real;
begin
  contador:=0;
  writeln('ingrese radio: ');
  readln(radio);
  if (radio <> 0)then begin
    writeln('ingrese nombre: ');
    readln(nombre);
    writeln('ingrese distancia: ');
    readln(distancia);
  end;
  while(radio <> 0)do begin
    modulo(radio,diametro,perimetro);
    if(diametro <= 12.700 )and(diametro >=6.780)then begin
      writeLn('planeta: ',nombre,', distancia: ',distancia:2:0);
    end;
    if(perimetro > 439.264 )then 
      contador:=contador+1;
    writeln('ingrese radio: ');
    readln(radio);
    if (radio <> 0)then begin
      writeln('ingrese nombre: ');
      readln(nombre);
      writeln('ingrese distancia: ');
      readln(distancia);
    end;
  end;
  writeLn('Cantidad de planetas con un perimetro superior al del planeta Jupiter:', contador);
end.
{ 5. Realizar un programa que lea información de 200 productos de un supermercado.
De cada producto se lee
código (cada código es un número entre 1 y 200)
y precio .
Informar en pantalla:
-Los códigos de los dos productos más baratos.
-La cantidad de productos de más de 16 pesos con código par.
}

program punto5;
type
  rango=1..200;
var
  codigo:rango;
  precio:real;
  i:integer;
  contador:integer;
  min1:real;
  min2:real;
  codigo1:integer;
  codigo2:integer;
begin
  contador:=0;
  min1:=9999;
  min2:=9999;
  codigo1:=0;
  codigo2:=0;
  for i:= 1 to 200 do begin
    writeln('ingrese precio de producto: ');
    readln(precio);
    writeln('ingrese un codigo de 1 a 100: ');
    readln(codigo);
    if (precio < min1) then begin
      min2:=min1;
      min1:=precio;
      codigo2:=codigo1;
      codigo1:=codigo;
    end  
    else begin
      if(precio < min2) then begin
        min2:=precio;
        codigo2:=codigo;
      end;   
    end;
    if( precio > 16) and (codigo mod 2= 0 ) then 
      contador:= contador+1
  end;
  writeln('producto mas barato 1:',codigo1);
  writeln('producto mas barato 2:',codigo2);
  writeln('productos de más de 16 pesos con código par',contador);
end.
{7. Realice un programa que lea:
el código,
el precio actual
y el nuevo precio de los productos de un almacén.
La lectura finaliza al ingresar el producto con el código 37817, el cual debe procesarse. 
Para cada producto leido, el programa deberá indicar si el nuevo
precio del producto supera en un 10% al precio anterior.

Por ejemplo:
c. Si se ingresa el codigo 109382 , con precio actual 40, y nuevo precio 44, deberá
imprimir: “el aumento de precio del producto 109382 no supera el 10%”

b. Si se ingresa el código 37817, con precio actual 30 y nuevo precio 33,0 , deberá
imprimir: “el aumento de precio del producto 37817 es superior al 10%”
}

Program punto7;
var
  codigo:integer;
  precio_actual:real;
  precio_nuevo:real ;
  diezporciento:real;
begin
  writeln('ingrese codigo: ');
  readln(codigo);
  writeln('ingrese precio actual: ');
  readln(precio_actual);
  writeln('ingrese nuevo precio: ');
  readln(precio_nuevo);
  repeat  
    diezporciento:= ((precio_actual*10)/100);
    if(precio_nuevo = (precio_actual + diezporciento))then begin
      writeln(' el aumento de precio del producto',codigo, 'es superior al 10%' );
    end
    else begin
      writeln ('el aumento de precio del producto ',codigo,' no supera el 10% ' ); 
    end;
    writeln('ingrese codigo: ');
    readln(codigo);
    writeln('ingrese precio actual: ');
    readln(precio_actual);
    writeln('ingrese nuevo precio: ');
    readln(precio_nuevo);
  until(codigo = 37817 );
end.
  
{ 4. Realizar un programa que lea datos de 100 productos de una tienda de ropa.
Para cada producto debe leer:
 el precio,
 código y
 tipo (pantalón, remera, camisa, medias, campera, etc.).
 Informar:
- El código del producto más barato.
- El código del producto de tipo “pantalón” más caro.
}

program punto4;

procedure codigo_producto_barato (precio:real;codigo:integer;var min:real;var cod:integer);
begin
  if(precio < min)then begin
    min:=precio;
    cod:=codigo;
  end;
end;

procedure codigo_de_producto_tipo_pantalon (precio:real; var max:real; var cod2:integer; codigo:integer; ropa:string);
begin
    if(precio > max)and(ropa='pantalones')then begin
      max:=precio;
      cod2:=codigo;
    end;
end;

var
i:integer;
precio:real;
codigo:integer;
ropa:string[15];
min:real;
max:real;
cod:integer;
cod2:integer;

begin
  max:=-1;
  min:= 9999;
  for i:= 1 to 2 do begin // se leen 100 pero 2 para prueba
    writeln('ingrese precio de producto:');
    readln(precio);
    writeln('ingrese codigo de producto:');
    readln(codigo);
    writeln('ingrese nombre de producto:');
    readln(ropa);
    codigo_producto_barato(precio,codigo,min,cod);
    codigo_de_producto_tipo_pantalon (precio,max,cod2,codigo,ropa);
  end;
  writeln;
  writeln('El codigo del producto mas barato: ', cod);
  writeln('El codigo del producto de tipo pantalon mas caro : ',cod2);
end.


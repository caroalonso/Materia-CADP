{ 8.Realizar una solución modularizada para el ejercicio 5 de la práctica 2 que plantea lo siguiente:

Realizar un programa que lea información de 200 productos de un supermercado.
De cada producto se lee
código 
y precio (cada código es un número entre 1 y 200)
Informar en pantalla:

-Los códigos de los dos productos más baratos.
-La cantidad de productos de más de 16 pesos con código par.
}

program punto8;

procedure dos_mas_baratos(codigo: integer; precio: real; var min1: real; var min2: real; var cod1: integer; var cod2: integer);
begin
  if (precio < min1) then begin
    min2 := min1;
    min1 := precio;
    cod2 := cod1;
    cod1 := codigo;
  end
  else if (precio < min2) then begin
    min2 := precio;
    cod2 := codigo;
  end;
end;

procedure cantproductosmayor16par(codigo: integer; precio: real; var contador: integer);
begin
  if (precio > 16) and (codigo mod 2 = 0) then begin
    contador := contador + 1;
  end;
end;

var
  i: integer;
  precio: real;
  codigo: integer;
  cod1: integer;
  cod2: integer;
  min1: real;
  min2: real;
  contador: integer;

begin
  min1 := 9999; // Valor alto para iniciar con el primer producto más barato
  min2 := 9999; // Valor alto para el segundo producto más barato
  contador := 0; // Inicializa el contador para los productos mayores a 16 con código par

  for i := 1 to 200 do begin
    writeln('Ingrese código del producto (entre 1 y 200):');
    readln(codigo);
    writeln('Ingrese precio del producto:');
    readln(precio);

    dos_mas_baratos(codigo, precio, min1, min2, cod1, cod2);
    cantproductosmayor16par(codigo, precio, contador);
  end;

  writeln;
  writeln('Los códigos de los dos productos más baratos son: ', cod1, ' y ', cod2);
  writeln('La cantidad de productos de más de 16 pesos con código par es: ', contador);
end.

  
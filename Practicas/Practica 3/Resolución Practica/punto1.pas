{
a. ¿Qué imprime si se lee el valor 10 en la variable x ?
respuesta : 25.

b. ¿Qué imprime si se lee el valor 10 en la variable x y se cambia el encabezado del procedure por:
procedure suma(num1: integer; num2:integer);
respuesta: 10.

c. ¿Qué sucede si se cambia el encabezado del procedure por:
procedure suma(var num1: integer; var num2:integer);
respuesta: se produce un error por modificar la variable de iteracion i el el proceso suma por que
se esta pasando por referencia.
}

program punto1;

procedure suma(num1: integer; var num2:integer);
begin
 num2 := num1 + num2;
 num1 := 0;
end;
var
 i, x : integer;
begin
 writeLn('ingrese numero: ');
 read(x); { leo la variable x }
 for i:= 1 to 5 do
 suma(i,x);
 write(x); { imprimo las variable x }
end.


{ Modifque el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10
número reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al
leer el décimo número, en cuyo caso deberá informarse “No se ha ingresado el doble de
X” }

program punto5;
var
  x, num: real;
  contador: integer;
begin
  contador := 0;
  
  writeln('Ingrese un numero:');
  readln(x);  { Lee el primer número y lo asigna a x }
  
  writeln('Ingrese un numero:');
  readln(num);  { Lee el primer número después de X }
  
  while (num <> (x * 2)) and (contador < 9) do begin  { Alcanza un máximo de 9 números después de X }
    contador := contador + 1;  { Incrementa el contador antes de leer el siguiente número }
    writeln('Ingrese un numero:');
    readln(num);
  end;
  
  if (num = (x * 2)) then
    writeln('Se ha ingresado el doble de X.')
  else
    writeln('No se ha ingresado el doble de ', x:0:2);
end.


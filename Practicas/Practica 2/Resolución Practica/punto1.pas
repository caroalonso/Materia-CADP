{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}

program punto1;
var
  i:integer;
  contador:integer;
  num:integer;
begin
  contador :=0;
  for i := 1 to 10 do begin
    writeln('ingresar un numero: ');
    readln(num);
    contador := contador + num;
  end;
  writeln(' el resultado de la suma de los 10 numeros es de =' , contador); 
end. 
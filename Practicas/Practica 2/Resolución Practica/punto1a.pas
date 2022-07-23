{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
informe la cantidad de números mayores a 5}

program punto1a;
var
  i:integer;
  contador:integer;
  num:integer;
  num_mayor:integer;
begin
  num_mayor:=0;
  contador :=0;
  for i:= 1 to 10 do begin
    writeln('ingresar un numero: ');
    readln(num);
    contador := contador + num;
    if (num > 5)then 
       num_mayor:= num_mayor+1
  end;
  writeln(' el resultado de la suma de los 10 numeros es: ' , contador);
  writeln('la cantidad de numeros mayores a 5 son:' , num_mayor);
end. 
{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}

program punto1;
var
  i: integer;
  contador: integer;
  num: integer;
  cantidad_mayores_a_5: integer;
begin
  contador := 0;
  cantidad_mayores_a_5 := 0;  { Inicializamos la variable para contar números mayores a 5 }
  
  for i := 1 to 10 do begin
    writeln('Ingresar un número: ');
    readln(num);
    
    contador := contador + num;
    
    if num > 5 then
      cantidad_mayores_a_5 := cantidad_mayores_a_5 + 1;  { Contamos los números mayores a 5 }
  end;
  
  writeln('El resultado de la suma de los 10 números es: ', contador); 
  writeln('La cantidad de números mayores a 5 es: ', cantidad_mayores_a_5);
end.

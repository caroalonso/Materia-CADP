{1. Realice un programa que lea 2 números enteros desde teclcado e informe en pantalla cuál
de los dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los
números leídos son iguales”}

program punto1;
var
  num1, num2: integer;
begin
  writeln('Ingrese el primer número:');
  readln(num1);
  writeln('Ingrese el segundo número:');
  readln(num2);
  
  if (num1 = num2) then
    writeln('Los números leídos son iguales')
  else if (num1 > num2) then
    writeln('El mayor es: ', num1)
  else
    writeln('El mayor es: ', num2);
end.
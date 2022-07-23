{1. Realice un programa que lea 2 números enteros desde teclcado e informe en pantalla cuál
de los dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los
números leídos son iguales”}

program p1.p1;
var
num1:integer;
num2:integer;
begin 
writeln('Ingrese numero 1 :');
readln(num1);
writeln('Ingrese numero 2 :')
readln(num2);
if (num1 = num2) then 
  writeln('Los numeros leidos son iguales')
else
  if(num1 > num2)then 
    writeln(num1)
  else
    writeln(num2);
end.

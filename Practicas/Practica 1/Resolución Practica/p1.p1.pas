
program p1.p1;
var
num1:integer;
num2:integer;
begin 
readln(num1);
readln(num2);
if (num1 = num2) then 
  writeln('Los numeros leidos son iguales')
else
  if(num1 > num2)then 
    writeln(num1)
  else
    writeln(num2);
end.
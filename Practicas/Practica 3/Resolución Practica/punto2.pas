{2. Dado el siguiente programa:

a. Qué imprime si se leen los valores num1=10 y num2=5 ?
respuesta: 9

b. Qué imprime si se leen los valores num1=5 y num2=10 ?
respuesta: 14

}

program punto2;
procedure intercambio(var num1,num2 : integer);
var
  aux:integer;
begin
  aux:= num1;
  num1:= num2;
  num2:= aux;
end;

procedure suma(num1 : integer; var num2 : integer);
begin
  num2 := num1 + num2;
end;

var
  i:integer;
  num1:integer;
  num2: integer;
 begin
   writeln('ingrese num1: ');
   read(num1);
   writeln('ingrese num2: ');
   read(num2);
   for i := 1 to 3 do begin
     intercambio(num1,num2);
     suma(i,num1);
 end;
 writeln(num1);
end.

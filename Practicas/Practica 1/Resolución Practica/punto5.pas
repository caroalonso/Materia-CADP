{ Modifque el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10
número reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al
leer el décimo número, en cuyo caso deberá informarse “No se ha ingresado el doble de
X” }

program punto5;
var
  x:real;
  num:real;
  contador:integer;
begin
 contador:=0;
 writeln('ingrese un numero:');
 readln(num);
 x:=num; 
 while (num <>(x*2)) and (contador < 10) do begin      {(contador < 10) xq solo evaluo 10 numeros y el contador empieza en 0 y el cero tambien se procesa : 0,1,2,3,4,5,6,7,8,9 =10 numeros}
   writeln('ingrese un numero:');
   readln(num);
   contador:=contador+1;
 end;
 if(contador=10) then begin
  writeln ('No se  ingresao el doble de' , x );
 end;
end.

{ 5.Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
a. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima
la cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman
exactamente 10, el cual debe procesarse.
}

program punto5;

procedure uno( num:integer;var cantdig:integer; var contador:integer);
var 
  dig:integer;
begin
  while (num <> 0) do begin 
    dig:=num mod 10; 
    contador:=contador+dig;
    cantdig:=cantdig+1;
    num:=num div 10;
  end;
end;

var
  cantdig:integer;
  contador:integer;
  num:integer;
begin
  cantdig:=0;
  contador:=0;
  writeln('ingrese un numero: ');
  readln(num);
  uno (num,cantdig,contador);
  writeln('cantidad de dígitos que posee :',cantdig );
  writeln('suma total de digitos : ',contador);
end.
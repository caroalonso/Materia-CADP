{Realizar un programa que lea números enteros desde teclado.
La lectura debe finalizar cuando se ingrese el número 100, el cual debe procesarse.
Informar en pantalla:
◦El número máximo leído.
 El número mínimo leído.
 La suma total de los números leídos.
}

program punto3;
var
min:integer;
max: integer;
num:integer;
contador:integer;
begin
  min:=999999;
  max:=-999999;
  contador:=0;
  repeat
    writeln('ingresar un numero: ');
    readln(num);
    if (num > max)then begin
      max:=num;
    end;
    if (num < min)then begin
      min:=num;
    end;
    contador:= contador + num;
  until (num <> 100);
  writeln('el numero maximo leido fue:' , max);
  writeln('el numero minimo leido fue: ', min);
  writeln('el resultado de la suma de los numeros fue: ' ,contador);
end.
    
  



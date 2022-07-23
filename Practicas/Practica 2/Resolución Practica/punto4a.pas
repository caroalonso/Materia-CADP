{4-a Realizar un programa que lea 1000 números enteros desde teclado.
Informar en pantalla cuáles son los dos números mínimos leídos.

a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al
leer el número 0, el cual debe procesarse.
}

Program punto4a;
var
  num:integer;
  min1:integer;
  min2:integer;
  i:integer;
begin 
  min1:=99999;
  min2:=99999;
  repeat
    writeln('ingresar un numero: ');
    readln(num);
    if ( num < min1)then begin
      min2:=min1;
      min1:=num;
    end  
    else begin
      if (num < min2)then 
        min2:=num
    end;  
  until(num=0); 
  writeln('los dos numeros minimos leidos son el ', min1,' y el ',min2);
end.
{ 4-b Realizar un programa que lea 1000 números enteros desde teclado.
Informar en pantalla cuáles son los dos números mínimos leídos.

a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al
leer el número 0, el cual debe procesarse.

b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al
leer el número 0, el cual no debe procesarse.
}

Program punto4b;
var
  num:integer;
  min1:integer;
  min2:integer;
  i:integer;
begin 
  min1:=99999;
  min2:=99999;
  writeln('ingresar un numero: ');
  readln(num);
  while(num <> 0)do begin
    if(num < min1)then begin
      min2:=min1;
      min1:=num;
    end  
    else begin
      if(num < min2)then 
        min2:=num
    end;
    writeln('ingresar un numero: ');
    readln(num);
  end;
  writeln('los dos numeros minimos leidos son el ', min1,' y el ',min2);
end.

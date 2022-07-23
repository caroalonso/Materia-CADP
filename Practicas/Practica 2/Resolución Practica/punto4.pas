{ 4.Realizar un programa que lea 1000 números enteros desde teclado.
Informar en pantalla cuáles son los dos números mínimos leídos.
}

Program punto4;
var
  num:integer;
  min1:integer;
  min2:integer;
  i:integer;
begin 
  min1:=9999;
  min2:=9999;
  for i := 1 to 1000 do begin 
    writeln('ingresar un numero: ');
    readln(num);
    if ( num < min1)then begin
      min2:=min1;
      min1:=num;
   end  
   else begin
     if (num<min2)then begin
       min2:=num;
     end;
   end;
  end;
  writeln('los dos numeros minimos leidos son el ', min1,' y el ',min2);
end.


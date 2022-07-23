{ a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se
lee la misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”
}

program punto2a;
var
max:integer;
i:integer;
num:integer;
posicion :integer;
begin
  max:=-99999;
  for i:= 1 to 10 do begin 
    writeln('ingresar un numero: ');
    readln(num);
    if (num > max) then begin
      max:=num;
      posicion := i;
    end;
  end;
  writeln('el mayor numero leido fue ', max);
  writeln('la posicion del mayor numero fue la ', posicion);
end.
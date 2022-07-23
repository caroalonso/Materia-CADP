{4.Realice un programa que lea un número real X. Luego, deberá leer números reales hasta
que se ingrese uno cuyo valor sea exactcmente el doble de X (el primer número leído)
}

program punto4;
var
  x:real;
  num:real;
begin
  Writeln('Ingrese un numero:');
  readln(num);
  x:=num;
  while(num <> (x*2) )do begin
    Writeln('Ingrese un numero:');
    readln(num);
  end;
  Writeln('fin');
end.
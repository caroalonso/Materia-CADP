{4.Realice un programa que lea un número real X. Luego, deberá leer números reales hasta
que se ingrese uno cuyo valor sea exactcmente el doble de X (el primer número leído)
}

program punto4;
var
  x, num: real;
begin
  Writeln('Ingrese un numero:');
  readln(x);  { Aquí se lee el primer número y se asigna a x }
  
  Writeln('Ingrese un numero:');
  readln(num);  { Luego, se lee otro número }

  while(num <> (x * 2)) do begin
    Writeln('Ingrese un numero:');
    readln(num);  { Se sigue leyendo hasta que num sea el doble de x }
  end;

  Writeln('fin');
end.

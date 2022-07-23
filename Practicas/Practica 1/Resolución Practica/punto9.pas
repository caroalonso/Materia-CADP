{ 9. Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se
ingresa otro carácter, debe informar un error y finalizar. Una vez leído el carácter de suma
o resta, deberá leerse una secuencia de números enteros que finaliza con 0.
El programa deberá aplicar la opercción leída con la secuencia de números, e imprimir el resultado
final. Por ejemplo:
c. Si se leé el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 -
(-6))
b. Si se leé el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 +
6 + (-1 ))
}

program punto9;
var
  caracter:char;
  contador: integer;
  num:integer;
begin
  contador:=0;
  writeln('ingresar caracter: ');
  readln(caracter);
  if(caracter='-') or ( caracter ='+') then begin
    if(caracter='+')then begin
      writeln('ingresar un numero: ');
      readln(num);
      while (num <> 0) do begin
        contador := contador + num;
        writeln('ingresar un numero: ');
        readln(num);
      end;
      writeln('resultado: ', contador);
    end  
    else begin
      writeln('ingresar un numero: ');
      readln(num);
      while (num<>0) do begin
        contador:= contador - num;
        writeln('ingresar un numero: ');
        readln(num);
      end;
      writeln('resultado: ', contador);
    end;
  end  
  else begin 
    writeln('Error');
  end;
end.
      

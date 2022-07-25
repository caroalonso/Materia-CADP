{ 6. Realizar un programa que lea secuencia de números enteros.
La lectura finaliza cuando llega el número 123456, el cual no debe procesarse.
Informar en pantalla para cada número la suma de sus dígitos
pares y la suma de sus dígitos impares.    
}

program punto6;
procedure sumas(num:integer;var sumapar:integer; var sumaimpar:integer);
var 
  dig:integer;
begin
  while(num <> 0) do begin 
    dig:=num mod 10;
    if(dig mod 2 = 0)then 
      sumapar:=sumapar+dig
    else begin 
      sumaimpar:=sumaimpar+dig;
    end;
    num:=num div 10;
  end;
end;

var
num:integer;
sumapar:integer;
sumaimpar:integer;
begin
  writeln('ingrese un numero: ');
  readln(num);
  while(num <> 123456) do begin
    sumapar:=0;
    sumaimpar:=0;
    sumas(num,sumapar,sumaimpar);
    writeln('suma de cantidad de digitos pares :',sumapar );
    writeln('suma de cantidad de digitos impares:',sumaimpar);
    writeln('ingrese un numero: ');
    readln(num);
  end;
end.


  

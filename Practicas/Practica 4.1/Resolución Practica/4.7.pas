{7.Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1
(que no debe procesarse) e informe:

a.la cantidad de ocurrencias de cada dígito procesado.
b.el dígito más leído.
c.los dígitos que no tuvieron ocurrencias.

Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8
}

program punto7;
type
vector=array [0..9] of integer;

//PROCESOS
procedure inicializar_vector(var v:vector);
var
i:integer;
begin
  for i := 0 to 9 do begin
    v[i]:=0;
  end;
end;   

 
procedure descomponer(var v:vector;num:integer);  
var
  dig:integer;
begin
  if(num = 0)then begin
    v[num]:=v[num]+1;
  end;
  while(num <> 0)do begin
    dig:= num mod 10;
    v[dig]:= v[dig]+1;
    num:= num div 10;
  end;  
end;          


procedure recorrer(v:vector);
var
i:integer;
max:integer;
begin
  max:= -1;
  for i := 0 to 9 do begin
    if (v[i] <> 0) then 
      writeln('Numero ',i,': ',v[i],' veces');
    if (v[i] > max)then 
      max:= v[i]
  end;
  writeln('El digito mas leido fue el : ', max);      
end;  

procedure no_esta(v:vector);
var
i:integer;
begin
  writeln('Los digitos que no tuvieron ocurrencias son:');
  for i := 0 to 9 do begin
    if (v[i]=0)then begin
      write(',',i);
    end;
  end;
end;        
  
//PROGRAMA PRINCIPAL
var
  v:vector;
  num:integer;
begin
  inicializar_vector(v);
  writeln('ingresa un numero:');
  readln(num);
  while (num <> -1)do begin
    descomponer(v,num);
    writeln('ingresa un numero:');
    readln(num);
  end;
  recorrer(v);
  no_esta(v)
end.

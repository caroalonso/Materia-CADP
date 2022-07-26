{10.Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patrón A%B* donde:

-A es una secuencia de caracteres en la que no exista el carácter ‘$’.
-B es una secuencia con la misma cantidad de caracteres que aparecieron en A y
en la que aparezca a lo sumo 3 veces el carácter ‘@’.
-Los caracteres % y * seguro existen.

Nota: en caso de no cumplir, informar que parte del patrón no se cumplio }

program punto10;
var 
letra:char;
contador1:integer;
contador2:integer;
contador3:integer;
begin 
  contador1:=0;
  writeln('ingrese un caracter: ');
  readln(letra);
  while (letra <> '%') and (letra <> '$') do begin
    contador1:=contador1+1;
    writeln('2 ingrese un caracter: ');
    readln(letra);
  end;
  if(letra ='$') then begin
    writeln('no se cumple la primera secuencia.');
  end 
  else begin
    writeLn('cantidad de letras contadas en primera secuencia :', contador1);
    writeLn;
    contador2:=0;
    contador3:=0;
    writeln('ingrese un caracter: ');
    readln(letra);
    while(letra <> '*') do begin
      contador2:=contador2+1;
      if(letra='@')then begin
        contador3:=contador3+1;
      end;  
      writeln('ingrese un caracter: ');
      readln(letra);
    end;
    writeLn('cantidad de letras contadas en segunda secuencia :', contador2);
    if(contador3 > 3 ) or ( contador2 <> contador1) then
      writeln('no se cumple la segunda secuencia')
    else 
      writeLn('las dos secuencias son correctas');   
    end;
end.
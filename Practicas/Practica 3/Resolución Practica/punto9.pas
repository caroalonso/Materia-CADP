{ 9.Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patrón A$B#  donde:
-	A es una secuencia de sólo letras vocales.
-	B es una secuencia de sólo caracteres alfabéticos sin letras vocales
-	los caracteres $ y # seguro existen

Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.

resumen: vocales + $ + secuencia con ninguna vocal + #

}

Program punto9;

procedure vocales(var ok:boolean; var contador:integer);
var
 letra:char;
begin
  writeln('ingrese un caracter: ');
  readln(letra);
  while(letra <> '$') and (ok) do begin
    if (letra ='a') or (letra = 'e') or (letra ='i') or (letra = 'o') or (letra ='u') then begin
       contador:=contador+1;
    end  
    else begin
      ok:=false;
    end; 
    if(ok)then begin
      writeln('ingrese un caracter: ');
      readln(letra);
    end;  
  end;
end;

procedure no_vocales( var ok:boolean; var contador:integer);
var
  letra:char;
begin
  writeln('ingrese un caracter: ');
  readln(letra);
  while(letra <> '#') and (ok) do begin
    if (letra <> 'a') and (letra <> 'e') and (letra <> 'i') and (letra <> 'o') and (letra <> 'u') then begin
      contador:= contador +1;
    end
    else begin
      ok:=false;
    end;    
    if(ok)then begin
      writeln('ingrese un caracter: ');
      readln(letra);
    end;   
  end;
end;
  
//PROGRAMA PRINCIPAL

var
  contador:integer;
  ok:boolean;
begin
  contador:=0;
  ok:=true;
  vocales(ok,contador);
  if(contador = 0) or (not ok) then begin
    writeln ('el patron de vocales no se cumplio');
  end  
  else begin
    contador:=0;
    ok:=true;
    no_vocales(ok,contador);
    if(contador = 0) or (not ok) then begin
      writeln ('el patron de vocales no se cumplio');
    end 
    else 
      writeLn('el patron se cumplio.'); 
  end  
end.
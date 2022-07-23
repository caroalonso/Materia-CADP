{ 8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si
al menos una de ellos no lo era.}

Program punto8;
var
  letra1:char;
  letra2:char;
  letra3:char;
begin
  writeLn('ingrese una letra: ');
  readln(letra1);
  writeLn('ingrese una letra: ');
  readln(lertra2);
  writeLn('ingrese una letra: ');
  readln(letra3);
  if((letra1= 'a') or (letra1= 'e') or (letra1='i') or (letra1='o') or (letra1= 'u')) and ((letra2= 'a') or (letra2= 'e') or (letra2='i') or (letra2='o') or (letra2= 'u')) and ((letra3= 'a') or (letra3= 'e') or (letra3='i') or (letra3='o') or (letra3= 'u')) then 
    writeln('las tres letras son vocales')
  else begin
    if ((letra1= 'a') or (letra1= 'e') or (letra1='i') or (letra1='o') or (letra1= 'u')) or ((letra2= 'a') or (letra2= 'e') or (letra2='i') or (letra2='o') or (letra2= 'u')) or (( letra3 = 'a') or (letra3='e') or (letra3= 'i') or (letra3='o') or (letra3='u')) then 
      writeln('al menos una letra es vocal');
  end;    
end.

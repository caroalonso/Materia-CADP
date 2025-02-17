{ 8. Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si
al menos una de ellos no lo era.}

program punto8;
var
  letra1, letra2, letra3: char;

function esVocal(letra: char): boolean;
begin
  letra := LowerCase(letra);  { Para no distinguir entre mayúsculas y minúsculas }
  esVocal := (letra = 'a') or (letra = 'e') or (letra = 'i') or (letra = 'o') or (letra = 'u');
end;

begin
  writeln('Ingrese una letra: ');
  readln(letra1);
  writeln('Ingrese una letra: ');
  readln(letra2);
  writeln('Ingrese una letra: ');
  readln(letra3);

  if esVocal(letra1) and esVocal(letra2) and esVocal(letra3) then
    writeln('Las tres letras son vocales')
  else if esVocal(letra1) or esVocal(letra2) or esVocal(letra3) then
    writeln('Al menos una letra es vocal')
  else
    writeln('Ninguna de las letras es vocal');
end.


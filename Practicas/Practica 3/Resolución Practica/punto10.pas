{10.Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patrón A%B* donde:

-A es una secuencia de caracteres en la que no exista el carácter ‘$’.
-B es una secuencia con la misma cantidad de caracteres que aparecieron en A y
en la que aparezca a lo sumo 3 veces el carácter ‘@’.
-Los caracteres % y * seguro existen.

Nota: en caso de no cumplir, informar que parte del patrón no se cumplio }

program punto10;

var 
  letra: char;
  contador1: integer;
  contador2: integer;
  contador3: integer;
begin 
  contador1 := 0;
  contador2 := 0;
  contador3 := 0;

  // Primer ciclo de lectura para la secuencia A
  writeln('Ingrese un caracter: ');
  readln(letra);

  while (letra <> '%') and (letra <> '$') do begin
    if letra = '$' then begin
      writeln('No se cumple la primera secuencia (carácter "$" encontrado).');
      exit;  // Salir del programa si no se cumple la primera secuencia
    end;

    contador1 := contador1 + 1;
    writeln('Ingrese un caracter: ');
    readln(letra);
  end;

  // Verifica que la secuencia A no contenga '$'
  if letra = '$' then begin
    writeln('No se cumple la primera secuencia.');
    exit;
  end;

  writeln('Cantidad de caracteres en la primera secuencia A: ', contador1);
  writeln;

  // Segundo ciclo de lectura para la secuencia B
  contador2 := 0;
  contador3 := 0;

  writeln('Ingrese un caracter: ');
  readln(letra);

  while (letra <> '*') do begin
    if contador2 >= contador1 then begin
      writeln('La segunda secuencia B tiene más caracteres de los permitidos.');
      exit;
    end;

    contador2 := contador2 + 1;

    if letra = '@' then begin
      contador3 := contador3 + 1;
    end;

    writeln('Ingrese un caracter: ');
    readln(letra);
  end;

  writeln('Cantidad de caracteres en la segunda secuencia B: ', contador2);

  // Verificación final del patrón
  if (contador2 <> contador1) then
    writeln('La cantidad de caracteres en B no coincide con A.')
  else if (contador3 > 3) then
    writeln('La secuencia B tiene más de 3 caracteres "@"')
  else
    writeln('Las dos secuencias son correctas.');
end.

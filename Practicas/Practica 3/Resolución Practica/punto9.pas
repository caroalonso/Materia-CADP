{ 9.Realizar un programa que lea una secuencia de caracteres y verifique si cumple con el patrón A$B#  donde:
-A es una secuencia de sólo letras vocales.
-B es una secuencia de sólo caracteres alfabéticos sin letras vocales.
-los caracteres $ y # seguro existen.
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.

resumen: vocales + $ + secuencia sin vocales + #   }

program punto9;

procedure vocales(var ok: boolean; var contador: integer);
var
  letra: char;
begin
  writeln('Ingrese un caracter: ');
  readln(letra);
  while (letra <> '$') and (ok) do begin
    if (letra in ['a', 'e', 'i', 'o', 'u']) then begin
      contador := contador + 1;
    end
    else begin
      ok := false; // Si encuentra un carácter no vocal, marca como no válido
    end;
    if(ok) then begin
      writeln('Ingrese un caracter: ');
      readln(letra);
    end;
  end;
end;

procedure no_vocales(var ok: boolean; var contador: integer);
var
  letra: char;
begin
  writeln('Ingrese un caracter: ');
  readln(letra);
  while (letra <> '#') and (ok) do begin
    if (letra not in ['a', 'e', 'i', 'o', 'u']) then begin
      contador := contador + 1;
    end
    else begin
      ok := false; // Si encuentra una vocal, marca como no válido
    end;
    if(ok) then begin
      writeln('Ingrese un caracter: ');
      readln(letra);
    end;
  end;
end;

var
  contador: integer;
  ok: boolean;
begin
  contador := 0;
  ok := true;
  
  // Procesar la primera secuencia (solo vocales)
  vocales(ok, contador);
  
  if (not ok) then begin
    writeln('El patrón de vocales no se cumplió.');
  end
  else begin
    // Verificar que el siguiente carácter sea el símbolo '$'
    if (contador = 0) then begin
      writeln('No se ingresaron vocales antes de "$".');
    end
    else begin
      // Reiniciar contador para la segunda parte
      contador := 0;
      ok := true;

      // Procesar la segunda secuencia (sin vocales)
      no_vocales(ok, contador);

      if (not ok) then begin
        writeln('El patrón de caracteres sin vocales no se cumplió.');
      end
      else begin
        // Verificar que el siguiente carácter sea el símbolo '#'
        if (contador = 0) then begin
          writeln('No se ingresaron caracteres sin vocales antes de "#".');
        end
        else begin
          writeln('El patrón se cumplió.');
        end;
      end;
    end;
  end;
end.


{ 6.Realizar un programa que lea el número de legajo y el promedio de cada alumno de la
facultad. La lectura fncliza cucndo se ingresa el legcjo -1 , que no debe procescrse.
Al finalizar la lectura, informar:
c. La cantidad de alumnos leídos
b. La cantidad de alumnos cuyo promedio supera 6,5.
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8,5) cuyo
legajo sean menor al valor 2500.
}

program punto6;
var
  legajo: integer;
  contadoralumnos: integer;
  promedio: real;
  contadorpromedio6_5: integer;  { Cambié a entero ya que es un contador de alumnos }
  alumnos_destacados: integer;
  porcentaje_destacados: real;
begin
  contadorpromedio6_5 := 0;
  contadoralumnos := 0;
  alumnos_destacados := 0;
  
  writeLn('Ingresar número de legajo: ');
  readln(legajo);
  
  while (legajo <> -1) do begin
    writeLn('Ingresar promedio: ');
    readln(promedio);
    
    contadoralumnos := contadoralumnos + 1;
    
    if (promedio > 6.5) then begin
      contadorpromedio6_5 := contadorpromedio6_5 + 1;
    end;
    
    if (promedio > 8.5) and (legajo < 2500) then begin
      alumnos_destacados := alumnos_destacados + 1;
    end;
    
    writeLn('Ingresar número de legajo: ');
    readln(legajo);
  end;
  
  if contadoralumnos > 0 then begin
    porcentaje_destacados := (alumnos_destacados * 100) / contadoralumnos;
    writeln('La cantidad de alumnos leídos es: ', contadoralumnos);
    writeln('Cantidad de alumnos cuyo promedio supera el 6.5: ', contadorpromedio6_5);
    writeln('Porcentaje de alumnos destacados con legajo menor a 2500: ', porcentaje_destacados:0:2, '%');
  end
  else
    writeln('No se ingresaron datos válidos.');
end.

  
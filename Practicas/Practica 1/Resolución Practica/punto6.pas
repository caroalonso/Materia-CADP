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
  legajo:integer;
  contadoralumnos:integer;
  promedio:real;
  contadorpromedio6_5: real
  alumnos_destacados:integer;
  aux:integer;
begin
  contadorpromedio6_5:=0;
  contadoralumnos:=0;
  alumnos_destacados:=0;
  writeLn('ingresar numero de legajo: ');
  readln(legajo);
  writeLn('ingresar promedio: ');
  readl(promedio);
  while (legajo <>(-1))do begin
    contador:=contador+1;
    if(promedio>6,5)then begin
      contadorpromedio6_5:=contadorpromedio6_5+1;
    end;
    if(promedio>8,5) and (legajo<2500)then begin
      alumnos_destacados:=alumnos_destacados+1;
    end;
    writeLn('ingresar numero de legajo: ');
    readln(legajo);
    writeLn('ingresar promedio: ');
    readln(promedio);
  end;
  aux:=(alumnos_destacados*100/contador);  { regla de 3 simples }                                 
  writeln('la cantidad de alumnos es de : ',contador);
  writeln('cantidad de alumnos cuyo promedio supera el 6,5 es de :' , contadorpromedio6_5);
  writeln('la cantidad de alumnos destacados es de :' , aux);
end.
  
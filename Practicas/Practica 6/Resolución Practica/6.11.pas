{11. La Facultad de Informática debe seleccionar los 10 (DIEZ)egresados con mejor promedio a los que la UNLP.
De cada egresado se conoce:
su número de alumno, 
apellido 
y el promedio obtenido durante toda su carrera.

Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse. 

b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados 
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor a menor).

LO QUE HAGO EN ESTE PROGRAMA ES INGRESAR ALUMNOS A UNA LISTA ORDENADA POR CALIFICACION EN ORDEN DE MAYOR A MENOR Y 
LUEGO IMPLEMENTO UN FOR DE IMPRESION EN LA LISTA DEJANDO LOS DATOS DE LOS 10 PRIMEROS CON MEJORES CALIFICACIONES }

program listas;
type
  alumnos = record
    num_alumno: integer;
    apellido: string[30];
    promedio: real;
  end;

  lista = ^nodo;

  nodo = record
    elem: alumnos;
    sig: lista;
  end;

// PROCESOS

// Procedimiento para leer un alumno
procedure leer_alumno(var a: alumnos);
begin
  writeln('ingresar numero de alumno:');
  readln(a.num_alumno);
  if (a.num_alumno <> 0) then begin
    writeln('ingresar apellido de alumno:');
    readln(a.apellido);
    writeln('ingresar promedio de alumno:');
    read(a.promedio);
  end;
end;

// Procedimiento para agregar un alumno en la lista ordenada por promedio (de mayor a menor)
procedure agregar_ordenado(var l: lista; alu: alumnos);
var
  nue, act, ant: lista;
begin
  new(nue);
  nue^.elem := alu;
  nue^.sig := nil;

  if (l = nil) then begin  // Si la lista está vacía, el nuevo alumno es el primero
    l := nue;
  end
  else begin
    ant := l;
    act := l;
    // Recorrer la lista hasta encontrar la posición correcta (ordenado de mayor a menor)
    while (act <> nil) and (act^.elem.promedio > alu.promedio) do begin
      ant := act;
      act := act^.sig;
    end;
    // Insertar al principio si no se movió, o en el medio o final si es necesario
    if (act = l) then begin
      nue^.sig := l;
      l := nue;
    end
    else begin
      ant^.sig := nue;
      nue^.sig := act;
    end;
  end;
end;

// Procedimiento para ingresar los alumnos
procedure ingresar_alumnos(var l: lista);
var
  a: alumnos;
begin
  leer_alumno(a);
  while (a.num_alumno <> 0) do begin
    agregar_ordenado(l, a);  // Agregar el alumno ordenado por promedio
    leer_alumno(a);
  end;
end;

// Procedimiento para imprimir los primeros 10 alumnos
procedure imprimir_alumnos(l: lista);
var
  i: integer;
begin
  i := 1;
  while (l <> nil) and (i <= 10) do begin
    writeln('Numero de alumno: ', l^.elem.num_alumno);
    writeln('Apellido: ', l^.elem.apellido);
    writeln('Promedio: ', l^.elem.promedio:0:2);
    l := l^.sig;
    i := i + 1;
  end;
end;

// PROGRAMA PRINCIPAL
var
  l: lista;
begin
  l := nil;
  ingresar_alumnos(l);  // Ingresar los alumnos
  writeln('Los 10 primeros egresados con mejor promedio son:');
  imprimir_alumnos(l);  // Imprimir los 10 mejores
end.

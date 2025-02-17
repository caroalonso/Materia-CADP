{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000).
De cada alumno se conoce:
nro de alumno
apellido y nombre 
cantidad de asistencias a clase.
Dicha información se encuentra ordenada por nro de alumno de manera ascendente(menor a mayor). Se pide:

a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.

Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con datos leídos de teclado.}


program vectores;
const
  dimf = 1000;

type
  str = string[20];
  rango = 1..1000;

  alumnos = record
    nro: integer;
    apellidoynombre: str;
    cant_clases: integer;
  end;

  vector = array[rango] of alumnos;


// Modulo A: Retorna la posición del alumno con el nro de alumno recibido por parámetro.
function modulo_A(v: vector; diml: integer; numero: integer): integer; // MODULO A
var
  pos: integer;
begin
  pos := 1;
  while (pos <= diml) and (v[pos].nro <> numero) do
    pos := pos + 1;

  if (v[pos].nro = numero) then
    modulo_A := pos
  else
    modulo_A := -1; // Si no se encuentra, retornamos -1 como señal de error.
end;

// Modulo B: Inserta un alumno en la posición correcta dentro del vector (manteniendo el orden).
procedure hacer_espacio_agregar(var v: vector; var diml: integer; pos: integer);
var
  i: integer;
begin
  for i := diml downto pos + 1 do
    v[i] := v[i - 1];
  v[pos] := v[diml]; // Asignar el último valor
  diml := diml + 1;
end;

procedure modulo_B(var v: vector; var diml: integer; alu: alumnos); // MODULO B
var
  pos: integer;
begin
  if (diml < dimf) then
  begin
    pos := 1;
    // Buscamos la posición donde se debe insertar el nuevo alumno
    while (pos <= diml) and (v[pos].nro < alu.nro) do
      pos := pos + 1;

    // Si hemos llegado al final, insertamos al alumno
    if (pos > diml) then
    begin
      v[diml + 1] := alu;
      diml := diml + 1;
    end
    else
    begin
      hacer_espacio_agregar(v, diml, pos);
      v[pos] := alu;  // Asignamos el alumno en la posición correcta
    end;
    writeln('Se pudo agregar el nuevo alumno');
  end
  else
    writeln('No hay lugar para insertar el nuevo alumno');
end;

// Modulo C: Elimina el alumno en una posición dada
procedure modulo_C(var v: vector; var diml: integer; posicion: integer);
var
  i: integer;
begin
  for i := posicion to diml - 1 do
    v[i] := v[i + 1];
  diml := diml - 1;
end;

// Modulo D: Elimina el alumno con el nro recibido
procedure modulo_D(var v: vector; var diml: integer; numero: integer);
var
  pos: integer;
begin
  pos := modulo_A(v, diml, numero);
  if (pos <> -1) then
    modulo_C(v, diml, pos)
  else
    writeln('Alumno no encontrado');
end;

// Modulo E: Elimina todos los alumnos con cantidad de asistencias igual a 0
procedure modulo_E(var v: vector; var diml: integer);
var
  i, j: integer;
begin
  j := 1;
  while j <= diml do
  begin
    if v[j].cant_clases = 0 then
    begin
      modulo_C(v, diml, j);
    end
    else
      j := j + 1;
  end;
end;

// Procedimiento para leer un alumno
procedure leer_alumno(var a: alumnos);
begin
  readln(a.nro);
  readln(a.apellidoynombre);
  readln(a.cant_clases);
end;

// Procedimiento para cargar alumnos (a completar según cómo se carguen los datos)
procedure carga_alumnos(var v: vector; var diml: integer);
begin
  // Aquí se podría cargar los alumnos de alguna fuente externa o de teclado.
  // Este procedimiento es solo un ejemplo.
  diml := 0;
  // Ejemplo de carga manual:
  leer_alumno(v[diml + 1]);
  diml := diml + 1;
end;

// Programa principal
var
  v: vector;
  diml: integer;
  numero: integer;
  posicion: rango;
  alu: alumnos;
begin
  diml := 0;
  carga_alumnos(v, diml); // Carga de alumnos
  // 1. Buscar alumno por número
  readln(numero);
  posicion := modulo_A(v, diml, numero);
  writeln('El alumno está en la posición: ', posicion);
  // 2. Insertar un nuevo alumno
  leer_alumno(alu);
  modulo_B(v, diml, alu);
  // 3. Eliminar un alumno por posición
  readln(posicion);
  modulo_C(v, diml, posicion);
  // 4. Eliminar un alumno por número
  readln(numero);
  modulo_D(v, diml, numero);
  // 5. Eliminar todos los alumnos con asistencias 0
  modulo_E(v, diml);
end.


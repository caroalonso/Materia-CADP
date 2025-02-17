{Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
utilizaremos vectores para almacenar la información ingresada por teclado. Consideraciones
importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector
apropiada. Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer,
para poder utilizar un vector asumimos que en todos los casos se ingresarán a lo sumo 5000
datos (donde cada dato será o bien una inversión, un alumno o un tanque de agua, según lo
indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver
cada inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica
anterior. En la medida de lo posible, el lector deberá recorrerse una única vez para resolver
todos los incisos.
}

program Ejercicios;

type
  str = string[50];

  // Ejercicio 1: Inversiones
  inversion = record
    monto: real;
    fecha: string[10];
    tipo: str;
  end;

  vector_inversiones = array[1..5000] of inversion;

  // Ejercicio 2: Alumnos
  alumno = record
    nombre: str;
    nota: real;
    edad: integer;
  end;

  vector_alumnos = array[1..5000] of alumno;

  // Ejercicio 3: Tanques de Agua
  tanque = record
    codigo: integer;
    capacidad: integer;
    nivel: integer;
  end;

  vector_tanques = array[1..5000] of tanque;

var
  inversiones: vector_inversiones;
  alumnos: vector_alumnos;
  tanques: vector_tanques;
  diml_inversiones, diml_alumnos, diml_tanques: integer;

{ Ejercicio 1: Inversiones }

procedure leer_inversion(var inv: inversion);
begin
  writeln('Ingrese monto de la inversion:');
  readln(inv.monto);
  if inv.monto = 0 then
    exit;
  writeln('Ingrese fecha de la inversion (DD/MM/YYYY):');
  readln(inv.fecha);
  writeln('Ingrese tipo de inversion (ej. plazo fijo, acciones):');
  readln(inv.tipo);
end;

procedure cargar_inversiones(var v: vector_inversiones; var diml: integer);
var
  inv: inversion;
begin
  diml := 0;
  while true do
  begin
    leer_inversion(inv);
    if inv.monto = 0 then
      break;
    diml := diml + 1;
    v[diml] := inv;
  end;
end;

procedure procesar_inversiones(var v: vector_inversiones; diml: integer);
var
  i: integer;
  total_invertido, mayor_monto: real;
  promedio: real;
begin
  total_invertido := 0;
  mayor_monto := -1;
  
  for i := 1 to diml do
  begin
    total_invertido := total_invertido + v[i].monto;
    if v[i].monto > mayor_monto then
      mayor_monto := v[i].monto;
  end;
  
  promedio := total_invertido / diml;
  
  writeln('Total invertido: ', total_invertido:0:2);
  writeln('Promedio de las inversiones: ', promedio:0:2);
  writeln('Mayor monto invertido: ', mayor_monto:0:2);
end;

{ Ejercicio 2: Alumnos }

procedure leer_alumno(var a: alumno);
begin
  writeln('Ingrese nombre del alumno:');
  readln(a.nombre);
  if a.nombre = '' then
    exit;
  writeln('Ingrese nota del alumno:');
  readln(a.nota);
  writeln('Ingrese edad del alumno:');
  readln(a.edad);
end;

procedure cargar_alumnos(var v: vector_alumnos; var diml: integer);
var
  a: alumno;
begin
  diml := 0;
  while true do
  begin
    leer_alumno(a);
    if a.nombre = '' then
      break;
    diml := diml + 1;
    v[diml] := a;
  end;
end;

procedure procesar_alumnos(var v: vector_alumnos; diml: integer);
var
  i: integer;
  total_notas, mayor_nota: real;
  cantidad_aprobados: integer;
begin
  total_notas := 0;
  mayor_nota := -1;
  cantidad_aprobados := 0;
  
  for i := 1 to diml do
  begin
    total_notas := total_notas + v[i].nota;
    if v[i].nota >= 6 then
      cantidad_aprobados := cantidad_aprobados + 1;
    if v[i].nota > mayor_nota then
      mayor_nota := v[i].nota;
  end;
  
  writeln('Cantidad de alumnos aprobados: ', cantidad_aprobados);
  writeln('Promedio de notas: ', (total_notas / diml):0:2);
  writeln('Alumno con mayor nota: ', mayor_nota:0:2);
end;

{ Ejercicio 3: Tanques de Agua }

procedure leer_tanque(var t: tanque);
begin
  writeln('Ingrese codigo del tanque:');
  readln(t.codigo);
  if t.codigo = -1 then
    exit;
  writeln('Ingrese capacidad del tanque (litros):');
  readln(t.capacidad);
  writeln('Ingrese nivel de agua en el tanque (litros):');
  readln(t.nivel);
end;

procedure cargar_tanques(var v: vector_tanques; var diml: integer);
var
  t: tanque;
begin
  diml := 0;
  while true do
  begin
    leer_tanque(t);
    if t.codigo = -1 then
      break;
    diml := diml + 1;
    v[diml] := t;
  end;
end;

procedure procesar_tanques(var v: vector_tanques; diml: integer);
var
  i: integer;
  cantidad_mayores_80, total_capacidad, mayor_nivel: integer;
begin
  cantidad_mayores_80 := 0;
  total_capacidad := 0;
  mayor_nivel := -1;
  
  for i := 1 to diml do
  begin
    total_capacidad := total_capacidad + v[i].capacidad;
    if v[i].nivel > (v[i].capacidad * 80) div 100 then
      cantidad_mayores_80 := cantidad_mayores_80 + 1;
    if v[i].nivel > mayor_nivel then
      mayor_nivel := v[i].nivel;
  end;
  
  writeln('Cantidad de tanques con nivel mayor al 80%: ', cantidad_mayores_80);
  writeln('Promedio de capacidad de los tanques: ', (total_capacidad / diml):0:2);
  writeln('Tanque con mayor nivel de agua: ', mayor_nivel);
end;

begin
  { Ejercicio 1: Inversiones }
  diml_inversiones := 0;
  cargar_inversiones(inversiones, diml_inversiones);
  procesar_inversiones(inversiones, diml_inversiones);

  { Ejercicio 2: Alumnos }
  diml_alumnos := 0;
  cargar_alumnos(alumnos, diml_alumnos);
  procesar_alumnos(alumnos, diml_alumnos);

  { Ejercicio 3: Tanques de Agua }
  diml_tanques := 0;
  cargar_tanques(tanques, diml_tanques);
  procesar_tanques(tanques, diml_tanques);
end.

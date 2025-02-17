{7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario.
Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, 
apellido, 
nombres, 
dirección de correo electrónico, 
año de ingreso, 
año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).

1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. 
Las 24 notas correspondientes a cada alumno deben quedar ordenadas de forma descendente.

2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:

a. El promedio de notas obtenido por cada alumno.

b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto únicamente por dígitos impares.

c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido se recibieron (o sea, que tardaron menos años).

3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir.}

program listas_repaso;
const
  dimf = 24;  // Número de materias
type
  rango = 1..dimf;
  str = string[30];
  
  vector = array[rango] of integer;  // Array para almacenar las notas
  
  alumno = record
    num_alu: integer;
    apellido: str;
    nombre: str;
    mail: str;
    anio_ingreso: integer;
    anio_egreso: integer;
    notas: vector;  // Notas del alumno
  end;
  
  lista = ^nodo;
  
  nodo = record
    elem: alumno;
    sig: lista;
  end;

{ Procedimiento para cargar las notas de un alumno y ordenarlas de forma descendente }
procedure cargar_vect(var ve: vector);
var
  i, j, temp: integer;
begin
  for i := 1 to dimf do
    readln(ve[i]);
  
  { Ordenar el vector de notas de forma descendente }
  for i := 1 to dimf-1 do
    for j := i+1 to dimf do
      if ve[i] < ve[j] then begin
        temp := ve[i];
        ve[i] := ve[j];
        ve[j] := temp;
      end;
end;

{ Procedimiento para leer los datos de un alumno }
procedure leer_alumno(var a: alumno);
begin
  writeln('Ingrese el número de alumno (ingrese -1 para terminar):');
  readln(a.num_alu);
  if (a.num_alu <> -1) then begin
    writeln('Ingrese el apellido del alumno:');
    readln(a.apellido);
    writeln('Ingrese el nombre del alumno:');
    readln(a.nombre);
    writeln('Ingrese el email del alumno:');
    readln(a.mail);
    writeln('Ingrese anio de ingreso del alumno:');
    readln(a.anio_ingreso);
    writeln('Ingrese anio de egreso del alumno:');
    readln(a.anio_egreso);
    cargar_vect(a.notas); //manda el vector de notas del alumno
  end;
end;

{ Procedimiento para crear un nodo con la información de un alumno y agregarlo a la lista }
procedure crear_lista(var l: lista; alu: alumno);
var
  nue: lista;
begin
  new(nue);
  nue^.elem := alu;
  nue^.sig := l;
  l := nue;
end;

{ Procedimiento para cargar todos los alumnos hasta que se ingrese el número -1 }
procedure cargar_alumnos(var l: lista);
var
  a: alumno;
begin
  leer_alumno(a);
  while (a.num_alu <> -1) do begin
    crear_lista(l, a);
    leer_alumno(a);
  end;
end;

{ Función para calcular el promedio de las notas de un alumno }
function sacar_promedio(ve: vector): real;
var
  i, suma: integer;
begin
  suma := 0;
  for i := 1 to dimf do
    suma := suma + ve[i];
  sacar_promedio := suma / dimf;
end;

{ Función para verificar si el número de alumno está compuesto solo por dígitos impares }
function impares(num: integer): boolean;
var
  cumple: boolean;
  dig: integer;
begin
  cumple := true;
  while (cumple = true) and (num <> 0) do begin
    dig := num mod 10;
    if (dig mod 2) = 0 then
      cumple := false;
    num := num div 10;
  end;
  impares := cumple;
end;

{ Procedimiento para contar cuántos alumnos ingresaron en 2012 y tienen solo dígitos impares en su número de alumno }
function condiciones(al: alumno): integer;
begin
  if (al.anio_ingreso = 2012) and (impares(al.num_alu)) then
    condiciones := 1
  else
    condiciones := 0;
end;

{ Procedimiento para encontrar los dos alumnos que más rápido se recibieron (menor tiempo entre egreso e ingreso) }
procedure minimo(l: lista; var min1, min2: integer; var nom, ape, e_mail, nom2, ape2, e_mail2: str);
begin
  if (l^.elem.anio_egreso - l^.elem.anio_ingreso) < min1 then begin
    min2 := min1;
    min1 := l^.elem.anio_egreso - l^.elem.anio_ingreso;
    nom2 := nom;
    ape2 := ape;
    e_mail2 := e_mail;
    nom := l^.elem.nombre;
    ape := l^.elem.apellido;
    e_mail := l^.elem.mail;
  end
  else if (l^.elem.anio_egreso - l^.elem.anio_ingreso) < min2 then begin
    min2 := l^.elem.anio_egreso - l^.elem.anio_ingreso;
    nom2 := l^.elem.nombre;
    ape2 := l^.elem.apellido;
    e_mail2 := l^.elem.mail;
  end;
end;

{ Procedimiento para procesar la información y calcular los resultados }
procedure procesar_info(l: lista);
var
  cant_alu: integer;
  nom, ape, e_mail, nom2, ape2, e_mail2: str;
  min1, min2: integer;
begin
  min1 := 99999;  // Valor inicial alto para comparar
  min2 := 99999;  
  cant_alu := 0;
  
  while (l <> nil) do begin
    writeln('El promedio del alumno ', l^.elem.nombre, ' fue de: ', sacar_promedio(l^.elem.notas):0:2); // Punto A
    cant_alu := cant_alu + condiciones(l^.elem);
    minimo(l, min1, min2, nom, ape, e_mail, nom2, ape2, e_mail2); // Punto C
    l := l^.sig;
  end;
  
  writeln('Cantidad de alumnos ingresantes 2012 con número de alumno compuesto por dígitos impares: ', cant_alu); // Punto B
  writeln('Los alumnos que más rápido se recibieron fueron: ', nom, ape, e_mail, ' y ', nom2, ape2, e_mail2); // Punto C
end;

{ Procedimiento para eliminar un alumno de la lista por su número de alumno }
procedure eliminar(var l: lista; a: integer);
var
  ant, act: lista;
  cumple: boolean;
begin
  cumple := false;
  act := l;
  ant := l;
  
  while (act <> nil) and (act^.elem.num_alu <> a) do begin
    ant := act;
    act := act^.sig;
  end;
  
  if (act <> nil) then begin
    if (l = act) then begin
      l := l^.sig;
    end
    else begin
      ant^.sig := act^.sig;
    end;
    dispose(act);
    cumple := true;
  end;
  
  if (cumple) then
    writeln('El alumno se pudo borrar con éxito.')
  else
    writeln('El alumno no se pudo borrar.');
end;

{ Programa principal }
var
  l: lista;
  num_a: integer;
begin
  l := nil;
  cargar_alumnos(l);
  procesar_info(l);
  readln(num_a);
  eliminar(l, num_a);
end.


   

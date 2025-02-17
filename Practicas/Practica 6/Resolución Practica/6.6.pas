{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas al espacio 
en la última década. 
De cada sonda se conoce:
*su nombre
*duración estimada de la misión (cantidad de meses que permanecerá activa)
*el costo de construcción
*el costo de mantenimiento mensual
y el
*rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1.radio; 
2.microondas; 
3.infrarrojo;
4.luz visible;
5.ultravioleta;
6.rayos X;
7.rayos gamma;

Realizar un programa que LEA y ALMACENE la información de todas las sondas espaciales. 
La lectura finaliza al ingresar la sonda llamada “GAIA”, que DEBE procesarse.
Una vez finalizada la lectura, informar:

a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.

Nota: para resolver los incisos a), b), c) y d), la lista debe RECORRER UNA UNICA VEZ.}

program listas;

const
  dimf = 7;

type
  str = string[30];
  rango = 1..dimf;

  vector = array[rango] of integer;

  sondas = record
    nombre: str;
    duracion: integer;
    costo_construccion: real;
    costo_mantenimiento: real;
    rango: rango;
  end;

  lista = ^nodo;

  nodo = record
    elem: sondas;
    sig: lista;
  end;

// PROCESOS

procedure inicializar_vector(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimf do
  begin
    v[i] := 0;
  end;
end;

procedure leer_sonda(var s: sondas);
begin
  readln(s.nombre);
  if s.nombre <> 'GAIA' then
  begin
    readln(s.duracion);
    readln(s.costo_construccion);
    readln(s.costo_mantenimiento);
    readln(s.rango);
  end;
end;

procedure agregar_adelante(var l: lista; s: sondas);
var
  nue: lista;
begin
  new(nue);
  nue^.elem := s;
  nue^.sig := l;
  l := nue;
end;

procedure cargar_lista(var l: lista; var v: vector; var cant_sondas: integer; var total_duracion: integer; var total_construccion: real);
var
  s: sondas;
begin
  repeat
    leer_sonda(s);
    if s.nombre <> 'GAIA' then
    begin
      v[s.rango] := v[s.rango] + 1;
      agregar_adelante(l, s);
      cant_sondas := cant_sondas + 1;
      total_duracion := total_duracion + s.duracion;
      total_construccion := total_construccion + s.costo_construccion;
    end;
  until s.nombre = 'GAIA';
end;

procedure imprimir_b(v: vector);
var
  i: integer;
begin
  for i := 1 to dimf do
  begin
    writeln(v[i]);
  end;
end;

procedure maximo(l: lista; var max: real; var nom: str);
begin
  if (l^.elem.costo_construccion + l^.elem.costo_mantenimiento) > max then
  begin
    max := l^.elem.costo_construccion + l^.elem.costo_mantenimiento;
    nom := l^.elem.nombre;
  end;
end;

function punto_b(duracion: integer; promedio: real): integer;
begin
  if (duracion > promedio) then
    punto_b := 1
  else
    punto_b := 0;
end;

procedure recorrer_lista(l: lista; v: vector; cant_sondas: integer; total_duracion: integer; total_construccion: real);
var
  nombre: str;
  max: real;
  promedio_duracion: real;
  promedio_construccion: real;
  contador: integer;
begin
  contador := 0;
  max := -1;
  promedio_duracion := total_duracion / cant_sondas;
  promedio_construccion := total_construccion / cant_sondas;
  
  while (l <> nil) do
  begin
    contador := contador + punto_b(l^.elem.duracion, promedio_duracion);
    if (l^.elem.costo_construccion > promedio_construccion) then
    begin
      writeln(l^.elem.nombre);
    end;
    maximo(l, max, nombre);
    l := l^.sig;
  end;

  writeln('La sonda más costosa es: ', nombre);
  writeln('Cantidad de sondas cuya duración es mayor al promedio: ', contador);
  imprimir_b(v);
end;

// PROGRAMA PRINCIPAL
var
  v: vector;
  l: lista;
  cant_sondas: integer;
  total_construccion: real;
  total_duracion: integer;
begin
  l := nil;
  cant_sondas := 0;
  total_duracion := 0;
  total_construccion := 0;
  inicializar_vector(v);
  cargar_lista(l, v, cant_sondas, total_duracion, total_construccion);
  recorrer_lista(l, v, cant_sondas, total_duracion, total_construccion);
end.












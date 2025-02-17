{Un cine posee la lista de películas que proyectará durante el mes de Febrero. 
De cada película se tiene: 
código de película, 
título de la película, 
código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) 
y puntaje promedio otorgado por las críticas. 

Dicha estructura no posee orden alguno.
Se pide:

a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas.
Para ello se debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: 
DNI del crítico, 
apellido 
y nombre del crítico, 
código de película y 
el puntaje otorgado.
 
La lectura finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.

b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).}


program listas_repaso;
const
  dimf = 8;
type
  rango = 1..dimf;
  str = string[40];

  vector = array [rango] of real;

  peliculas = record
    cod_peli: integer;
    titulo: str;
    cod_genero: rango;
    puntaje_prom: real;
  end;

  lista = ^nodo;

  nodo = record
    elem: peliculas;
    sig: lista;
  end;

  criticos = record
    dni: integer;
    nombre: str;
    apellido: str;
    codigo_peli: integer;
    puntaje: real;
  end;

//procesos//

procedure cargar_lista_pelis(var l: lista); // ya se dispone
begin
end;

procedure inicializar_vector(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimf do
  begin
    v[i] := 0;
  end;
end;

procedure leerCritico(var a: criticos);
begin
  readln(a.codigo_peli);
  if (a.codigo_peli <> -1) then
  begin
    readln(a.nombre);
    readln(a.dni);
    readln(a.apellido);
    readln(a.puntaje);
  end;
end;

function cumple(dni: integer): boolean;
var
  digito: integer;
  par: integer;
  impar: integer;
  ok: boolean;
begin
  ok := false;
  par := 0;
  impar := 0;
  while (dni <> 0) do
  begin
    digito := dni mod 10;
    if (digito mod 2 = 0) then
      par := par + 1
    else
      impar := impar + 1;
    dni := dni div 10;
  end;
  if (par = impar) then
    ok := true;
  cumple := ok;
end;

procedure ActualizarOrdenado(var l: lista; promedio: real; aux: integer);
var
  act: lista;
begin
  act := l;
  while (act <> nil) and (act^.elem.cod_peli <> aux) do
    act := act^.sig;
  if act <> nil then
    act^.elem.puntaje_prom := promedio;
end;

procedure maximo(ve: vector);
var
  i: integer;
  max: real;
  categoria: integer;
begin
  max := -1;
  for i := 1 to dimf do
  begin
    if (ve[i] > max) then
    begin
      max := ve[i];
      categoria := i;
    end;
  end;
  writeln(categoria);
end;

procedure ActualizarVector(l: lista; var ve: vector);
var
  i: integer;
  acumulador: real;
  cant: integer;
begin
  for i := 1 to dimf do
  begin
    cant := 0;
    acumulador := 0;
    while (l <> nil) do
    begin
      if (l^.elem.cod_peli = i) then
      begin
        acumulador := acumulador + l^.elem.puntaje_prom;
        cant := cant + 1;
      end;
      l := l^.sig;
    end;
    if cant > 0 then
      ve[i] := acumulador / cant;
  end;
  maximo(ve);
end;

procedure modificarListaYvector(var l: lista; var ve: vector);
var
  a: criticos;
  aux: integer;
  cantCriticos: integer;
  sumadorPuntajes, promedio: real;
begin
  leerCritico(a);
  while (a.codigo_peli <> -1) do
  begin
    aux := a.codigo_peli;
    cantCriticos := 0;
    sumadorPuntajes := 0;
    while (a.codigo_peli <> -1) and (aux = a.codigo_peli) do
    begin
      cantCriticos := cantCriticos + 1;
      sumadorPuntajes := sumadorPuntajes + a.puntaje;
      if cumple(a.dni) then
        writeln(a.nombre, a.apellido);
      leerCritico(a);
    end;
    if cantCriticos > 0 then
    begin
      promedio := sumadorPuntajes / cantCriticos;
      ActualizarOrdenado(l, promedio, aux);
    end;
  end;
  ActualizarVector(l, ve);
end;

procedure eliminar(var l: lista; num: integer);
var
  cumple: boolean;
  ant: lista;
  act: lista;
begin
  cumple := false;
  act := l;
  ant := l;
  while (act <> nil) and (act^.elem.cod_peli <> num) do
  begin
    ant := act;
    act := act^.sig;
  end;
  if (act <> nil) then
  begin
    if (l = act) then
      l := l^.sig
    else
      ant^.sig := act^.sig;
    dispose(act);
    cumple := true;
  end;

  if (cumple) then
    writeln('Se eliminó con éxito')
  else
    writeln('No se encontró el elemento');
end;

//programa principal
var
  li: lista;
  ve: vector;
  cod: integer;
begin
  li := nil;
  cargar_lista_pelis(li); // ya se dispone
  inicializar_vector(ve);
  modificarListaYvector(li, ve);
  readln(cod);
  eliminar(li, cod);
end.













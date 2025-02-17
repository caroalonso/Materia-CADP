{1.Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. 
De cada persona se lee:
DNI,
apellido y nombre
edad 
y el código de género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). 

La lectura finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.

Una vez finalizada la lectura de todas las personas, se pide:

a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal. }

program listas_repaso;
const
  dimf = 5;
type
  rango = 1..dimf;
  str = string[30];

  vector = array[rango] of integer;

  actores = record
    dni: integer;
    apellido_nombre: str;  
    edad: integer;
    cod: rango;
  end;

  lista = ^nodo;

  nodo = record
    elem: actores;
    sig: lista;
  end;


// PROCEDIMIENTOS Y FUNCIONES
procedure inicializar_vector(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimf do 
    v[i] := 0;
end;

// Agregar un nodo al inicio de la lista
procedure agregar_lista(var l: lista; a: actores);
var
  nue: lista;
begin
  new(nue);
  nue^.elem := a;
  nue^.sig := l;
  l := nue;
end; 

// Leer datos de un actor
procedure leer_actores(var a: actores);
begin
  readln(a.dni);
  readln(a.apellido_nombre);
  readln(a.edad);
  readln(a.cod);
end;

// Leer lista de actores
procedure leer(var l: lista; var vec: vector);
var
  act: actores;
begin
  repeat
    leer_actores(act);
    vec[act.cod] := vec[act.cod] + 1;
    agregar_lista(l, act);
  until (act.dni = 33555444); // Faltaba punto y coma aquí
end;

// Función que devuelve 1 si hay más dígitos pares que impares en un DNI, 0 en caso contrario
function par_impar(dni: integer): integer;
var
  dig, par, impar: integer;
begin
  par := 0;
  impar := 0;
  
  while (dni <> 0) do begin
    dig := dni mod 10;
    if (dig mod 2 = 0) then
      par := par + 1
    else
      impar := impar + 1;
    dni := dni div 10;
  end;
  
  if (par > impar) then
    par_impar := 1
  else
    par_impar := 0;
end;

// Procedimiento para informar los dos géneros más elegidos
procedure informar_maximos(ve: vector);
var
  max1, max2, i, gen1, gen2: integer;
begin
  max1 := -1;
  max2 := -1;
  gen1 := 0;
  gen2 := 0;

  for i := 1 to dimf do begin
    if (ve[i] > max1) then begin
      max2 := max1;
      max1 := ve[i];
      gen2 := gen1;
      gen1 := i;
    end
    else if (ve[i] > max2) then begin    
      max2 := ve[i];
      gen2 := i;
    end;
  end;

  writeln('Los dos géneros más elegidos son: ', gen1, ' y ', gen2);
end;

// Recorrer la lista y contar los DNI con más pares que impares
procedure recorrer(l: lista; ve: vector);
var
  contador_mas_pares: integer;
begin
  contador_mas_pares := 0;
  while (l <> nil) do begin
    contador_mas_pares := contador_mas_pares + par_impar(l^.elem.dni);
    l := l^.sig;
  end;
  
  writeln('Cantidad de personas con más dígitos pares que impares en el DNI: ', contador_mas_pares);
  informar_maximos(ve);
end;

// Eliminar un nodo de la lista dado un DNI
procedure eliminar(var l: lista; num: integer);
var
  act, ant: lista;
begin
  act := l;
  ant := nil;

  while (act <> nil) and (act^.elem.dni <> num) do begin
    ant := act;
    act := act^.sig;
  end;

  if (act <> nil) then begin
    if (ant = nil) then  // Si es el primer nodo
      l := act^.sig
    else
      ant^.sig := act^.sig;

    dispose(act);
    writeln('El elemento con DNI ', num, ' se eliminó con éxito.');
  end
  else
    writeln('No se encontró el elemento con DNI ', num, ' a eliminar.');
end;

// PROGRAMA PRINCIPAL
var
  l: lista;
  ve: vector;
  num_dni: integer;
begin
  l := nil;
  inicializar_vector(ve);
  leer(l, ve);    
  recorrer(l, ve);
  readln(num_dni);
  eliminar(l, num_dni);
end.


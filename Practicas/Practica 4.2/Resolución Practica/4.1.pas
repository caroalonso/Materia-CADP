{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor n y 
retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera ascendente.}

program vectores;

const
  dimf = 500;

type
  rango = 1..dimf;
  vector = array[rango] of integer; 

// MODULO A: Búsqueda secuencial en vector desordenado
function buscar(v: vector; n, diml: integer): boolean;
var
  pos: integer;
  cumple: boolean;
begin
  pos := 1;
  cumple := false;
  while (pos <= diml) and (not cumple) do
  begin
    if (v[pos] = n) then
      cumple := true
    else
      pos := pos + 1;
  end;
  buscar := cumple;
end;

// MODULO B: Búsqueda binaria en vector ordenado
function buscar_ordenado(v: vector; n, diml: integer): boolean;
var
  pri, medio, ult: integer;
  cumple: boolean;
begin
  pri := 1;
  ult := diml; 
  cumple := false;
  
  while (pri <= ult) and (not cumple) do begin
    medio := (pri + ult) div 2;  // Calcular el índice medio
    if (v[medio] = n) then
      cumple := true
    else if (n < v[medio]) then
      ult := medio - 1 // Buscar en la mitad izquierda
    else
      pri := medio + 1; // Buscar en la mitad derecha
  end;

  buscar_ordenado := cumple;
end;

begin
  // Aquí podrías agregar una sección de prueba para ver cómo funcionan los módulos
end.


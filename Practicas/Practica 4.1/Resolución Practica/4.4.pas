{4.Se dispone de un vector con 40 números enteros.
Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.

b) intercambio: recibe dos valores x e y (entre 1 y 40) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.

c) sumaVector: retorna la suma de todos los elementos del vector.

d) promedio: devuelve el valor promedio de los elementos del vector.

e) elementoMaximo: retorna la posición del mayor elemento del vector

f) elementoMinimo: retorna la posicion del menor elemento del vector
}

program punto4;
const
  dimf = 40;

type
  vector = array[1..dimf] of integer;  

//PROCESOS
procedure cargar_vector(var v: vector);
var
  i: integer;
begin 
  for i := 1 to dimf do begin 
    v[i] := random(34) + 1; 
  end;
end;

procedure imprimir_vector(v: vector);
var
  i: integer;
begin 
  for i := 1 to dimf do begin 
    write(v[i], '-'); 
  end;
  writeln;
end;

// a) Posicion: dado un número X, retorna la posición del número X o -1 si no se encuentra
function A(v: vector): integer;   
var 
  num: integer;
  pos: integer;
begin
  writeln('Ingresar un número:');
  read(num);
  pos := -1; // Inicializar posición en -1 (no encontrado)
  for pos := 1 to dimf do begin
    if (v[pos] = num) then begin
      A := pos; // Si se encuentra el número, devuelve la posición
      exit; // Sale del procedimiento después de encontrar el número
    end;
  end;
  A := -1; // Si no se encuentra, devuelve -1
end;     

// b) Intercambio: intercambia los valores en las posiciones x e y
procedure B(var v: vector; x: integer; y: integer);
var
  aux: integer;
begin
  aux := v[x];
  v[x] := v[y];
  v[y] := aux;
end;  

// c) Suma del vector: retorna la suma de todos los elementos
function C(v: vector): integer; 
var
  i: integer;
  suma: integer;
begin
  suma := 0;
  for i := 1 to dimf do begin
    suma := suma + v[i];
  end;
  C := suma;
end;    

// d) Promedio: devuelve el valor promedio de los elementos del vector
function D(v: vector): real;
var
  i: integer;
  sumador: integer;
begin
  sumador := 0;
  for i := 1 to dimf do begin
    sumador := sumador + v[i];
  end;
  D := sumador / dimf;
end;

// e) Elemento máximo: retorna la posición del mayor elemento del vector
function E(v: vector): integer;
var
  max: integer;
  i: integer;
  pos: integer;
begin
  pos := 0;
  max := -1;
  for i := 1 to dimf do begin
    if (v[i] > max) then begin
      max := v[i];
      pos := i;
    end;
  end;
  E := pos;
end;

// f) Elemento mínimo: retorna la posición del menor elemento del vector
function F(v: vector): integer;
var
  min: integer;
  i: integer;
  pos: integer;
begin
  pos := 0;
  min := 9999; // Valor arbitrariamente grande para comparación
  for i := 1 to dimf do begin
    if (v[i] < min) then begin
      min := v[i];
      pos := i;
    end;
  end;
  F := pos;
end;

//PROGRAMA PRINCIPAL
var
  v: vector;
  pos: integer;
begin
  randomize;
  cargar_vector(v); 
  writeln('VECTOR:');
  imprimir_vector(v);
  
  writeln('MÓDULO A:');
  writeln(A(v));  // Muestra la posición del número ingresado
  
  writeln('MÓDULO C:');
  writeln('Suma total: ', C(v));  // Muestra la suma total de los elementos
  
  writeln('MÓDULO D:');
  writeln('Promedio: ', D(v):0:2);  // Muestra el promedio de los elementos
  
  writeln('MÓDULO E:');
  writeln('Posición del elemento máximo: ', E(v));  // Muestra la posición del mayor elemento
  
  writeln('MÓDULO F:');
  writeln('Posición del elemento mínimo: ', F(v));  // Muestra la posición del menor elemento
end.





     
      
    





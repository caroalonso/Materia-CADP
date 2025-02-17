{6.Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener una longitud máxima 50 caracteres.

a)Definir una estructura de datos estática que permita guardar la información leída. 
Calcular el tamaño de memoria que requiere la estructura.

b)Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente estructura:

Type Nombre = String[50];
   Puntero = ^Nombre;
   ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros;


b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?
b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}


program ManejoDeMemoria;

type
  // (a) Definimos la estructura de datos estática
  TString50 = string[50];  
  TArrayCiudades = array[1..2500] of TString50;  

  // (b) Definimos el vector de punteros para almacenar nombres dinámicamente
  Nombre = string[50];    
  Puntero = ^Nombre;      
  ArrPunteros = array[1..2500] of Puntero;  

var
  ciudades: TArrayCiudades; // (a) Estructura estática
  Punteros: ArrPunteros;    // (b) Vector de punteros

// (b.2) Procedimiento para reservar memoria dinámicamente
procedure ReservarMemoria(var P: ArrPunteros);
var
  i: Integer;
begin
  for i := 1 to 2500 do
    new(P[i]); // Se reserva memoria para cada nombre
end;

// (b.3) Procedimiento para leer nombres y almacenarlos
procedure LeerNombres(var P: ArrPunteros);
var
  i: Integer;
begin
  for i := 1 to 2500 do
  begin
    write('Ingrese el nombre de la ciudad ', i, ': ');
    readln(P[i]^); // Se guarda el nombre en la memoria reservada
  end;
end;

begin
  // (a) Cálculo de memoria para estructura estática
  // Cada nombre ocupa 51 bytes (50 caracteres + 1 byte de longitud)
  // Memoria total: 2500 * 51 = 127500 bytes (124.5 KB)
  writeln('Memoria utilizada por estructura estática: ', 2500 * 51, ' bytes');

  // (b.1) Cálculo de memoria para vector de punteros
  // Cada puntero ocupa 4 bytes, por lo que el array de punteros ocupa:
  // 2500 * 4 = 10.000 bytes (9.77 KB)
  writeln('Memoria ocupada por el array de punteros: ', 2500 * 4, ' bytes');

  // (b.2) Reservamos memoria para los nombres
  ReservarMemoria(Punteros);

  // Memoria utilizada después de reservar:
  // Nombres: 2500 * 51 = 127500 bytes (124.5 KB)
  // Array de punteros: 10 KB
  // Total: 134.5 KB
  writeln('Memoria total utilizada tras la reserva: ', 2500 * 51 + 2500 * 4, ' bytes');

  // (b.3) Leer nombres y almacenarlos
  LeerNombres(Punteros);
end.

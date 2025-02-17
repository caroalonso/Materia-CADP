{Indicar los valores que imprimen los siguientes programas en Pascal. 
Justificar mediante prueba de escritorio.}

program punteros;
type

cadena = string[50];
puntero_cadena = ^cadena;

var
pc: puntero_cadena;
begin
pc^:= 'un nuevo texto';
new(pc);
writeln(pc^); 
end.

{Respuesta:
No se imprime nada , el programa tiene un error lógico en la asignación de pc^ antes de inicializar 
correctamente el puntero pc -> new(pc).}
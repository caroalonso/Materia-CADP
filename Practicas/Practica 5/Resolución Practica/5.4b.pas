{Indicar los valores que imprimen los siguientes programas en Pascal. 
Justificar mediante prueba de escritorio.}

program punteros;
type

cadena = string[50];
puntero_cadena = ^cadena;

var
pc: puntero_cadena;

begin
new(pc);
pc^:= 'un nuevo nombre';
writeln(sizeof(pc^), ' bytes');  // el valor interno del puntero 51 bytes de string
writeln(pc^);    // lo que apunta el puntero = un nuevo nombre
dispose(pc);
//pc^:= 'otro nuevo nombre';_//
end.

{Respuesta:
el programa no funciona , ya que en la ultima linea le asignamos valor a un puntero que fue eliminado
para arreglar esto deberiamos sacar la ultima linea  pc^:= 'otro nuevo nombre' para que pueda imprimir de forma 
correcta los 2 writeln anteriores}

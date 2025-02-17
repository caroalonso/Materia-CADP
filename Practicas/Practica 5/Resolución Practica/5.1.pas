{TIPO CANTIDAD DE BYTES
Entero 2 bytes
Real 4 bytes
Char 1 byte
String Tantos bytes como indique la longitud del String + 1
Record La suma de las longitudes de los campos del registro
Puntero 4 bytes
Boolean 1 byte

Indicar los valores que imprime el siguiente programa en Pascal.
Justificar mediante prueba de escritorio.
}

program punteros;
type

cadena = string[50];  // (cantidad de caracteres + uno = 50+1 )

puntero_cadena = ^cadena; // (un puntero ocupa siemre 4 bytes)

var
pc: puntero_cadena;

begin
writeln(sizeof(pc), ' bytes');  // 4 bytes  (puntero vacio)
new(pc);
writeln(sizeof(pc), ' bytes');    // 4 bytes (puntero vacio)
pc^:= 'un nuevo nombre';
writeln(sizeof(pc), ' bytes');  // 4 bytes  (puntero cargado pero esta imprimiendo solo al puntero no lo que tiene dentro)

writeln(sizeof(pc^), ' bytes'); // 51 byte , en este caso esta imprimiento lo que ocupa el contenido del puntero y es la cadena de string de 50+1
pc^:= 'otro nuevo nombre distinto al anterior';

writeln(sizeof(pc^), ' bytes');  // 51 byte , pasa exactamente lo mismo que arriba por mas que se modifique su contenido el valor que ocupa es siempre el mismo 50+1
end.
 


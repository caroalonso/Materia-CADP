{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program punteros;
type

  cadena = string[50];
  
  producto = record
  codigo: integer; //2 byte
  descripcion: cadena; //51 bytes
  precio: real; //4 bytes
end;

puntero_producto = ^producto;

var
p: puntero_producto;
prod: producto;

begin
writeln(sizeof(prod.codigo)); //2bytes entero
writeln(sizeof(prod.descripcion)); //51bytes (50+1)
writeln(sizeof(prod.precio)); //8

writeln(sizeof(p), ' bytes'); //4bytes puntero
writeln(sizeof(prod), ' bytes'); //64 producto 
new(p);
writeln(sizeof(p), ' bytes'); //4bytes
p^.codigo := 1;
p^.descripcion := 'nuevo producto';
writeln(sizeof(p^), ' bytes'); //64bytes
p^.precio := 200;
writeln(sizeof(p^), ' bytes');  //64bytes
prod.codigo := 2;
prod.descripcion := 'otro nuevo producto';
writeln(sizeof(prod), ' bytes'); //64bytes
end.

{
Análisis detallado:
Línea writeln(sizeof(prod.codigo));:

prod.codigo es de tipo integer, que ocupa 2 bytes en Pascal.
Imprime 2, que es correcto.
Línea writeln(sizeof(prod.descripcion));:

prod.descripcion es de tipo cadena (string[50]), que ocupa 51 bytes. 
Esto se debe a que una cadena de 50 caracteres tiene 50 bytes más 1 byte para el terminador nulo (#0).
Imprime 51, que es correcto.
Línea writeln(sizeof(prod.precio));:

prod.precio es de tipo real, que ocupa 8 bytes en Pascal (esto puede variar dependiendo de la arquitectura y del compilador,
pero en muchos compiladores de Pascal, como Free Pascal, el tipo real tiene un tamaño de 8 bytes).
Imprime 8, lo cual es correcto para el tipo real en la mayoría de los compiladores modernos.
Línea writeln(sizeof(p), ' bytes');:

p es un puntero (puntero_producto), que ocupa 4 bytes. Esto es independiente de lo que apunte el puntero; un puntero siempre 
ocupa el mismo tamaño.
Imprime 4 bytes, que es correcto.
Línea writeln(sizeof(prod), ' bytes');:

El tamaño total de prod es la suma de los tamaños de los campos del registro:
codigo: 2 bytes
descripcion: 51 bytes
precio: 8 bytes
El total es 2 + 51 + 8 = 61 bytes.
Imprime 64 bytes porque en algunos compiladores, como Free Pascal, los registros pueden estar alineados para optimizar el acceso 
a la memoria. Es posible que el compilador agregue relleno (padding) para que el tamaño total del registro sea múltiplo de 4 bytes 
o de algún otro tamaño alineado.
Imprime 64 bytes en vez de 61 bytes, lo que se debe al relleno de memoria.
Línea new(p);:

El puntero p se asigna a un bloque de memoria dinámicamente. Sin embargo, el tamaño del puntero sigue siendo 4 bytes.
Imprime 4 bytes nuevamente, ya que el tamaño de p como puntero no cambia.
Línea writeln(sizeof(p^), ' bytes');:

p^ hace referencia al registro producto al que apunta el puntero. El tamaño de un registro producto es el mismo que 
calculamos antes, que es 64 bytes debido al relleno.
Imprime 64 bytes, que es el tamaño de p^.
Línea p^.precio := 200;:

El valor del campo precio se cambia, pero el tamaño del registro no cambia.
Imprime 64 bytes nuevamente.
Línea prod.codigo := 2; prod.descripcion := 'otro nuevo producto';:

El tamaño de prod no cambia al modificar los valores de los campos. Sigue siendo 64 bytes debido al relleno.
Imprime 64 bytes.
}
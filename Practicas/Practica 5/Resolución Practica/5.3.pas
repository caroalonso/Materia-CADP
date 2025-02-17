{Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program punteros;
type

numeros = array[1..10000] of integer;  

puntero_numeros = ^numeros;

var
n: puntero_numeros;
num: numeros;
i:integer;

begin
writeln(sizeof(n), ' bytes'); //4 byte tipo puntero
writeln(sizeof(num), ' bytes'); //20000 bytes (10000*2)
new(n);
writeln(sizeof(n^), ' bytes'); // 20000 bytes 
for i:= 1 to 5000 do
n^[i]:= i;
writeln(sizeof(n^), ' bytes'); // 20000 bytes 
end.

{
Línea writeln(sizeof(n), ' bytes');:
n es un puntero de tipo puntero_numeros, que es un puntero a un arreglo de 10000 enteros.
El tamaño de un puntero en Pascal, sin importar lo que apunte, es 4 bytes en muchos compiladores modernos 
(como Free Pascal), ya que los punteros se almacenan como direcciones de memoria.
Imprime 4 bytes, ya que n es un puntero.

Línea writeln(sizeof(num), ' bytes');:
num es una variable de tipo numeros, que es un arreglo de 10000 enteros.
El tamaño de cada entero es de 2 bytes (esto depende del compilador, pero es común en muchos entornos de Pascal).
Como num es un arreglo de 10000 enteros, el tamaño total de num es:
10000×2=20000bytes
Imprime 20000 bytes, que es el tamaño del arreglo de enteros num.

Línea new(n);:
n es un puntero que se asigna dinámicamente con new(n). 
Esto significa que el puntero n ahora apunta a un bloque 
de memoria dinámico que tiene el tamaño de un arreglo de 10000 enteros.
El tamaño de lo que n apunta (el arreglo dinámico) es igual al tamaño de num, es decir, 20000 bytes.

Línea writeln(sizeof(n^), ' bytes');:
n^ hace referencia al bloque de memoria al que apunta n, es decir, a un arreglo de 10000 enteros.
Ya sabemos que el tamaño de este arreglo es 20000 bytes.
Imprime 20000 bytes, que es el tamaño del arreglo al que n apunta.

Bucle for i := 1 to 5000 do n^[i] := i;:
Este bucle asigna los valores 1 a 5000 en las primeras 5000 posiciones del arreglo apuntado por n. Sin embargo, 
este proceso no afecta el tamaño del arreglo en sí; el tamaño sigue siendo 20000 bytes.
No hay salida de impresión en esta línea.
Línea writeln(sizeof(n^), ' bytes');:

Aquí se vuelve a imprimir el tamaño del arreglo al que apunta n. 
Dado que no hemos modificado el tamaño del arreglo (solo sus valores), el tamaño sigue siendo 20000 bytes.
Imprime 20000 bytes, ya que el tamaño del arreglo dinámico sigue siendo el mismo}
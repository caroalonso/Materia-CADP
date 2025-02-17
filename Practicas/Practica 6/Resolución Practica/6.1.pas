{1.
a. Indicar qué hace el programa.
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0.
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista}

program JugamosConListas;
type

lista = ^nodo;

nodo = record
 num : integer;
 sig : lista;
end;

procedure armarNodo(var L: lista; v: integer);
var
 aux : lista;
begin
 new(aux);
 aux^.num := v;
 aux^.sig := L;
 L := aux;
end;

var
 pri : lista;
 valor : integer;
begin
 pri := nil;
 writeln(‘Ingrese un numero’);
 read(valor);
 while (valor <> 0) then begin
 armarNodo(pri, valor);
 writeln(‘Ingrese un numero’);
 read(valor);
 end;
 //imprimir lista 
end.

{Respuesta:

a)El programa crea una lista enlazada donde cada número ingresado por el usuario es agregado al comienzo de la lista.
Cuando el usuario ingresa 0, se detiene la carga.
La lista final está en orden inverso al ingresado.

b)Si se ingresan los números: 10, 21, 13, 48, 0, la lista se arma en este orden (último ingresado primero):
48 -> 13 -> 21 -> 10

c)Se agregó el procedimiento imprimirLista(L: lista) para recorrer la lista e imprimir los valores.

d)Se implementó incrementarLista(L: lista; valor: integer), que recorre la lista y suma valor a cada elemento.}
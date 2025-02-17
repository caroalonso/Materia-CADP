{10. Una empresa de sistemas está desarrollando un software 
para organizar listas de espera de clientes. 
Su funcionamiento es muy sencillo: 

cuando un cliente ingresa al local, se registra su DNI y se le entrega un número 
(que es el siguiente al último número entregado).
El cliente quedará esperando a ser llamado por su número, en cuyo caso sale de la lista de espera. 
Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.

b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes en espera,
asigna un número al cliente y retorna la lista de espera actualizada.

c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera,
y retorna el número y DNI del cliente a ser atendido y la lista actualizada. 
El cliente atendido debe eliminarse de la lista de espera.

d. Implementar un programa que simule la atención de los clientes. 
En dicho programa, primero llegarán todos los clientes juntos,
se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por vez. 
El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}


program listas;
type
  cliente = record
    dni: integer;
    num: integer;
  end;

  lista = ^nodo;

  nodo = record
    elem: cliente;
    sig: lista;
  end;

// Procedimiento para recibir un cliente
procedure RECIBIR_CLIENTES(var l: lista; dni: integer; var num_cliente: integer; var ult: lista);
var
  nue: lista;
begin
  num_cliente := num_cliente + 1;
  new(nue);
  nue^.elem.dni := dni;
  nue^.elem.num := num_cliente;
  nue^.sig := nil;
  
  if (l = nil) then begin
    l := nue;  // Si la lista está vacía, el nuevo cliente será el primero
  end
  else begin
    ult^.sig := nue;  // Si no, lo añadimos al final
  end;
  ult := nue;  // Actualizamos el último nodo
end;

// Procedimiento para atender a un cliente
procedure ATENDER_CLIENTE(var l: lista; var dni: integer; var num_cliente: integer);
var
  actual: lista;
begin
  if (l <> nil) then begin
    dni := l^.elem.dni;
    num_cliente := l^.elem.num;
    actual := l;
    l := actual^.sig;  // Actualizamos el puntero para apuntar al siguiente cliente
    dispose(actual);  // Eliminamos el nodo atendido
  end;
end;

// Programa principal
var
  l: lista;
  dni: integer;
  num_cliente: integer;
  ult: lista;
begin
  ult := nil;
  l := nil;
  num_cliente := 0;
  
  writeln('Ingrese el DNI de los clientes. Ingrese 0 para terminar.');
  
  read(dni);
  while (dni <> 0) do begin
    RECIBIR_CLIENTES(l, dni, num_cliente, ult);
    writeln('Cliente con DNI ', dni, ' ingresado con numero de espera: ', num_cliente);
    read(dni);
  end;

  writeln('Atendiendo a los clientes...');
  
  // Atender a todos los clientes
  while (l <> nil) do begin
    ATENDER_CLIENTE(l, dni, num_cliente);
    writeln('El cliente con DNI ', dni, ' y numero ', num_cliente, ' ha sido atendido.');
  end;

  writeln('Todos los clientes han sido atendidos.');
end.


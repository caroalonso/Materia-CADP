{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}

program listas;
type

lista = ^nodo;

nodo = record
  num : integer;
  sig : lista;
end;
  
procedure AGREGARATRAS(var L: lista; dato: integer);  // Opción A
var
  nue: lista;
  act: lista;
begin
  new(nue);
  nue^.num := dato;
  nue^.sig := nil;

  if (L <> nil) then begin
    act := L;
    while (act^.sig <> nil) do begin
      act := act^.sig;
    end;
    act^.sig := nue;
  end
  else begin
    L := nue;  // Si la lista está vacía, el primer nodo es el nuevo
  end;
end;


procedure AGREGARATRAS(var L: lista; dato: integer; var ult: lista);  // Opción B
var
  nue: lista;
begin
  new(nue);
  nue^.num := dato;
  nue^.sig := nil;

  if (L = nil) then begin  // Si la lista está vacía
    L := nue;
    ult := nue;  // El primer nodo es también el último
  end
  else begin
    ult^.sig := nue;  // Conectamos el nodo nuevo al final
    ult := nue;  // Actualizamos el puntero al último nodo
  end;
end;


{Programa principal}
var
  pri: lista;
  valor: integer;
  ult: lista;  // Necesario para Opción B
begin
  ult := nil;  // Inicializamos el último nodo para Opción B
  pri := nil;
  writeln('Ingrese un numero: (finaliza con 0)');
  read(valor);
  while (valor <> 0) do begin
    //AGREGARATRAS(pri, valor);  // Opción A.
    AGREGARATRAS(pri, valor, ult);  // Opción B
    writeln('Ingrese un numero');
    read(valor);
  end;

  {Imprimir lista}
  while (pri <> nil) do begin
    writeln('Numero: ', pri^.num);
    pri := pri^.sig;
  end;
end.

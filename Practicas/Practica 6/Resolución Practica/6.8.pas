{8. Utilizando el programa del ejercicio 1, 
modificar el módulo armarNodo para que los elementos de la lista queden ordenados 
de manera ascendente (insertar ordenado).}

program JugamosConListas;
type
  lista = ^nodo;

  nodo = record
    elem : integer;
    sig : lista;
  end;

procedure insertar_ordenado(var L: lista; v: integer);
var
  nue, act, ant: lista;
begin
  new(nue);
  nue^.elem := v;
  nue^.sig := nil;

  if (L = nil) then begin   // caso lista vacía
    L := nue;
  end
  else begin   
    act := L;   // en el caso de que no sea el primer nodo, pongo a act al comienzo de la lista con L 
    ant := nil; // Inicializo 'ant' como nil porque no existe un nodo anterior al primero.
    
    // Recorro la lista hasta encontrar el lugar adecuado para insertar el nuevo nodo
    while (act <> nil) and (act^.elem < nue^.elem) do begin  
      ant := act;      // 'ant' siempre apunta al nodo anterior a 'act'
      act := act^.sig; // Me muevo al siguiente nodo
    end;
    
    if (ant = nil) then begin // Si 'ant' es nil, es que el nuevo nodo debe ser el primer nodo
      nue^.sig := L;
      L := nue;
    end
    else begin
      ant^.sig := nue;  // 'ant' apunta al nodo anterior
      nue^.sig := act;  // 'nue' apunta al siguiente nodo de 'act'
    end;
  end;  
end;

procedure imprimir(l:lista);
begin
  while (l <> nil) do begin
    writeln(l^.elem);
    l := l^.sig;
  end;
end;

// PROGRAMA PRINCIPAL
var
  l: lista;
  valor: integer;
begin
  l := nil;
  writeln('Ingrese un numero: (finaliza con valor 0)');
  read(valor);
  
  while (valor <> 0) do begin
    insertar_ordenado(l, valor);
    writeln('Ingrese un numero: (finaliza con valor 0)');
    read(valor);
  end;
  
  // Imprimir lista
  writeln('Los elementos de la lista ordenados son:');
  imprimir(l);
end.

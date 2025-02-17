{ implementar siguentes modulos:  
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A,
 y retorna la cantidad de elementos de la lista que son múltiplos de A. 
 -- un numero es multiplo de otro, cuando el resultado de la divicion de ambos da como resto 0 }

program listas;
type
  lista = ^nodo;

  nodo = record
    num : integer;
    sig : lista;
  end;
  
procedure agregar_adelante(var L: lista; v: integer);
var
  aux : lista;
begin
  new(aux);
  aux^.num := v;
  aux^.sig := L;
  L := aux;
end;

procedure recorrerlista_A(l: lista; var max: integer); //A
begin
  while (l <> nil) do begin
    if (l^.num > max) then begin
      max := l^.num;
    end;
    l := l^.sig;
  end;
end;

procedure recorrerlista_B(l: lista; var min: integer); //B
begin
  if l <> nil then begin
    min := l^.num;  // Inicializar 'min' con el primer valor de la lista.

  while (l <> nil) do begin
    if (l^.num < min) then begin
      min := l^.num;
    end;
    l := l^.sig;
  end;
end;

procedure recorrerlista_C(l: lista; num: integer; var cant: integer); //C
begin
  while (l <> nil) do begin
    if ((l^.num MOD num) = 0) then begin
      cant := cant + 1;
    end;
    l := l^.sig;
  end;
end;

{programa principal}
var
  pri : lista;
  valor : integer;
  max, min, cant, A: integer;  // Definimos A aquí

begin
  pri := nil;
  max := -9999;
  min := 99999;
  cant := 0;
  
  writeln('Ingrese un numero: (finaliza con 0)');
  read(valor);
  
  while (valor <> 0) do begin
    agregar_adelante(pri, valor);
    writeln('Ingrese un numero: (finaliza con 0)');
    read(valor);
  end;

  writeln('Ingrese un valor A para verificar multiplos: ');
  read(A); // Lectura del valor A

  recorrerlista_A(pri, max);
  recorrerlista_B(pri, min);
  recorrerlista_C(pri, A, cant);
  
  writeln('El valor maximo es: ', max);
  writeln('El valor minimo es: ', min);
  writeln('La cantidad de multiplos de ', A, ' es: ', cant);
  
  { imprimir lista }
end.


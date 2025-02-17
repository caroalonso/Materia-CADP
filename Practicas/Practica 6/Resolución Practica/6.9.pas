{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:

a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en caso contrario.

b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). 
Nota: la lista podría no estar ordenada.
   
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y 
   retorna una nueva lista con todos los elementos de la lista L mayores que A y menores que B.
   
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de manera ascendente.

e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada
   de manera descendente.}


program listas;
type

lista = ^nodo;

nodo = record
  elem : integer;
  sig : lista;
end;

//PROCESOS 

procedure armarNodo(var l: lista; v: integer);
var
aux : lista;
begin
new(aux);
aux^.elem := v;
aux^.sig := L;
L := aux;
end;

procedure agregar_atras(var l2:lista; var ult:lista; v:integer);
var
nue:lista;
begin
 new(nue);
 nue^.elem:=v;
 nue^.sig:=nil;
 if(l2=nil)then begin
   l2:=nue;
 end
 else begin
   ult^.sig:=nue;
 end;
 ult:=nue;  
end; 
   

function modulo_A(l: lista): boolean; // MÓDULO A
var
  cumple: boolean;
  menor: integer;
begin
  menor := -1;
  cumple := true;
  while (l <> nil) do begin
    if l^.elem < menor then begin
      cumple := false;
      break;
    end;
    menor := l^.elem;
    l := l^.sig;
  end;
  modulo_A := cumple;
end;


procedure modulo_B(var l:lista ; valor:integer; var ok:boolean); //MODULO B
var
ant:lista;
actual:lista;
begin
  ok:=false;
  ant:=l;
  actual:=l;
  while(actual <> nil) and (l^.elem <> valor)do begin
    ant:=actual;
    actual:=actual^.sig;
  end;
  
  if (actual <> nil) then begin
    if (actual =l ) then // en el caso de que sea el primer elementod e la lista.
      l:=l^.sig
    else 
      ant^.sig:=actual^.sig;

    dispose(actual); // esta condicion siempre la hace ya sea por el if o por el else por eso se pone afuera.-
    ok:=true;
  end;
end;     



procedure modulo_C( l:lista; var l2:lista; A:integer; B:integer);  //MODULO C
begin
  while(l <> nil) do begin
    if (l^.elem > A) and (l^.elem < B)then begin // todo los elementos de la lista mayores que A y menores que B , se agregan a nueva lista l2
      armarNodo(l2,l^.elem);
    end;
    l:=l^.sig;
  end;
end;      
  
procedure modulo_D(l:lista;var l2:lista; A:integer;B:integer);  //MODULO D
var
ult:lista;
begin
  ult:=nil;
  while(l <> nil) do begin
    if (l^.elem > A ) and (l^.elem < B)then begin
      agregar_atras(l2,ult,l^.elem);
    end;
    l:=l^.sig;
  end;
end; 

Procedure modulo_E(l:lista;var l2:lista; A:integer;B:integer); //MODULO E -- IGUAL AL MODULO C.
begin
  while(l <>nil)do begin
    if (l^.elem > A )and(l^.elem < B)then begin
      armarNodo(l2,l^.elem);
    end;
    l:=l^.sig;
  end;
end;  


//PROGRAMA PRINCIPAL
var
l:lista;
valor: integer;
ok:boolean;  //modulo_b
A:integer;  //modulo_c
B:integer; //modulo_c
l2:lista; //modulo_c

begin
  l := nil;
  l2:=nil; //modulo_c
  writeln;
  writeln('Los elementos que vayan ingresando son agregados al comienzo de la lista,');
  writeln('si se quiere obtener una lista ordenada deben ingresarse los numeros de mayor a menor');
  writeln('Ingrese un numero: (finaliza con valor 0):');
  read(valor);
  while (valor <> 0) do begin
    armarNodo(l, valor);
    writeln('Ingrese un numero: (finaliza con valor 0):');
   read(valor);
  end;

//-------------------//

  //MODULO A
  if (modulo_A(l)) then 
    writeln('LA LISTA SE ENCUENTRA ORDENADA')
  else 
    writeln('LA LISTA NO SE ENCUENTRA ORDENADA');

  //MODULO B
  writeln;
  writeln('ingrese numero a eliminar en la lista:');
  read(valor);
  modulo_B(l,valor,ok);
  if (ok) then 
    writeln('EL ELEMENTO SE PUDO ELIMINAR CON EXITO')
  else 
    writeln('EL ELEMENTO INGRESADO NO SE ENCONTRABA EN LA LISTA ');

  //MODULO C
  writeln;
  writeln('Los elementos de la lista mayores al valor A y menores al valor B , se agregan a una nueva lista l2');
  writeln('ingrese valor A:');
  read(A);
  writeln('ingrese valor B:');
  read(B);
  modulo_C(l,l2,A,B);
  {imprimir lista nueva l2}

  //MODULO D
  writeln;
  writeln('Se asume que la lista l esta ordenada de manera ascendente, para mantener ordenada la nueva lista l2 se realiza el agregar atras en l2');
  l2:=nil;
  writeln('ingrese valor A:');
  read(A);
  writeln('ingrese valor B:');
  read(B);
  modulo_C(l,l2,A,B);  
  {imprimir lista nueva l2 (ordenada)}

  //MODULO E
  writeln;
  writeln('Se asume que la lista l esta ordenada de manera descendente');
  l2:=nil;
  writeln('ingrese valor A:');
  read(A);
  writeln('ingrese valor B:');
  read(B);
  modulo_C(l,l2,A,B);  
 {imprimir lista nueva l2 }
end.

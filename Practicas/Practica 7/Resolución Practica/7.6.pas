{El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. 
Los objetos se clasifican en 7 categorías: 1: estrellas,2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.

Al observar un objeto, se registran los siguientes datos: 
código del objeto, 
categoría del objeto (1..7),
nombre del objeto, 
distancia a la Tierra (medida en años luz),
nombre del descubridor 
y año de su descubrimiento.

A. Desarrolle un programa que LEA y ALMACENE la información de los objetos que han sido observados. 
Dicha información se lee hasta encontrar un objeto con código -1 (el cual NO DEBE procesarse).
La estructura generada debe mantener el orden en que fueron leídos los datos. (AGREGAR ATAS).

B. UNA VEZ LEIDOS y ALMACENADOS todos los datos, se pide realizar un reporte con la siguiente
información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado. (2 MAXIMOS)
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600. (if dos condiciones)
3. La cantidad de objetos observados por cada categoría. (vector contador)
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares. (descomponer numeros).}

program listas_repaso ;
const
 dimf=7;
 type
   str=string[40];
   rango=1..dimf;
   
   vector_nombres = array [rango] of string;
   
   vector_contador= array[rango]of integer;
   
   objetos=record
     cod:integer;
     cate:rango;
     nombre:str;
     distancia:integer;
     descubridor:str;
     anio_descubierto:integer;
   end;
   
   lista=^nodo;
   
   nodo=record
     elem:objetos;
     sig:lista;
   end;

//procesos

procedure vect_nombres (var vec: vector_nombres);
var
i:integer;
nom:str;
begin
  vec[1] := 'Estrellas';
  vec[2] := 'Planetas';
  vec[3] := 'Satélites';
  vec[4] := 'Galaxias';
  vec[5] := 'Asteroides';
  vec[6] := 'Cometas';
  vec[7] := 'Nebulosas';
end;

procedure inicializar_vector (var vec_ini : vector_contador);
var
i:integer;
begin
  for i := 1 to dimf do begin
    vec_ini[i]:=0;
  end;
end;

procedure agregar_atras(var l :lista ; var ult:lista ; obj:objetos);
var
nue:lista;
begin
  new(nue);
  nue^.elem:=obj;
  nue^.sig:=nil;
  
  if(l=nil)then begin
    l:=nue;
  end
  else begin
    ult^.sig:=nue;
  end;
  ult:=nue;
end;    

procedure leer_objeto (var ob:objetos);
begin
  readln(ob.cod);
  if(ob.cod <> -1)then begin
    readln(ob.cate);
    readln(ob.nombre);
    readln(ob.distancia);
    readln(ob.descubridor);
    readln(ob.anio_descubierto);
  end;
end;

procedure leer_info (var l :lista; vec:vector_contador);
var
ult:lista;
ob:objetos;
begin
  leer_objeto (ob);
  while (ob.cod<>-1)do begin
    vec[ob.cate]:=vec[ob.cate]+1;
    agregar_atras(l,ult,ob);
    leer_objeto(ob);
  end;
end;

procedure imprimir_categorias (vec:vector_contador);
var
i:integer;
begin
  for i := 1 to dimf do begin
    writeln('Para la categoria ', i, ' (', vec[i], ' objetos): ', vec[i]);
  end;
end; 

procedure maximos(objeto:objetos; var max1:integer; var max2:integer; var cod1:integer; var cod2:integer);
begin
  if(objeto.distancia > max1)then begin
    max2:=max1;
    max1:=objeto.distancia;
    cod2:=cod1;
    cod1:=objeto.cod;
  end
  else begin
    if(objeto.distancia > max2)then begin  
      max2:=objeto.distancia;
      cod2:=objeto.cod;
    end;
  end;
end;      

function par_impar (num : integer):boolean;
var
dig:integer;
cumple:boolean;
par, impar:integer;
begin    
  par:=0;
  impar:=0;
  cumple:=false;
  while(num <>0)do begin
    dig:= num mod 10;
    if ((dig mod 2)=0)then begin
      par:=par+1;
    end
    else begin
      impar:=impar+1;
    end;
    num:=num div 10;
  end;        
  if(par > impar)then begin
    cumple:=true;
  end;
  par_impar:=cumple;
end; 

function planetas(obje:objetos):integer;
begin
  if(obje.descubridor = 'Galileo Galilei') and (obje.anio_descubierto < 1600) then begin
    planetas := 1;
  end
  else begin
    planetas := 0;
  end;
end;

procedure procesar_info(l:lista ; vec_nom: vector_nombres; vec_con: vector_contador);  
var
max1:integer;
max2:integer;
cod1:integer;
cod2:integer;
total_planetas:integer;
begin
   max1:=-1;
   max2:=-1;
   total_planetas:=0;
  while (l<>nil)do begin
    maximos(l^.elem,max1,max2,cod1,cod2); 
    if(par_impar(l^.elem.cod))then begin
      writeln('La estrella ', l^.elem.nombre);
    end;   
    total_planetas := total_planetas + planetas(l^.elem);
    l := l^.sig;
  end;
  writeln('Los códigos de los dos objetos más lejanos de la Tierra son: ', cod1, ' y ', cod2);
  imprimir_categorias(vec_con);
  writeln('Total de planetas descubiertos por Galileo Galilei antes de 1600: ', total_planetas);
end;  

//programa principal
var
l:lista;
v1:vector_nombres;
v2:vector_contador;

begin
  l:=nil;
  vect_nombres(v1);
  inicializar_vector(v2);
  leer_info(l,v2); 
  procesar_info(l,v1,v2);
end.

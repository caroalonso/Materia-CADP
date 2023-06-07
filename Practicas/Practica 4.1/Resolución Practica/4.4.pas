{4.Se dispone de un vector con 40 números enteros.
Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.

b) intercambio: recibe dos valores x e y (entre 1 y 40) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.

c) sumaVector: retorna la suma de todos los elementos del vector.

d) promedio: devuelve el valor promedio de los elementos del vector.

e) elementoMaximo: retorna la posición del mayor elemento del vector

f) elementoMinimo: retorna la posicion del menor elemento del vector
}

program punto4;
const
dimf=40;

type
vector=array[1..dimf] of integer;  

//PROCESOS
procedure cargar_vector(var v:vector);
var
 i: integer;
begin 
  for i := 1 to dimf do begin 
    v[i]:=random(34)+1; 
  end;
end;

procedure imprimir_vector(v:vector);
var
 i: integer;
begin 
  for i := 1 to dimf do begin 
    write(v[i],'-'); 
  end;
end;


function A (v:vector):integer;   
var 
  num:integer;
  cumple:boolean;
  pos:integer;
begin
  cumple:=false;
  pos:=0;
  writeln('ingresar un numero:');
  read(num);
  while (pos < dimf) and not (cumple) do begin
    pos:=pos+1;
    if(v[pos]=num)then begin
      cumple:=true;
      A:=pos;
    end
  end;    
  if(pos=dimf)then
     A:=-1    
end;     


procedure B (var v:vector; x:integer; y:integer);
var
  aux:integer;
begin
  aux:=v[x];
  v[x]:=v[y];
  v[y]:=aux;
end;  


function C (v :vector):integer; 
var
i: integer;
suma:integer;
begin
  suma:=0;
  for i := 1 to dimf do begin
    suma:=suma + v[i];
  end;
  C:=suma;
end;    


function D (v:vector):real;
var
i:integer;
sumador:integer;
begin
  sumador:=0;
  for i:= 1 to dimf do begin
    sumador:=sumador+v[i];
  end;
  D:=(sumador/dimf);
end;


function E (v:vector):integer;
var
max:integer;
i:integer;
pos:integer;
begin
  pos:=0;
	max:=-1;
  for i:= 1 to dimf do begin
		if (v[i] > max) then begin
			max:=v[i];
			pos:= i ;
		end;
	end;
	E:=pos;
end;


function F (v:vector):integer;
var
min:integer;
i:integer;
pos:integer;
begin
  pos:=0;
	min:=9999;
  for i:= 1 to dimf do begin
    if(v[i]<min)then begin
      min:=v[i];
      pos:=i;
    end;
	end;
	F:=pos;
end;

//PROGRAMA PRINCIPAL
var
  v:vector;
  pos:integer;
begin
  randomize;
  cargar_vector(v); 
  writeLn('VECTOR:');
  imprimir_vector(v);
  WriteLn('MODULO A:');
  Writeln(A(v));
  WriteLn('MODULO C:');
  Writeln('suma total: ',C(v));
  WriteLn('MODULO D:');
  Writeln('promedio: ',D(v):0:2);
  WriteLn('MODULO E:');
  Writeln('posicion del elemento maximo: ',E(v));
  WriteLn('MODULO F:');
  Writeln('posicion del elemento minimo: ',F(v));
end.




     
      
    





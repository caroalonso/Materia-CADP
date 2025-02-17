{3.Se dispone de un vector con números enteros, de dimensión física (dimF) y dimensión lógica (dimL).

a) Realizar módulo que imprima el vector desde la primera posición hasta la última.

b) Realizar módulo que imprima el vector desde la última posición hasta la primera.

c) Realizar módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.

d) Realizar un módulo que reciba el vector, una posición X y otra posición Y,
e imprima el vector desde la posición X hasta la Y.
Asuma que tanto X como Y son menores o igual a la dimensión lógica.
Y considere que, dependiendo de los valores de X e Y, podría ser necesario recorrer
hacia adelante o hacia atrás.
}

program punto3;
const
  dimf = 6;

type 
  vector = array[1..dimf] of Integer;

//PROCESOS
procedure cargarvector(var v: vector; var diml: Integer);
var
  num: integer;
begin
  writeln('Ingrese un número entero (0 para terminar):');
  read(num);
  while (diml < dimf) and (num <> 0) do begin
    diml := diml + 1;
    v[diml] := num;
    writeln('Ingrese un número entero (0 para terminar):');
    read(num);
  end;    
end;

procedure A(v: vector; diml: integer);
var
  i: integer;
begin
  for i := 1 to diml do begin
    write(v[i], '-');
  end;
end;

procedure B(v: vector; diml: integer);
var
  i: integer;
begin
  for i := diml downto 1 do begin
    write(v[i], '-');
  end;
end;

procedure C(v: vector; diml: integer);
var
  num: integer;
  i: integer;
  e: integer;
begin
  num := diml div 2;
  // Imprimir vector desde la mitad hacia la primera posición
  for i := num downto 1 do begin
    write(v[i], '-');
  end;
  num := num + 1;
  // Imprimir vector desde la mitad+1 hasta la última posición
  for e := num to diml do begin
    write(v[e], '-');
  end;
end;

procedure D(v: vector; x: integer; y: integer);
begin
  if (x < y) then begin
    // Imprimir vector de la posición X a la posición Y
    while (x <= y) do begin
      write(v[x], '-');
      x := x + 1;
    end;  
  end
  else begin
    // Imprimir vector de la posición X a la posición Y hacia atrás
    while (x >= y) do begin
      write(v[x], '-');
      x := x - 1;
    end;
  end;
end;

procedure E(v: vector; x: integer; y: integer);
begin
  if (x < y) then begin //x<y, dimL= y
    A(v, y);
    writeln();
    C(v, y);
  end    
  else begin 
    B(v, x); //x>y, dimL=x
    writeln();
    C(v, x);
  end;
end;

//PROGRAMA PRINCIPAL
var
  diml: integer;
  x: integer;
  y: integer;
  v: vector; 
begin
  diml := 0;
  cargarvector(v, diml); 
  writeln('MÓDULO A:');
  A(v, diml); 
  writeln();
  writeln('MÓDULO B:');
  B(v, diml); 
  writeln();
  writeln('MÓDULO C:');
  C(v, diml); 
  x := 2;
  y := 5;
  writeln();
  writeln('MÓDULO D:');
  D(v, x, y);
  writeln();
end.

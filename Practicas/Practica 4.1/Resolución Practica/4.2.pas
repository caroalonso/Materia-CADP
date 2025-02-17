{ 2.Dado el siguiente programa, complete las líneas indicadas, considerando que:

a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica.
La lectura finaliza cuando se ingresa el valor 0 (que no debe procesarse) o cuando el vector está completo.

b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.}

program Vectores;
const
  dimf = 2;

type
  vector = array[1..dimf] of real;

//PROCESOS
procedure cargarVector(var v: vector; var diml: integer);
var
  num: real;
begin
  writeln('ingrese un numero real:');
  read(num);
  while (diml < dimf) and (num <> 0) do begin
    diml := diml + 1;
    v[diml] := num;
    writeln('ingrese un numero real:');
    read(num);
  end;    
end;

procedure modificarVectorySumar(var v: vector; dimL: integer; num: real; var suma: real);
var
  i: integer;
begin
  suma := 0;  { Inicializar suma en cero antes de empezar la acumulación }
  for i := 1 to dimL do begin
    v[i] := v[i] + num;
    suma := suma + v[i];
  end;  
end;

//PROGRAMA PRINCIPAL
var
  v: vector;
  diml: integer;
  num: real;  { Cambié tipo de variable a real }
  suma: real;
begin
  diml := 0;
  suma := 0;
  cargarVector(v, diml);
  writeln('Ingrese un valor a sumar:');
  readln(num);
  modificarVectorySumar(v, diml, num, suma);
  writeln('La suma de los valores es: ', suma:0:2);  { Se especifica el formato de salida con 2 decimales }
  writeln('Se procesaron: ', diml, ' numeros');
end.


{10. Realizar un programa que lea y almacene el salario de los empleados
de una empresa de turismo (a losumo 300 empleados). 
La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se completa el vector. 

Una vez finalizada la carga de datos se pide:
a) Realizar un módulo que incremente el salario de cada empleado en un 15%. 
Para ello, implementar un módulo que reciba como parámetro un valor real X, el vector de valores reales
y su dimensión lógica y retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.

b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program vectores;
const
  dimf=300;

type
  rango=1..dimf;
  vector= array [rango] of real;  
  
//PROCESOS
procedure cargar_vector (var v:vector ; var diml:integer);
var
salario:real;
begin
  WriteLn('ingrese salario:');
  readln(salario);
  while(diml < dimf) and (salario <> 0) do begin
    diml:=diml+1;
    v[diml]:=salario;
    WriteLn('ingrese salario:');
    readln(salario);  
  end;
  WriteLn('finalizo la carga.')
end;    


procedure incrememento_salario (var v:vector ; diml:integer ; x:real);
var
i:integer;
begin
  for i := 1 to diml do begin
    v[i]:=(v[i]*x);
  end;
end;    


procedure promedio (v:vector;diml:integer);
var
i:integer;
contador:real;
begin
  contador:=0;
  for i := 1 to diml do begin
    contador:=contador + v[i];
  end;
  writeln('sueldo promedio de los empleados de la empresa: ',(contador/diml):0:2);
end;  
       

//PROGRAMA PRINCIPAL
var
v:vector;
diml:integer;
x:real;
begin
  diml:=0;
  cargar_vector(v,diml);
  WriteLn('ingresar valor X :');
  readln(x);
  incrememento_salario(v,diml,x);
  promedio(v,diml);
end.  

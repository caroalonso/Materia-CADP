{5.Utilizando los módulos implementados en el ejercicio 3, realizar un programa que 
lea números enteros desde teclado (a lo sumo 10 ) y los almacene en un vector.
La carga finaliza al leer el número 0.
Al finalizar la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento,
e informe la operación realizada de la siguiente manera:
“El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.
}

program punto5;
const
  dimf = 10;

type
  vector = array[1..dimf] of integer;

//PROCESOS
procedure cargar_vector(var v: vector; var diml: integer);
var
  num: integer;
begin
  Writeln('Ingrese un número:');
  ReadLn(num);
  while (diml < dimf) and (num <> 0) do begin  
    diml := diml + 1;
    v[diml] := num;
    Writeln('Ingrese un número:');
    ReadLn(num);
  end;
end;

procedure maximo(v: vector; diml: integer; var max: integer; var p1: integer);
var
  i: integer;
begin
  for i := 1 to diml do begin
    if (v[i] > max) then begin
      max := v[i];
      p1 := i;
    end;
  end;
end;

procedure minimo(v: vector; diml: integer; var min: integer; var p2: integer);
var
  i: integer;
begin
  for i := 1 to diml do begin
    if (v[i] < min) then begin
      min := v[i];
      p2 := i;
    end;
  end;
end;

procedure intercambio(var v: vector; p1: integer; p2: integer);
var
  aux: integer;
begin
  aux := v[p1];
  v[p1] := v[p2];
  v[p2] := aux;
end;

//PROGRAMA PRINCIPAL
var
  v: vector;
  diml: integer;
  pos1: integer;
  pos2: integer;
  max: integer;
  min: integer;
begin
  max := -1;
  min := 9999;
  diml := 0;
  pos1 := 0;
  pos2 := 0;
  cargar_vector(v, diml);
  
  if diml > 0 then begin // Verifica que haya elementos en el vector
    maximo(v, diml, max, pos1);
    minimo(v, diml, min, pos2);
    intercambio(v, pos1, pos2);
    writeln('El elemento máximo ', max, ' que se encontraba en la posición ', pos1, 
            ' fue intercambiado con el elemento mínimo ', min, 
            ' que se encontraba en la posición ', pos2);
  end else begin
    writeln('No se han ingresado números válidos.');
  end;
end.

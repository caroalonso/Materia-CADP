{9.Modificar la solución del punto anterior considerando que el programa lea 
y almacene la información de A LO SUMO 10 alumnos. 
La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).
}

program vectores;
const
  dimf = 10;

type
  str = string;
  rango = 1..dimf;

  alumnos = record
    num: integer;
    dni: integer;
    nombre: str;
    apellido: str;
    anio: integer;
  end;

  vector = array [rango] of alumnos;

//PROCESOS 
procedure randomString(tamanio: integer; var palabra: string);
var
  str, Result: String;
begin
  str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = tamanio);
  palabra := Result;
end;

procedure leer_alumno(var a: alumnos);
begin
  WriteLn('La carga finaliza con el numero de dni -1');
  writeLn('Ingrese dni:');
  readln(a.dni);
  if (a.dni <> -1) then
  begin
    a.num := random(999) + 1;
    randomString(4, a.nombre);
    randomString(4, a.apellido);
    writeLn('Ingrese anio de nacimiento:');
    readln(a.anio);
  end;
end;

procedure cargar_vector(var v: vector; var diml: integer);
var
  alu: alumnos;
begin
  diml := 0;
  leer_alumno(alu);
  while (diml < dimf) and (alu.dni <> -1) do
  begin
    diml := diml + 1;
    v[diml] := alu;
    leer_alumno(alu);
  end;
  WriteLn('Finalizacion de carga de alumnos');
end;

procedure imprimir_vector(v: vector; diml: integer);
var
  i: integer;
begin
  writeln('Vector de alumnos:');
  for i := 1 to diml do
  begin
    writeln(i, ') NUMERO:', v[i].num, ' DNI:', v[i].dni, ' APELLIDO: ', v[i].apellido, ' NOMBRE: ', v[i].nombre, ' ANIO:', v[i].anio);
  end;
end;

function descomposicion_numero(num: integer): integer;
var
  dig: integer;
  cumple: integer;
begin
  cumple := 1;
  while (num <> 0) and (cumple = 1) do
  begin
    dig := num mod 10;
    if ((dig mod 2) = 0) then
    begin
      cumple := 1;
    end
    else
    begin
      cumple := 0;
    end;
    num := num div 10;
  end;
  descomposicion_numero := cumple;
end;

procedure maximos(v: vector; diml: integer; var nom1: string; var nom2: string; var ape1: string; var ape2: string);
var
  i: integer;
  edad: integer;
  max1: integer;
  max2: integer;
begin
  max1 := -1;
  max2 := -1;
  for i := 1 to diml do
  begin
    edad := 2020 - v[i].anio;
    if (edad > max1) then
    begin
      max2 := max1;
      nom2 := nom1;
      ape2 := ape1;
      max1 := edad;
      nom1 := v[i].nombre;
      ape1 := v[i].apellido;
    end
    else
    begin
      if (edad > max2) then
      begin
        max2 := edad;
        nom2 := v[i].nombre;
        ape2 := v[i].apellido;
      end;
    end;
  end;
end;

procedure recorrer_vector(v: vector; diml: integer);
var
  i: integer;
  nom1: str;
  nom2: str;
  ape1: str;
  ape2: str;
  contador: integer;
begin
  contador := 0;
  for i := 1 to diml do
  begin
    contador := contador + descomposicion_numero(v[i].dni);
  end;
  maximos(v, diml, nom1, nom2, ape1, ape2);
  writeln('Apellido y nombre de los dos alumnos de mayor edad: ', nom1, ' ', ape1, ' y ', nom2, ' ', ape2);
  writeln('El porcentaje de alumnos con DNI compuesto solo por digitos pares ', (contador / 100 * diml):0:2);
end;

//PROGRAMA PRINCIPAL
var
  v: vector;
  diml: integer;
begin
  diml := 0;
  cargar_vector(v, diml);
  imprimir_vector(v, diml);
  recorrer_vector(v, diml);
end.

  

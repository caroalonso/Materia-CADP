{8.Realizar un programa que lea y almacene la información de 10 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020.
De cada alumno se lee:
nro de inscripción
DNI
apellido
nombre
año de nacimiento.

Una vez leída y almacenada toda la información, calcular e informar:

a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.
}

program punto8;
const
  dimf = 10;

type
  str = string[5];
  rango = 1..dimf;

  alumnos = record
    num: integer;
    dni: integer;
    nombre: str;
    apellido: str;
    anio: integer;
  end;

  vector = array[rango] of alumnos;

// PROCESOS
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
  a.num := random(999) + 1;
  a.dni := random(99) + 100;
  randomString(4, a.nombre);
  randomString(4, a.apellido);
  writeLn('ingrese anio de nacimiento:');
  readln(a.anio);
end;

procedure cargar_vector(var v: vector);
var
  i: integer;
  alu: alumnos;
begin
  for i := 1 to dimf do begin
    leer_alumno(alu);
    v[i] := alu;
  end;
  WriteLn('finalizacion de carga de alumnos');
end;

procedure imprimir_vector(v: vector);
var
  i: integer;
begin
  writeln('vector de alumnos:');
  for i := 1 to dimf do begin
    writeln(i, ') NUMERO: ', v[i].num, ' DNI: ', v[i].dni, ' APELLIDO: ', v[i].apellido, ' NOMBRE: ', v[i].nombre, ' ANIO: ', v[i].anio);
  end;
end;

function descomposicion_numero(dni: integer): integer;
var
  dig: integer;
  cumple: integer;
begin
  cumple := 1;
  while (dni <> 0) do begin
    dig := dni mod 10;
    if (dig mod 2 <> 0) then begin
      cumple := 0;  // Si se encuentra un dígito impar, no cumple con la condición
    end;
    dni := dni div 10;
  end;
  descomposicion_numero := cumple;
end;

procedure maximos(v: vector; var nom1: string; var nom2: string; var ape1: string; var ape2: string);
var
  i: integer;
  edad: integer;
  max1, max2: integer;
begin
  max1 := -1;
  max2 := -1;
  for i := 1 to dimf do begin
    edad := 2020 - v[i].anio;  // Año actual (2020) menos el año de nacimiento
    if (edad > max1) then begin
      max2 := max1;
      ape2 := ape1;
      nom2 := nom1;
      max1 := edad;
      ape1 := v[i].apellido;
      nom1 := v[i].nombre;
    end
    else if (edad > max2) then begin
      max2 := edad;
      ape2 := v[i].apellido;
      nom2 := v[i].nombre;
    end;
  end;
end;

procedure recorrer_vector(v: vector);
var
  i: integer;
  nom1, nom2, ape1, ape2: string;
  contador: integer;
begin
  contador := 0;
  for i := 1 to dimf do begin
    contador := contador + descomposicion_numero(v[i].dni);
  end;
  maximos(v, nom1, nom2, ape1, ape2);
  writeln('Apellido y nombre de los 2 alumnos de mayor edad: ', nom1, ' ', ape1, ' y ', nom2, ' ', ape2);
  writeln('El porcentaje de alumnos con DNI compuesto solo por dígitos pares: ', (contador / dimf) * 100:0:2, '%');
end;

// PROGRAMA PRINCIPAL
var
  v: vector;
begin
  randomize;
  cargar_vector(v);
  imprimir_vector(v);
  recorrer_vector(v);
end.

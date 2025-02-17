{La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. 
Para ello, debe realizar un programa que lea y almacene información sobre las computadoras con este sistema
operativo (a lo sumo 10.000). 
De cada computadora se conoce:
código de computadora, 
la versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), 
la cantidad de paquetes instalados 
y la cantidad de cuentas de usuario que poseen.
La información debe almacenarse ordenada por código de computadora de manera
ascendente. 
La lectura finaliza al ingresar el código de computadora -1, que no debe procesarse. 
Una vez almacenados todos los datos, se pide:
a) Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b) Informar el promedio de cuentas de usuario por computadora.
c) Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d) Eliminar la información de las computadoras con código entre 0 y 500.}

program UbuntuStats;
const
  MAX_COMPUTADORAS = 10000; // Cantidad máxima de computadoras

type
  str = string[20];

  // Registro que almacena la información de cada computadora
  computadora = record
    codigo: integer;
    version: str;
    paquetes: integer;
    cuentas: integer;
  end;

  // Vector de computadoras
  vector = array[1..MAX_COMPUTADORAS] of computadora;

var
  computadoras: vector;
  diml: integer;  // Cantidad de computadoras cargadas

// Procedimiento para leer los datos de una computadora
procedure leer_computadora(var c: computadora);
begin
  writeln('Ingrese el código de la computadora:');
  readln(c.codigo);
  if c.codigo = -1 then
    exit;  // Terminar la lectura si el código es -1
  writeln('Ingrese la versión de Ubuntu (ej. 18.04, 17.10):');
  readln(c.version);
  writeln('Ingrese la cantidad de paquetes instalados:');
  readln(c.paquetes);
  writeln('Ingrese la cantidad de cuentas de usuario:');
  readln(c.cuentas);
end;

// Procedimiento para cargar la información de las computadoras
procedure cargar_computadoras(var v: vector; var diml: integer);
var
  c: computadora;
begin
  diml := 0;
  while true do
  begin
    leer_computadora(c);
    if c.codigo = -1 then
      break;
    diml := diml + 1;
    v[diml] := c;
  end;
end;

// 1. Cantidad de computadoras que usan las versiones 18.04 o 16.04
procedure computadoras_version_18_04_o_16_04(var v: vector; diml: integer);
var
  i, contador: integer;
begin
  contador := 0;
  for i := 1 to diml do
  begin
    if (v[i].version = '18.04') or (v[i].version = '16.04') then
      contador := contador + 1;
  end;
  writeln('Cantidad de computadoras que utilizan las versiones 18.04 o 16.04: ', contador);
end;

// 2. Promedio de cuentas de usuario por computadora
procedure promedio_cuentas_usuario(var v: vector; diml: integer);
var
  i, total_cuentas: integer;
  promedio: real;
begin
  total_cuentas := 0;
  for i := 1 to diml do
    total_cuentas := total_cuentas + v[i].cuentas;

  promedio := total_cuentas / diml;
  writeln('Promedio de cuentas de usuario por computadora: ', promedio:0:2);
end;

// 3. Versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados
procedure version_con_mayor_paquetes(var v: vector; diml: integer);
var
  i, max_paquetes, index_max: integer;
begin
  max_paquetes := -1;  // Inicializar con un valor bajo
  index_max := 0;
  for i := 1 to diml do
  begin
    if v[i].paquetes > max_paquetes then
    begin
      max_paquetes := v[i].paquetes;
      index_max := i;
    end;
  end;
  writeln('La versión de Ubuntu con mayor cantidad de paquetes instalados es: ', v[index_max].version);
end;

// 4. Eliminar computadoras con código entre 0 y 500
procedure eliminar_computadoras(var v: vector; var diml: integer);
var
  i, j: integer;
begin
  j := 1;
  for i := 1 to diml do
  begin
    if (v[i].codigo < 0) or (v[i].codigo > 500) then
    begin
      v[j] := v[i];
      j := j + 1;
    end;
  end;
  diml := j - 1;
end;

// Programa principal
begin
  diml := 0;
  cargar_computadoras(computadoras, diml);

  // Procesar la información y realizar los cálculos solicitados
  computadoras_version_18_04_o_16_04(computadoras, diml);
  promedio_cuentas_usuario(computadoras, diml);
  version_con_mayor_paquetes(computadoras, diml);
  eliminar_computadoras(computadoras, diml);
  
  writeln('Número de computadoras restantes después de eliminar las de código entre 0 y 500: ', diml);
end.

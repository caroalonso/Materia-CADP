{Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la
administración de transferencias de dinero entre cuentas bancarias, efectuadas entre los meses de
Enero y Noviembre del año 2018.
El banco DISPONE de una lista de transferencias realizadas entre Enero y Noviembre del 2018. 
De cada transferencia se conoce:

número de cuenta origen, 
DNI de titular de cuenta origen, //a
número de cuenta destino,
DNI de titular de cuenta destino, //a
fecha,
hora,
monto ,
y el código del motivo de la transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura NO posee orden alguno.
Se pide:

a) Generar una nueva estructura que contenga sólo las transferencias a terceros(son aquellas en las que las cuentas origen y 
destino no pertenecen al mismo titular).
Esta nueva estructura debe estar ordenada por número de cuenta origen.

Una vez generada la estructura del inciso a), utilizar dicha estructura para:

b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.}

program _listas_repaso;
const
  dimf = 7;
type
  str = string[30];
  rango = 1..dimf;
  vector = array[rango] of integer;

  fechas = record
    dia: integer;
    mes: str;
    anio: integer;
  end;

  tiempo = record
    hora: integer;
    minutos: integer;
  end;

  transferencias = record
    num_cuenta_origen: integer;
    dni_titular_origen: integer;
    num_cuenta_destino: integer;
    dni_titular_destino: integer;
    fecha: fechas;
    hora: tiempo;
    monto: real;
    motivo: rango;
  end;

  lista = ^nodo;

  nodo = record
    elem: transferencias;
    sig: lista;
  end;

procedure inicializar_vec(var v: vector);
var
  i: integer;
begin
  for i := 1 to dimf do
    v[i] := 0;
end;

procedure cargar_lista(var l: lista); // ya se dispone
begin
  // Aquí cargan las transferencias (esta parte se deja como está)
end;

procedure agregar_ordenado(var l2: lista; dato: transferencias);
var
  nue: lista;
  ant: lista;
  act: lista;
begin
  new(nue);
  nue^.elem := dato;
  nue^.sig := nil;

  if (l2 = nil) then
    l2 := nue
  else
  begin
    ant := l2;
    act := l2;
    while (act <> nil) and (act^.elem.num_cuenta_origen < nue^.elem.num_cuenta_origen) do
    begin
      ant := act;
      act := act^.sig;
    end;
    if (act = l2) then
    begin
      nue^.sig := l2;
      l2 := nue;
    end
    else
    begin
      ant^.sig := nue;
      nue^.sig := act;
    end;
  end;
end;

procedure generar_lista_nueva(l: lista; var l2: lista);
begin
  while (l <> nil) do
  begin
    if (l^.elem.dni_titular_origen <> l^.elem.dni_titular_destino) then
      agregar_ordenado(l2, l^.elem);
    l := l^.sig;
  end;
end;

procedure maximo(l: lista; ve: vector; var cod: integer; var max: integer);
var
  i: integer;
begin
  for i := 1 to dimf do
  begin
    if (ve[i] > max) then
    begin
      max := ve[i];
      cod := i; // Correcto, se asigna el código del motivo
    end;
  end;
end;

function mas_impares(num: integer): boolean;
var
  dig, par, impar: integer;
begin
  par := 0;
  impar := 0;
  while (num <> 0) do
  begin
    dig := num mod 10;
    if (dig mod 2 = 0) then
      par := par + 1
    else
      impar := impar + 1;
    num := num div 10;
  end;
  mas_impares := impar > par;
end;

function ok(trans: transferencias): integer;
begin
  if (trans.fecha.mes = 'junio') and (mas_impares(trans.num_cuenta_destino)) then
    ok := 1
  else
    ok := 0;
end;

procedure procesar_info(l2: lista; var vec: vector);
var
  max, cod_max, aux_cuenta: integer;
  total, total_terceros: real;
begin
  total_terceros := 0;
  max := -1;
  while (l2 <> nil) do
  begin
    aux_cuenta := l2^.elem.num_cuenta_origen;
    total := 0;
    while (l2 <> nil) and (aux_cuenta = l2^.elem.num_cuenta_origen) do
    begin
      vec[l2^.elem.motivo] := vec[l2^.elem.motivo] + 1;
      total := total + l2^.elem.monto;
      total_terceros := total_terceros + ok(l2^.elem);
      l2 := l2^.sig; // Necesario para avanzar en la lista
    end;
    writeln('Total transferido por cuenta origen ', aux_cuenta, ': ', total:0:2); // b
  end;
  maximo(l2, vec, cod_max, max);
  writeln('Código de motivo con más transferencias a terceros: ', cod_max); // c
  writeln('Total de transferencias a terceros en Junio con menos dígitos pares que impares: ', total_terceros:0:0); // d
end;

var
  l: lista;
  l2: lista;
  ve: vector;
begin
  l := nil;
  l2 := nil;
  inicializar_vec(ve);
  cargar_lista(l); // ya se dispone;
  generar_lista_nueva(l, l2);
  procesar_info(l2, ve);
end.


{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes.
Para ello, cuenta con información sobre todos los viajes realizados durante el mes de marzo.
De cada viaje se cuenta con la siguiente información:
-día del mes (de 1 a 31)
-monto de dinero transportado
-distancia recorrida por el camión (medida en kilómetros).

a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200).
La lectura finaliza cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.

b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.

c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida sea igual a 100 km.

Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program vectores;
const
  dimf = 200;

type
  rango = 1..dimf;
  mes = 1..31;

  viajes = record
    distancia: real;
    dia: mes;
    monto: real;
  end;

  vector = array[rango] of viajes;
  vector_dias = array[mes] of integer;

//módulos

procedure inicializar_vector_dias(var ve: vector_dias);
var
  i: integer;
begin
  for i := 1 to 31 do
  begin
    ve[i] := 0;
  end;
end;

procedure leer_viajes(var vi: viajes);
begin
  readln(vi.distancia);
  if (vi.distancia <> 0) then
  begin
    readln(vi.dia);
    readln(vi.monto);
  end;
end;

procedure A_cargar_vector(var v: vector; var diml: integer);
var
  vi: viajes;
begin
  leer_viajes(vi);
  while (diml < dimf) and (vi.distancia <> 0) do
  begin
    diml := diml + 1;
    v[diml] := vi;
    leer_viajes(vi);
  end;
end;

procedure minimo(viaje: viajes; var min: real; var distancia_minimo: real; var dia_minimo: mes);
begin
  if (viaje.monto < min) then
  begin
    min := viaje.monto;
    distancia_minimo := viaje.distancia;
    dia_minimo := viaje.dia;
  end;
end;

procedure imprimir(ve: vector_dias);
var
  i: integer;
begin
  for i := 1 to 31 do
  begin
    writeln('Para el día ', i, ' se realizaron: ', ve[i], ' viajes.');
  end;
end;

procedure B_informe(v: vector; diml: integer; var ve: vector_dias);
var
  i: integer;
  suma_monto_total: real;
  distancia_minimo: real;
  dia_minimo: mes;
  min: real;
begin
  suma_monto_total := 0;
  min := MaxInt; // Se establece un valor suficientemente grande
  for i := 1 to diml do
  begin
    suma_monto_total := suma_monto_total + v[i].monto;
    minimo(v[i], min, distancia_minimo, dia_minimo);
    ve[v[i].dia] := ve[v[i].dia] + 1;
  end;
  writeln('El monto promedio transportado de los viajes realizados: ', (suma_monto_total / diml):0:2);
  writeln('La distancia recorrida en el viaje que transportó menos dinero: ', distancia_minimo:0:2);
  writeln('El día del mes en que se realizó el viaje que transportó menos dinero: ', dia_minimo);
  imprimir(ve);
end;

procedure eliminar(var v: vector; diml: integer; pos: integer);
var
  i: integer;
begin
  for i := pos to diml - 1 do
  begin
    v[i] := v[i + 1];
  end;
end;

procedure C_eliminar_cien(var v: vector; var diml: integer);
var
  pos: integer;
begin
  pos := 1;
  while (pos <= diml) do
  begin
    if (v[pos].distancia = 100) then
    begin
      eliminar(v, diml, pos);
      diml := diml - 1;
    end
    else
      pos := pos + 1;
  end;
end;

//programa principal
var
  diml: integer;
  ve: vector_dias;
  v: vector;
begin
  diml := 0;
  inicializar_vector_dias(ve);
  A_cargar_vector(v, diml);
  B_informe(v, diml, ve);
  C_eliminar_cien(v, diml);
end.


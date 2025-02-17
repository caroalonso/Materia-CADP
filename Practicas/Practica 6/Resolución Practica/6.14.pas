{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a alumnos de la UNLP. 

Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por una muestra de 1300 alumnos durante
el mes de marzo.
De cada viaje se conoce:
el código de alumno (entre 1 y 1300).
día del mes. 
Facultad a la que pertenece.
y medio de transporte (1. colectivo urbano; 2. colectivo interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta).

Tener en cuenta que un alumno puede utilizar más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.

Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de datos apropiada. 
La lectura finaliza al ingresarse el código de alumno 0, que no debe procesarse.

Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día.
b. La cantidad de alumnos que gastan en transporte más de $80 por día.
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

program listaas;
type
  rango_viajes = 0..1300; // viajes
  dia_mes = 1..31;

  vector_precios = array [1..5] of real; // vector de precios de cada viaje.

  viajes = record
    cod: rango_viajes;
    dia: dia_mes;
    transporte: 1..5;
  end;

  lista = ^nodo;

  nodo = record
    elem: viajes;
    sig: lista;
  end;

  // Estructura para almacenar la cantidad de viajes por alumno
  vector_viajes_por_alumno = array [rango_viajes] of integer;

  // Estructura para almacenar el total gastado por cada alumno
  vector_gasto_por_alumno = array [rango_viajes] of real;

  // Variables auxiliares
  contador_transporte = array [1..5] of integer;
  alumnos_viajan_bicicleta = array [rango_viajes] of boolean;

  // PROCESOS

procedure inicializar_precio(var v_p: vector_precios); // ya se dispone.
begin
  // Ejemplo de inicialización de precios
  v_p[1] := 10.0; // Colectivo urbano
  v_p[2] := 15.0; // Colectivo interurbano
  v_p[3] := 7.0;  // Tren universitario
  v_p[4] := 8.0;  // Tren Roca
  v_p[5] := 5.0;  // Bicicleta
end;

procedure leer_viaje(var vi: viajes);
begin
  writeln('ingrese numero codigo de alumno: (termina con codigo 0)');
  readln(vi.cod);
  if (vi.cod <> 0) then begin 
    writeln('ingrese numero de transporte del 1..5:');
    readln(vi.transporte);
  end;
end;

procedure agregar_ordenado(var l: lista; v: viajes);
var
  nue, ant, act: lista;
begin
  new(nue);
  nue^.elem := v;
  nue^.sig := nil;

  if (l = nil) then begin
    l := nue;  // primer nodo de la lista vacía.
  end else begin
    ant := l;
    act := l;
    while (act <> nil) and ((act^.elem.cod < v.cod) or ((act^.elem.cod = v.cod) and (act^.elem.dia < v.dia))) do begin
      ant := act;
      act := act^.sig;
    end;
    if (act = l) then begin
      nue^.sig := l;
      l := nue;
    end else begin
      ant^.sig := nue;
      nue^.sig := act;
    end;
  end;
end;


procedure procesar_viajes(var l: lista; var v_p: vector_precios; 
                          var vec_viajes: vector_viajes_por_alumno; 
                          var vec_gastos: vector_gasto_por_alumno;
                          var cnt_transporte: contador_transporte;
                          var alumnos_bici: alumnos_viajan_bicicleta);
var
  act: lista;
  alumno_cod: rango_viajes;
begin
  act := l;
  while (act <> nil) do begin
    alumno_cod := act^.elem.cod;
    vec_viajes[alumno_cod] := vec_viajes[alumno_cod] + 1;
    vec_gastos[alumno_cod] := vec_gastos[alumno_cod] + v_p[act^.elem.transporte];
    cnt_transporte[act^.elem.transporte] := cnt_transporte[act^.elem.transporte] + 1;

    if (act^.elem.transporte = 5) then // Bicicleta
      alumnos_bici[alumno_cod] := true;

    act := act^.sig;
  end;
end;

procedure imprimir_a( vector_viajes: vector_viajes_por_alumno);
var
  i, contador: integer;
begin
  contador := 0;
  for i := 1 to 1300 do begin
    if (vector_viajes[i] > 6) then
      contador := contador + 1;
  end;
  writeln('Cantidad de alumnos que realizan mas de 6 viajes por dia: ', contador);
end;

procedure imprimir_b(vector_gastos: vector_gasto_por_alumno);
var
  i, contador: integer;
begin
  contador := 0;
  for i := 1 to 1300 do begin
    if (vector_gastos[i] > 80.0) then
      contador := contador + 1;
  end;
  writeln('Cantidad de alumnos que gastan mas de $80 por dia: ', contador);
end;

procedure imprimir_c(cnt_transporte: contador_transporte);
var
  i, max1, max2, tipo_max1, tipo_max2: integer;
begin
  max1 := 0;
  max2 := 0;
  tipo_max1 := -1;  // Inicializar tipo_max1
  tipo_max2 := -1;  // Inicializar tipo_max2
  for i := 1 to 5 do begin
    if (cnt_transporte[i] > max1) then begin
      max2 := max1;
      max1 := cnt_transporte[i];
      tipo_max2 := tipo_max1;
      tipo_max1 := i;
    end else if (cnt_transporte[i] > max2) then begin
      max2 := cnt_transporte[i];
      tipo_max2 := i;
    end;
  end;
  writeln('Los dos medios de transporte mas utilizados son: ', tipo_max1, ' y ', tipo_max2);
end;

procedure imprimir_d(alumnos_bici: alumnos_viajan_bicicleta);
var
  i, contador: integer;
begin
  contador := 0;
  for i := 1 to 1300 do begin
    if (alumnos_bici[i]) then
      contador := contador + 1;
  end;
  writeln('Cantidad de alumnos que combinan bicicleta con otro medio de transporte: ', contador);
end;

// PROGRAMA PRINCIPAL
var
  l1: lista;
  vec_p: vector_precios;
  viaje: viajes;
  vec_viajes: vector_viajes_por_alumno;
  vec_gastos: vector_gasto_por_alumno;
  cnt_transporte: contador_transporte;
  alumnos_bici: alumnos_viajan_bicicleta;
begin
  l1 := nil;
  inicializar_precio(vec_p);  // ya se dispone
  fillchar(vec_viajes, sizeof(vec_viajes), 0); // Inicializar el vector de viajes
  fillchar(vec_gastos, sizeof(vec_gastos), 0); // Inicializar el vector de gastos
  fillchar(cnt_transporte, sizeof(cnt_transporte), 0); // Inicializar contador de transportes
  fillchar(alumnos_bici, sizeof(alumnos_bici), false); // Inicializar alumnos que viajan en bicicleta
  
  leer_viaje(viaje);
  while (viaje.cod <> 0) do begin 
    agregar_ordenado(l1, viaje);
    leer_viaje(viaje);
  end;

  procesar_viajes(l1, vec_p, vec_viajes, vec_gastos, cnt_transporte, alumnos_bici);
  imprimir_a(vec_viajes);  // Imprimir alumnos con más de 6 viajes
  imprimir_b(vec_gastos);  // Imprimir alumnos que gastan más de $80
  imprimir_c(cnt_transporte); // Imprimir los dos transportes más utilizados
  imprimir_d(alumnos_bici);  // Imprimir alumnos que combinan bicicleta
end.
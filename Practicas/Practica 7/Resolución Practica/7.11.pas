{11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales.
 De cada evento SE DISPONE la siguiente información: 
 nombre del evento, 
 tipo de evento (1: música, 2: cine, 3:obra de teatro, 4: unipersonal y 5: monólogo), 
 lugar del evento, 
 cantidad máxima de personas permitidaspara el evento y 
 costo de la entrada. 
 
Se pide:

1. Generar una estructura con las ventas de entradas para tales eventos culturales. 
De cada venta se debe guardar: 
código de venta, 
número de evento (1..100), 
DNI del comprador 
y cantidad de entradas adquiridas. 

La lectura de las ventas finaliza con código de venta -1.

2. Una vez LEIDA y ALMACENADA la información de las VENTAS, calcular e informar:

a. El nombre y lugar de los dos eventos que han tenido menos recaudación.

b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.

c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.}

program listas_repaso;
const
  dimf = 100;
  dimf_5 = 5;
type
  str = string[30];
  rango_100 = 1..dimf;
  rango_5 = 1..dimf_5;

  vector_categoria = array[rango_5] of string;

  eventos = record
    nombre: str;
    tipo: rango_5;
    lugar: str;
    cant_personas: integer;
    costo_entrada: real;
  end;

  vector_eventos = array[rango_100] of eventos;

  ventas = record
    cod_venta: integer;
    num_evento: rango_100;
    dni: integer;
    cant_entradas: integer;
  end;

  lista = ^nodo;

  nodo = record
    elem: ventas;
    sig: lista;
  end;

{ Procesos }

procedure cargar_categorias(var ve_categorias: vector_categoria); // ya se dispone
begin
  // Cargar categorías
end;

procedure cargar_vector(vec_eventos: vector_eventos); // ya se dispone
begin
  // Cargar eventos
end;

procedure leer_ventas(var ve: ventas);
begin
  readln(ve.cod_venta);
  if (ve.cod_venta <> -1) then begin
    readln(ve.num_evento);
    readln(ve.dni);
    readln(ve.cant_entradas);
  end;
end;

procedure agregar_ordenado(var l: lista; dato: ventas);
var
  nue: lista;
  ant, act: lista;
begin
  new(nue);
  nue^.elem := dato;
  nue^.sig := nil;
  ant := l;
  act := l;
  while (act <> nil) and (act^.elem.num_evento < nue^.elem.num_evento) do begin
    ant := act;
    act := act^.sig;
  end;

  if (l = nil) then begin
    l := nue;
  end
  else begin
    if (act = l) then begin
      nue^.sig := l;
      l := nue;
    end
    else begin
      ant^.sig := nue;
      nue^.sig := act;
    end;
  end;
end;

procedure cargar_lista(var l: lista);
var
  ve: ventas;
begin
  leer_ventas(ve);
  while (ve.cod_venta <> -1) do begin
    agregar_ordenado(l, ve);
    leer_ventas(ve);
  end;
end;

procedure maximo(eve: eventos; recaudacion: real; var min1: real; var min2: real; var nom1: str; var nom2: str; var lugar1: str; var lugar2: str);
begin
  if (recaudacion < min1) then begin
    min2 := min1;
    nom2 := nom1;
    lugar2 := lugar1;
    min1 := recaudacion;
    nom1 := eve.nombre;
    lugar1 := eve.lugar;
  end
  else if (recaudacion < min2) then begin
    min2 := recaudacion;
    nom2 := eve.nombre;
    lugar2 := eve.lugar;
  end;
end;

function paras(dni: integer): boolean;
var
  cumple: boolean;
  dig: integer;
  pares: integer;
  impares: integer;
begin
  cumple := false;
  pares := 0;
  impares := 0;
  while (dni <> 0) do begin
    dig := dni mod 10;
    if (dig mod 2 = 0) then begin
      pares := pares + 1;
    end
    else begin
      impares := impares + 1;
    end;
    dni := dni div 10;
  end;

  if (pares > impares) then begin
    cumple := true;
  end;

  paras := cumple;
end;

procedure procesar_info(v: vector_eventos; l: lista; vec_cat: vector_categoria);
var
  min1, min2, recaudacion: real;
  nom1, nom2, lugar1, lugar2: str;
  aux_cod, cant_entradas_b, cant_entradas_c: integer;
begin
  min1 := 9999;
  min2 := 9999;
  cant_entradas_b := 0;
  cant_entradas_c := 0;

  while (l <> nil) do begin
    aux_cod := l^.elem.num_evento;
    recaudacion := 0;
    while (l <> nil) and (aux_cod = l^.elem.num_evento) do begin
      recaudacion := recaudacion + l^.elem.cant_entradas * v[aux_cod].costo_entrada;
      if (paras(l^.elem.dni)) and (vec_cat[v[l^.elem.num_evento].tipo] = 'obra de teatro') then begin
        cant_entradas_b := cant_entradas_b + l^.elem.cant_entradas;
      end;
      if (l^.elem.num_evento = 50) and (l^.elem.cant_entradas = v[l^.elem.num_evento].cant_personas) then begin
        cant_entradas_c := cant_entradas_c + 1;
      end;
      l := l^.sig;
    end;

    maximo(v[aux_cod], recaudacion, min1, min2, nom1, nom2, lugar1, lugar2);
  end;

  writeln(nom1, nom2, lugar1, lugar2);  { A }
  writeln(cant_entradas_b);             { B }
  writeln(cant_entradas_c);             { C }
end;

// Programa principal
var
  l: lista;
  ve_categorias: vector_categoria;
  vec_eventos: vector_eventos;
begin
  l := nil;
  cargar_categorias(ve_categorias); { ya se dispone }
  cargar_vector(vec_eventos);       { ya se dispone }
  cargar_lista(l);
  procesar_info(vec_eventos, l, ve_categorias);
end.


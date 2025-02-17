{12. El centro de deportes Fortaco’s quiere procesar la información de los 
4 tipos de suscripciones que ofrece: 
1)Musculación
2)Spinning
3)Cross Fit
4)Todas las clases. 
Para ello, el centro DISPONE de una tabla con información sobre el costo mensual de cada tipo de suscripción.

Realizar un programa que LEA y ALMACENE la información de los clientes del centro.
De cada cliente se conoce :
el nombre,
DNI,
edad
y tipo de suscripción contratada (valor entre 1 y 4). 
Cada cliente tiene una sola suscripción. 

La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.

UNA VEZ ALMACENADOS todos los datos, procesar la estructura de datos generada, calcular e informar:

- La ganancia total de Fortaco’s.

- Las 2 suscripciones con más clientes.

- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.}

program listas_repaso;
const
  dimf = 4;
type
  rango = 1..dimf;
  str = string[40];
  
  sub = record
    tipo: str;
    monto: real;
  end;  
  
  vector = array [rango] of sub;
  
  vector_contador = array [rango] of integer;
  
  clientes = record
    nombre: str;
    dni: integer;
    edad: integer;
    tipo_sub: rango;
  end;
  
  nom_dni = record
    nombre: str;
    dni: integer;
  end;
  
  lista = ^nodo;
  
  nodo = record
    elem: clientes;
    sig: lista;
  end;
  
  lista2 = ^dato;
  
  dato = record
    elemento: nom_dni;
    sig: lista2;
  end;

// Procesos

procedure cargar_vector(var v: vector); 
begin
  v[1].tipo := 'Musculación'; v[1].monto := 100.0;
  v[2].tipo := 'Spinning'; v[2].monto := 150.0;
  v[3].tipo := 'CrossFit'; v[3].monto := 200.0;
  v[4].tipo := 'Todas las clases'; v[4].monto := 250.0;
end;

procedure inicializar_vector_contador(var ve: vector_contador); 
var
  i: integer;
begin
  for i := 1 to dimf do
    ve[i] := 0;
end;

procedure agregar_cliente(var l: lista; cli: clientes);
var
  nue: lista;
begin
  new(nue);
  nue^.elem := cli;
  nue^.sig := l;
  l := nue;
end; 

procedure leer(var c: clientes);
begin
  readln(c.dni);
  if c.dni <> 0 then begin
    readln(c.nombre);
    readln(c.edad);
    readln(c.tipo_sub);
  end;
end;    

procedure leer_clientes(var l: lista);
var
  c: clientes;
begin
  leer(c);
  while c.dni <> 0 do begin
    agregar_cliente(l, c);
    leer(c);
  end;
end;  

procedure maximos(ve: vector_contador; vec: vector);
var
  max1, max2, num1, num2, i: integer;
begin
  max1 := -1;
  max2 := -1;
  for i := 1 to dimf do begin
    if ve[i] > max1 then begin
      max2 := max1;
      max1 := ve[i];
      num2 := num1;
      num1 := i;
    end
    else if ve[i] > max2 then begin
      max2 := ve[i];
      num2 := i;
    end;
  end;
  writeln('Las 2 suscripciones con más clientes: ', vec[num1].tipo, ', ', vec[num2].tipo);
end;

procedure agregar_ordenado(var l2: lista2; nombre: str; dni: integer);
var
  act, ant, nue: lista2;
begin
  new(nue);
  nue^.elemento.nombre := nombre;
  nue^.elemento.dni := dni;
  nue^.sig := nil;

  if l2 = nil then begin
    l2 := nue;
  end
  else begin   
    ant := l2;
    act := l2;
    while (act <> nil) and (act^.elemento.dni < nue^.elemento.dni) do begin
      ant := act;
      act := act^.sig;
    end;
    if l2 = act then begin
      nue^.sig := l2;
      l2 := nue;
    end
    else begin
      ant^.sig := nue;
      nue^.sig := act;
    end;
  end;
end;   

function cumple(edad: integer; sub: integer; vect: vector): boolean;  
var    
  ok: boolean;
begin
  ok := false;
  if edad > 40 then begin
    if (vect[sub].tipo = 'CrossFit') or (vect[sub].tipo = 'Todas las clases') then begin
      ok := true;
    end;  
  end;
  cumple := ok;
end;        

procedure procesar_info(l: lista; var l2: lista2; v: vector; var v_c: vector_contador);
var
  total_fortacos: real;
begin
  total_fortacos := 0;
  while l <> nil do begin
    total_fortacos := total_fortacos + v[l^.elem.tipo_sub].monto;
    v_c[l^.elem.tipo_sub] := v_c[l^.elem.tipo_sub] + 1;
    if cumple(l^.elem.edad, l^.elem.tipo_sub, v) then
      agregar_ordenado(l2, l^.elem.nombre, l^.elem.dni);
    l := l^.sig;
  end;
  writeln('Ganancia total de Fortaco’s: ', total_fortacos:0:2);
  maximos(v_c, v);
end;  

// Programa principal
var
  l: lista;
  l2: lista2;
  vec: vector;
  v_c: vector_contador;
begin
  l := nil;
  l2 := nil;
  cargar_vector(vec); 
  inicializar_vector_contador(v_c); 
  leer_clientes(l);
  procesar_info(l, l2, vec, v_c);
end.


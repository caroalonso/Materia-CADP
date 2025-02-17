{Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. 
De cada empresa se conoce:
su código,
nombre, 
si es estatal o privada,
nombre de la ciudad donde está radicada 
y los cultivos que realiza (a lo sumo 20). 
Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.),
cantidad de hectáreas dedicadas 
y la cantidad de meses que lleva el ciclo de cultivo.

a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). 

Para cada empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.  // ASUMO QUE POR EMPRESA .
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program listas_repaso;

const
  dimf = 20;
  
type
  rango = 1..dimf;
  str = string[40];
  
  culti = record
    tipo: str;
    cant_hec: integer;
    cant_meses: integer;
  end;
  
  vector = array[rango] of culti;
  
  empresa = record
    codigo: integer;
    nombre: str;
    estatal_privada: str;
    nombre_cuidad: str;
    cultivos: vector;
    dim: integer; 
  end;

  lista = ^nodo;

  nodo = record
    elem: empresa;
    sig: lista;
  end;

// Procesos

procedure leer_cultivos(var vec: vector; var diml: integer);
var
  cul: culti;
begin
  readln(cul.cant_hec);
  while (diml < dimf) and (cul.cant_hec <> 0) do begin
    diml := diml + 1;
    readln(cul.tipo);
    readln(cul.cant_meses);
    vec[diml] := cul;
    readln(cul.cant_hec);
  end;
end;

procedure leer_empresa(var e: empresa);
var
  diml: integer;
begin
  diml := 0;
  readln(e.codigo);
  if (e.codigo <> -1) then begin 
    readln(e.nombre);
    readln(e.estatal_privada);
    readln(e.nombre_cuidad); 
    leer_cultivos(e.cultivos, diml);
    e.dim := diml;
  end;
end;

procedure agregar_lista(var l: lista; e: empresa);
var
  nue: lista;
begin
  new(nue);
  nue^.elem := e;
  nue^.sig := l;
  l := nue;
end;

procedure cargar_info(var l: lista);
var
  em: empresa;
begin
  leer_empresa(em);
  while (em.codigo <> -1) do begin
    agregar_lista(l, em);
    leer_empresa(em);
  end;
end;

procedure buscar(vec: vector; dim: integer; var cumple: boolean; var aux: integer; palabra: str);
begin
  while (aux <= dim) and (not cumple) do begin
    if (vec[aux].tipo = palabra) then begin
      cumple := true;
    end
    else begin
      aux := aux + 1;
    end;  
  end;
end;

function dos_ceros(num: integer): boolean;
var
  cumple: boolean;
  dig: integer;
  contador: integer;
begin
  contador := 0;
  cumple := false;
  while (num <> 0) and (not cumple) do begin
    dig := num mod 10;
    if (dig = 0) then begin
      contador := contador + 1;
    end;
    if (contador = 2) then begin
      cumple := true;
    end
    else begin
      num := num div 10;
    end;
  end;
  dos_ceros := cumple;
end;

function B(l: lista): boolean;
var
  cumple: boolean;
  aux: integer;
  ok: boolean;
  palabra: str;
begin
  cumple := false;
  palabra := 'trigo';
  ok := false;
  aux := 1;
  if (l^.elem.nombre_cuidad = 'San Miguel del Monte') and (dos_ceros(l^.elem.codigo)) then begin
    buscar(l^.elem.cultivos, l^.elem.dim, ok, aux, palabra);
    if (ok) then begin
      cumple := true;
    end;
  end;
  B := cumple;  
end;

procedure maximo(emp: empresa; var max: integer; var empresa_max: str);
var
  aux: integer;
  cumple: boolean;
  palabra: str;
begin
  cumple := false;
  aux := 1;
  palabra := 'maiz';
  buscar(emp.cultivos, emp.dim, cumple, aux, palabra);
  if (cumple) and (emp.cultivos[aux].cant_meses > max) then begin
    max := emp.cultivos[aux].cant_meses;
    empresa_max := emp.nombre;
  end;
end;

procedure incremento(var emp: empresa);
var
  cumple: boolean;
  aux: integer;
  palabra: str;
begin
  cumple := false;
  palabra := 'girasol';
  aux := 1;
  if (emp.estatal_privada = 'privada') then begin
    buscar(emp.cultivos, emp.dim, cumple, aux, palabra); 
    if (cumple) and (emp.cultivos[aux].cant_hec < 5) then begin
      emp.cultivos[aux].cant_meses := emp.cultivos[aux].cant_meses + 1;        
    end;
  end;
end;

procedure punto_c(emp: empresa);
var
  cant_hec_totales: integer;
  cant_hec_soja: integer;
  promedio: real;
  i: integer;
begin
  cant_hec_totales := 0;
  cant_hec_soja := 0;
  for i := 1 to emp.dim do begin
    if (emp.cultivos[i].tipo = 'soja') then begin
      cant_hec_soja := cant_hec_soja + emp.cultivos[i].cant_hec;
    end
    else begin
      cant_hec_totales := cant_hec_totales + emp.cultivos[i].cant_hec;
    end;
  end;
  if cant_hec_totales > 0 then begin
    promedio := (cant_hec_soja * 100.0) / cant_hec_totales;
    writeln(promedio:0:2, '%');
  end
  else begin
    writeln('No hay hectáreas para calcular.');
  end;
end;

procedure procesar_info(l: lista);
var
  max: integer;
  empresa_max: str;
  palabra: str;
  aux: integer;
  cumple: boolean;
begin
  palabra := 'soja';
  max := -1;
  while (l <> nil) do begin
    if (B(l)) then begin
      writeln(l^.elem.nombre); // B
    end;
    incremento(l^.elem); // E
    maximo(l^.elem, max, empresa_max); // D
    cumple := false;
    aux := 1;
    buscar(l^.elem.cultivos, l^.elem.dim, cumple, aux, palabra);
    if (cumple) then begin
      punto_c(l^.elem);  //C
    end;
    l := l^.sig;
  end;
  writeln('La empresa que dedica más tiempo al maíz es: ', empresa_max); //D 
end;

// Programa principal
var
  l: lista;
begin
  l := nil;
  cargar_info(l); 
  procesar_info(l);
end.

 

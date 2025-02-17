{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de 2020. 
De cada viaje se conoce: 
número de viaje, 
código de auto, 
dirección de origen, 
dirección de destino 
y kilómetros recorridos durante el viaje. 

Esta información se encuentra ordenada por código de auto y para un mismo código de auto pueden existir 1 o más viajes. 
Se pide:

a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program lista_repaso;
type
  viajes = record
    num_viaje: integer;
    cod: integer;
    direccion: integer;
    direccion_des: integer;
    km: real;
  end;

  lista = ^nodo;

  nodo = record
    elem: viajes;
    sig: lista;
  end;


// Procesos
procedure cargar_datos(var l: lista); // ya se dispone
begin
end;

procedure maximos(aux_cod: integer; var max1: real; var max2: real; var cod1: integer; var cod2: integer; contador_km: real); 
begin
  if (contador_km > max1) then begin
    max2 := max1;
    max1 := contador_km;
    cod2 := cod1;
    cod1 := aux_cod;
  end
  else begin
    if (contador_km > max2) then begin
      max2 := contador_km;
      cod2 := aux_cod;
    end;
  end;
end;

procedure agregar_ordenado(var l2: lista; dato: viajes);
var
  nue: lista;
  ant: lista;
  act: lista;
begin
  new(nue);
  nue^.elem := dato;
  nue^.sig := nil;
  
  if (l2 = nil) then begin
    l2 := nue;
  end
  else begin
    ant := nil;
    act := l2;
    
    while (act <> nil) and (act^.elem.num_viaje < nue^.elem.num_viaje) do begin
      ant := act;
      act := act^.sig;
    end;
    
    if (ant = nil) then begin
      nue^.sig := l2;
      l2 := nue;
    end
    else begin
      ant^.sig := nue;
      nue^.sig := act;
    end;
  end;
end;

procedure procesar_info(l: lista; var l2: lista);
var
  aux_cod: integer;
  contador_km: real;
  max1: real;
  max2: real;
  cod1: integer;
  cod2: integer;
begin
  max1 := -1;  
  max2 := -1;  
  cod1 := -1;
  cod2 := -1;

  while (l <> nil) do begin
    aux_cod := l^.elem.cod;
    contador_km := 0;

    // Procesar todos los viajes con el mismo código de auto
    while (l <> nil) and (aux_cod = l^.elem.cod) do begin
      contador_km := contador_km + l^.elem.km;
      if (l^.elem.km > 5) then begin
        agregar_ordenado(l2, l^.elem);  // Agregar viajes mayores a 5 km
      end;
      l := l^.sig;
    end;
    
    maximos(aux_cod, max1, max2, cod1, cod2, contador_km);  // Actualizar los códigos de auto con más km
  end;

  // Informar los dos códigos de auto que más kilómetros recorrieron
  writeln('Los dos códigos de auto que más kilómetros recorrieron son: ', cod1, ' y ', cod2);
end;

// Programa principal
var
  l: lista;
  l2: lista;
begin
  l := nil;
  l2 := nil;
  cargar_datos(l); // Ya se dispone  
  procesar_info(l, l2);
end.



  

{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android 
DISPONE de información de todos los dispositivos que poseen sus juegos instalados.
De cada dispositivo se conoce:
la versión de Android instalada
el tamaño de la pantalla (en pulgadas) 
y la cantidad de memoria RAM que posee (medida en GB).

La información disponible se encuentra ordenada por versión de Android.

Realizar un programa que procese la información disponible de todos los dispositivos e informe:

a. La cantidad de dispositivos para cada versión de Android.

b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.

c. El tamaño promedio de las pantallas de todos los dispositivos.}

program listaas;
type
  str = string[30];

  dispositivos = record
    android: str;
    pantalla: integer;
    ram: integer;
  end;

  lista = ^nodo;

  nodo = record
    elem: dispositivos;
    sig: lista;
  end;

// PROCESOS

// Procedimiento para cargar la lista con dispositivos
procedure cargar_lista(var l: lista);
var
  d: dispositivos;
  aux: lista;
begin
  l := nil;
  writeln('Ingresar datos de dispositivos (android: version, pantalla: tamanio en pulgadas, ram: memoria en GB).');
  writeln('Para terminar ingrese "0" en la version de android.');
  repeat
    writeln('Ingresar version de android (0 para terminar):');
    readln(d.android);
    if d.android <> '0' then begin
      writeln('Ingresar tamanio de pantalla (en pulgadas):');
      readln(d.pantalla);
      writeln('Ingresar cantidad de memoria RAM (en GB):');
      readln(d.ram);
      
      new(aux);
      aux^.elem := d;
      aux^.sig := l;
      l := aux;
    end;
  until d.android = '0';
end;

// Función para contar dispositivos con más de 3 GB de RAM y pantallas de a lo sumo 5 pulgadas
function punto_b(dis: dispositivos): integer;
begin
  if (dis.ram > 3) and (dis.pantalla <= 5) then
    punto_b := 1
  else
    punto_b := 0;
end;

// Procedimiento para procesar la información de los dispositivos
procedure proceso_info(l: lista);
var
  version_android_aux: str;
  contador_b: integer;
  contador_android: integer;
  total_dispositivos: integer;
  pantallas: integer;
begin
  pantallas := 0;
  total_dispositivos := 0;
  contador_b := 0;
  while (l <> nil) do begin
    version_android_aux := l^.elem.android;
    contador_android := 0;

    // Contar dispositivos de la misma versión de Android
    while (l <> nil) and (version_android_aux = l^.elem.android) do begin
      total_dispositivos := total_dispositivos + 1;
      contador_android := contador_android + 1;
      contador_b := contador_b + punto_b(l^.elem);
      pantallas := pantallas + l^.elem.pantalla;
      l := l^.sig;
    end;
    
    // Mostrar la cantidad de dispositivos para esta versión
    writeln('Version Android ', version_android_aux, ': ', contador_android, ' dispositivos.');
  end;

  // Mostrar resultados finales
  writeln('Cantidad de dispositivos con mas de 3 GB de RAM y pantallas de a lo sumo 5 pulgadas: ', contador_b);
  if total_dispositivos > 0 then
    writeln('Tamanio promedio de las pantallas: ', pantallas / total_dispositivos:0:2)
  else
    writeln('No se procesaron dispositivos.');
end;

// PROGRAMA PRINCIPAL
var
  li: lista;
begin
  li := nil;
  cargar_lista(li);  // Cargar dispositivos
  proceso_info(li);  // Procesar la información
end.


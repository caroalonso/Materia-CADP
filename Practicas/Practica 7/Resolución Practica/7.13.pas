{13. La tienda de libros Amazon Books está analizando información de algunas editoriales.
 Para elloAmazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).

De cada libro se conoce:
 su título,
 nombre de la editorial,
 cantidad de páginas,
 año de edición,
 cantidad de veces que fue vendido 
 y código del área temática (1..35).
 
Realizar un programa que:

A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) .
y devuelva en una estructura de datos adecuada para la editorial “Planeta Libros”, con la siguiente información:

- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.

B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.}

program repaso_listas;
const
  dimf = 35;
type
  rango = 1..dimf;
  str = string[40];

  vector = array [rango] of string;

  detalle = record
    titulo_data: str;
    nombre_area_tematica: str;
    cant_paginas_mas_250_ventas: integer;
  end;  

  lista = ^nodo;

  nodo = record
    elem: detalle;
    sig: lista;
  end;

  libro = record // libros que se leen.
    titulo: str;
    nombre_editorial: str;
    cant_paginas: integer;
    anio_edicion: integer;
    cant_vendido: integer;
    tematic: rango;
  end;

  editorial = record
    nombre_editorial: str;
    anio_libro_mas_antiguo: integer;
    cant_libros_editados: integer;
    total_ventas: integer;
    lista_deta: lista;
  end;

//procesos//

procedure leerLibro(var l: libro);
begin
  readln(l.titulo);
  readln(l.nombre_editorial);
  readln(l.cant_paginas);
  readln(l.anio_edicion);
  readln(l.cant_vendido);
  readln(l.tematic);
end;

procedure actualizarMinimo(anio: integer; var min: integer);
begin
  if anio < min then
    min := anio;
end;

procedure agregarAdelante(var lis: lista; l: libro; v: vector);
var
  aux: lista;
begin
  new(aux);
  aux^.elem.titulo_data := l.titulo;
  aux^.elem.nombre_area_tematica := v[l.tematic];
  aux^.elem.cant_paginas_mas_250_ventas := l.cant_paginas;
  aux^.sig := lis;
  lis := aux;
end;

procedure leerEditorial(var e: editorial; v: vector);
var
  l: libro;
  lis: lista;
  anio_minimo: integer;
  suma: integer;
  cant: integer;
begin
  lis := nil;
  anio_minimo := 9999;
  suma := 0;
  cant := 0;
  
  repeat
    leerLibro(l);
    
    if l.nombre_editorial = 'Planeta Libros' then begin
      actualizarMinimo(l.anio_edicion, anio_minimo);
      cant := cant + 1;
      suma := suma + l.cant_vendido;
      
      if l.cant_vendido > 250 then
        agregarAdelante(lis, l, v);
    end;
    
  until l.titulo = 'Relato de un náufrago';
  
  e.anio_libro_mas_antiguo := anio_minimo;
  e.nombre_editorial := l.nombre_editorial;
  e.cant_libros_editados := cant;
  e.total_ventas := suma;
  e.lista_deta := lis;
end;

procedure imprimirRegistro(r: detalle);
begin
  writeln('Título: ', r.titulo_data);
  writeln('Área temática: ', r.nombre_area_tematica);
  writeln('Cantidad de páginas: ', r.cant_paginas_mas_250_ventas);
end;

procedure imprimirLista(l: lista);
begin
  while l <> nil do begin
    imprimirRegistro(l^.elem);
    l := l^.sig;
  end;
end;

var
  v: vector;
  e: editorial;
begin
  // Aquí puedes cargar el vector con las áreas temáticas si lo deseas
  leerEditorial(e, v);
  writeln('Editorial: ', e.nombre_editorial);
  writeln('Año del libro más antiguo: ', e.anio_libro_mas_antiguo);
  writeln('Cantidad de libros editados: ', e.cant_libros_editados);
  writeln('Total de ventas: ', e.total_ventas);
  imprimirLista(e.lista_deta);
end.

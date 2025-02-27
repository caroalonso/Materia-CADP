{11.El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales.
Para ello, para cada una de las 10 fotos publicadas en su página de Facebook, cuenta con la siguiente
información:

título de la foto
autor de la foto
cantidad de Me gusta
cantidad de clics
cantidad de comentarios de usuarios.

Realizar un programa que lea y almacene esta información. Una vez finalizada la lectura,
el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Carlos”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.
}

program vectores;
const
  dimf = 10;

type
  str = string;
  rango = 1..dimf;

fotos = record
  titulo: str;
  autor: str;
  cant_megusta: integer;
  cant_clicks: integer;
  cant_comentarios: integer;
end;

vector = array[rango] of fotos;

//PROCESOS
procedure randomString(tamanio: integer; var palabra: string);
var
  str, Result: String;
begin
  str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until(Length(Result) = tamanio);
  palabra := Result;
end;

procedure leer_fotos(var f: fotos);
begin
  randomString(4, f.titulo);
  WriteLn('Ingrese nombre de autor:');
  readln(f.autor);
  f.cant_megusta := random(40) + 1;
  f.cant_clicks := random(100) + 1;
  f.cant_comentarios := random(89) + 1;
end;

procedure cargar_vector(var v: vector);
var
  i: integer;
  foto: fotos;
begin
  for i := 1 to dimf do
  begin
    leer_fotos(foto);
    v[i] := foto;
  end;
end;

procedure imprimir_vector(v: vector);
var
  i: integer;
begin
  writeln('Vector de imágenes:');
  for i := 1 to dimf do
  begin
    writeln(i, ') Título: ', v[i].titulo, ' Autor: ', v[i].autor, 
             ' Cantidad de Me gusta: ', v[i].cant_megusta, 
             ' Cantidad de clics: ', v[i].cant_clicks, 
             ' Cantidad de comentarios: ', v[i].cant_comentarios);
  end;
end;

procedure recorrer_vector(v: vector);
var
  i: integer;
  titu: str;
  max: integer;
  contador_art: integer;
begin
  contador_art := 0;
  max := -1;
  for i := 1 to dimf do
  begin
    // Contabilizar los Me gusta para el autor "Carlos"
    if (v[i].autor = 'Carlos') then
    begin
      contador_art := contador_art + v[i].cant_megusta;
    end;
    
    // Encontrar la foto más vista
    if (v[i].cant_clicks > max) then
    begin
      max := v[i].cant_clicks;
      titu := v[i].titulo;
    end;

    // Imprimir cantidad de comentarios
    writeln('Cantidad de comentarios para la foto ', i, ': ', v[i].cant_comentarios);
  end;
  
  // Mostrar resultados
  WriteLn;
  writeln('Título de la foto más vista: ', titu);
  WriteLn;
  writeln('Cantidad total de Me gusta recibidos por Carlos: ', contador_art);
end;

//PROGRAMA PRINCIPAL
var
  v: vector;
begin
  randomize;
  cargar_vector(v);
  imprimir_vector(v);
  recorrer_vector(v);
end.

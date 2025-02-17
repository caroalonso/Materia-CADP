{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de los usuarios.
Para ello, SE DISPONE de información sobre los 3600 usuarios que utilizan el portal.
De cada usuario se conoce:
su email. (asumo que representa lo mismo que el nombre de usuario).
su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector).
revista en la que participa .
y cantidad de días desde el último acceso.

a. Imprimir el mail de usuario y la cantidad de días desde el último acceso de todos los usuarios de la revista Económica.
El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden ascendente).

b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.

c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program listaas;
const
  dimf = 3600;
type
  rango = 1..dimf;
  rango2 = 1..4;
  str = string[30];

  vector_contador = array[rango2] of integer;

  usuarios = record
    mail: str;
    rol: rango2;
    revista: str;
    cant_dias: integer;
  end;

  vector = array[rango] of usuarios;

  usuario2 = record
    email: str;
    cant_ult_dia: integer;
  end;

  lista = ^nodo;

  nodo = record
    elem: usuario2;
    sig: lista;
  end;

// PROCESOS

procedure cargar_vector(var v: vector); // Ya se dispone
begin
  // Este procedimiento ya se dispone y se asume que llena el vector 'v' con datos.
end;

procedure inicializar_vector_contador(var v: vector_contador);
var
  i: integer;
begin
  for i := 1 to 4 do
    v[i] := 0;
end;

procedure imprimir_rol(v_con: vector_contador);
var
  i: integer;
begin
  writeln('Cantidad de usuarios por rol:');
  for i := 1 to 4 do
    writeln('Rol ', i, ': ', v_con[i]);
end;

procedure maximos(usu: usuarios; var max1: integer; var max2: integer; var mail1: str; var mail2: str);
begin
  if (usu.cant_dias > max1) then begin
    max2 := max1;
    max1 := usu.cant_dias;
    mail2 := mail1;
    mail1 := usu.mail;
  end
  else if (usu.cant_dias > max2) then begin
    max2 := usu.cant_dias;
    mail2 := usu.mail;
  end;
end;

procedure imprimir_lista(l: lista);
begin
  writeln('Usuarios de la revista Economica ordenados por dias sin acceso:');
  while (l <> nil) do begin
    writeln('Email: ', l^.elem.email);
    writeln('Dias sin acceso: ', l^.elem.cant_ult_dia);
    l := l^.sig;
  end;
end;

procedure agregar_ordenado(var l: lista; m: str; dias: integer);
var
  nue: lista;
  ant: lista;
  act: lista;
begin
  new(nue);
  nue^.elem.email := m;
  nue^.elem.cant_ult_dia := dias;
  nue^.sig := nil;

  if (l = nil) then begin
    l := nue;
  end
  else begin
    ant := l;
    act := l;
    while (act <> nil) and (act^.elem.cant_ult_dia < dias) do begin
      ant := act;
      act := act^.sig;
    end;

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

procedure recorrer_vector(v: vector; var l: lista; var vec_contador: vector_contador);
var
  i: integer;
  max1: integer;
  max2: integer;
  mail1: str;
  mail2: str;
begin
  max1 := -1;
  max2 := -1;
  for i := 1 to dimf do begin
    vec_contador[v[i].rol] := vec_contador[v[i].rol] + 1;
    maximos(v[i], max1, max2, mail1, mail2);
    if (v[i].revista = 'economica') then begin
      agregar_ordenado(l, v[i].mail, v[i].cant_dias);
    end;
  end;
  
  // Imprimir los dos usuarios que más tiempo no ingresaron
  writeln('Los dos usuarios que hace mas tiempo no ingresaron al portal son:');
  writeln('1. Email: ', mail1, ' | Dias sin acceso: ', max1);
  writeln('2. Email: ', mail2, ' | Dias sin acceso: ', max2);

  // Imprimir los resultados de cantidad de usuarios por rol
  imprimir_rol(vec_contador);

  // Imprimir la lista ordenada de usuarios de la revista económica
  imprimir_lista(l);
end;

// PROGRAMA PRINCIPAL
var
  v_c: vector_contador;
  ve: vector;
  l: lista;
begin
  l := nil;
  inicializar_vector_contador(v_c);
  cargar_vector(ve);
  recorrer_vector(ve, l, v_c);
end.

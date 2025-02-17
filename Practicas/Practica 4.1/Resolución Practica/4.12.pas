{12. En astrofísica, una galaxia se identifica por :
su nombre, 
su tipo ( 1)elíptica; 2)espiral; 3)lenticular; 4)irregular )
su masa (medida en kg)
la distancia en pársecs (pc) medida desde la Tierra. 

La Unión Astronómica Internacional cuenta con datos correspondientes a las 23 galaxias
que componen el Grupo Local. 
Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:

a) la cantidad de galaxias de cada tipo.

b) la masa total acumulada de las 3 galaxias principales (sagitario, acuario y leo) 
y el porcentaje que esto representa respecto a la masa de todas las galaxias. 

c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc. 

d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program vectores;
const
  dimf = 23;

type
  str = string;
  rango = 1..dimf;
  rango2 = 1..4;

  galaxias = record
    nombre: str;
    tipo: rango2;
    masa: real; // Usar 'real' para mayor precisión
    distancia: integer;
  end;

  vector1 = array[rango2] of integer;
  vector2 = array[rango] of galaxias;

//PROCESOS
procedure randomString(tamanio: integer; var palabra: string);
var
  str, Result: String;
begin
  str := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = tamanio);
  palabra := Result;
end;

procedure inicializar_vector1(var v: vector1);
var
  i: integer;
begin
  for i := 1 to 4 do
  begin
    v[i] := 0;
  end;
end;

procedure leer_galaxia(var gala: galaxias);
begin
  writeln('Ingresar nombre de galaxia:');
  readln(gala.nombre);
  gala.tipo := random(4) + 1;
  gala.masa := random(3500) + 1; // Ajustar la masa a un rango más realista
  gala.distancia := random(5900) + 1; // Ajustar la distancia a un rango más realista
end;

procedure cargar_vectores(var v1: vector1; var v2: vector2);
var
  i: integer;
  g: galaxias;
begin
  for i := 1 to dimf do
  begin
    leer_galaxia(g);
    v2[i] := g;
    v1[g.tipo] := v1[g.tipo] + 1;
  end;
end;

procedure cantidad_de_galaxia_por_tipo(v1: vector1);
var
  i: integer;
begin
  for i := 1 to 4 do
  begin
    writeln('Para la galaxia de tipo ', i, ') un total de ', v1[i]);
  end;
end;

function acumulador_masas(v2: vector2; i: integer): real;
begin
  if (v2[i].nombre = 'sagitario') or (v2[i].nombre = 'acuario') or (v2[i].nombre = 'leo') then
  begin
    acumulador_masas := v2[i].masa;
  end
  else
  begin
    acumulador_masas := 0;
  end;
end;

function punto_c(v2: vector2; i: integer): integer;
begin
  if (v2[i].tipo = 4) and (v2[i].distancia < 1000) then
  begin
    punto_c := 1;
  end
  else
  begin
    punto_c := 0;
  end;
end;

procedure max_and_min(v2: vector2; i: integer; var min1: real; var min2: real; var max1: real; var max2: real; var nom1_max: string; var nom2_max: string; var nom1_min: string; var nom2_min: string);
begin
  // Actualización para las galaxias con mayor masa
  if (v2[i].masa > max1) then
  begin
    max2 := max1;
    nom2_max := nom1_max;
    max1 := v2[i].masa;
    nom1_max := v2[i].nombre;
  end
  else if (v2[i].masa > max2) then
  begin
    max2 := v2[i].masa;
    nom2_max := v2[i].nombre;
  end;

  // Actualización para las galaxias con menor masa
  if (v2[i].masa < min1) then
  begin
    min2 := min1;
    nom2_min := nom1_min;
    min1 := v2[i].masa;
    nom1_min := v2[i].nombre;
  end
  else if (v2[i].masa < min2) then
  begin
    min2 := v2[i].masa;
    nom2_min := v2[i].nombre;
  end;
end;

procedure recorrer_vector(v1: vector1; v2: vector2);
var
  i: integer;
  masa_3_galaxias: real;
  masa_totales: real;
  cont_no_regulares: integer;
  min1, min2, max1, max2: real;
  nom1_max, nom2_max, nom1_min, nom2_min: str;
begin
  min1 := 99999999;
  min2 := 99999999;
  max1 := -1;
  max2 := -1;
  masa_3_galaxias := 0;
  masa_totales := 0;
  cont_no_regulares := 0;

  cantidad_de_galaxia_por_tipo(v1);

  for i := 1 to dimf do
  begin
    masa_totales := masa_totales + v2[i].masa; // Suma total de masas
    masa_3_galaxias := masa_3_galaxias + acumulador_masas(v2, i); // Masas de 3 galaxias
    cont_no_regulares := cont_no_regulares + punto_c(v2, i);
    max_and_min(v2, i, min1, min2, max1, max2, nom1_max, nom2_max, nom1_min, nom2_min);
  end;

  writeln('Masa total de las 3 galaxias (Sagitario, Acuario y Leo): ', masa_3_galaxias:0:2);
  writeln('Porcentaje de la masa total que representan estas 3 galaxias: ', (masa_3_galaxias / masa_totales) * 100:0:2, '%');
  writeln('Cantidad de galaxias no irregulares a menos de 1000 pc: ', cont_no_regulares);
  writeln('Las dos galaxias con mayor masa: ', nom1_max, ' y ', nom2_max);
  writeln('Las dos galaxias con menor masa: ', nom1_min, ' y ', nom2_min);
end;

//PROGRAMA PRINCIPAL
var
  v1: vector1;
  v2: vector2;
begin
  randomize;
  inicializar_vector1(v1);
  cargar_vectores(v1, v2);
  recorrer_vector(v1, v2);
end.


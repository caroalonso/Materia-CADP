{14. El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja.
Para ello, DISPONE de una tabla con información de los desarrolladores que participan en un proyecto de software,
junto al valor promedio que se paga por hora de trabajo

CÓDIGO ROL DEL DESARROLLADOR VALOR/HORA (USD)

1 Analista Funcional                 35,20
2 Programador                        27,45
3 Administrador de bases de datos    31,03
4 Arquitecto de software             44,28
5 Administrador de redes y seguridad 39,87

Nota: los valores/hora se incluyen a modo de ejemplo

*Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. 
De cada participante se conoce :

su país de residencia
código de proyecto (1 a 1000)
el nombre del proyecto en el que participó
el rol que cumplió en dicho proyecto (1 a 5)
cantidad de horas trabajadas. 

La lectura finaliza al ingresar el código de proyecto -1, que NO DEBE procesarse. 
Al finalizar la lectura, el programa debe informar:
a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.}
  
program vectores;

type
  desarolladores = record
    pais: string[50];
    cod: 1..1000;
    nombre_proyecto: string[50];
    rol: 1..5;
    cant_horas: integer;
  end;

  contadores = record
    min_monto: real;
    arqui: integer;
  end;

  vector_montos = array[1..5] of real; // Valores por hora de cada rol
  vector = array[1..1000] of contadores;

// Valores por hora para cada rol
procedure cargar_montos(var vec_montos: vector_montos);
begin
  vec_montos[1] := 35.20;  // Analista Funcional
  vec_montos[2] := 27.45;  // Programador
  vec_montos[3] := 31.03;  // Administrador de bases de datos
  vec_montos[4] := 44.28;  // Arquitecto de software
  vec_montos[5] := 39.87;  // Administrador de redes y seguridad
end;

// Inicialización de los contadores de proyectos
procedure inicializar_contadores(var vc: vector);
var
  i: integer;
begin
  for i := 1 to 1000 do begin
    vc[i].arqui := 0;
    vc[i].min_monto := 0;
  end;
end;

// Lectura de los datos de cada desarrollador
procedure leer_desarolladores(var d: desarolladores);
begin
  readln(d.cod);
  if (d.cod <> -1) then begin
    readln(d.pais);
    readln(d.nombre_proyecto);
    readln(d.rol);
    readln(d.cant_horas);
  end;
end;

// Función para calcular el monto invertido en desarrolladores residentes en Argentina
function residencia_arg(de: desarolladores; hora_sueldo: vector_montos): real;
begin
  if (de.pais = 'argentina') then
    residencia_arg := de.cant_horas * hora_sueldo[de.rol]
  else 
    residencia_arg := 0;
end;

// Función para contar los arquitectos de software
function es_arqui(de: desarolladores): integer;
begin
  if (de.rol = 4) then  // Código Arquitecto de software
    es_arqui := 1
  else 
    es_arqui := 0;
end;

// Encuentra el proyecto con el menor monto invertido
procedure minimo(v: vector);
var
  min: real;
  cod, i: integer;
begin
  min := 99999;
  cod := -1;

  for i := 1 to 1000 do begin
    if (v[i].min_monto < min) and (v[i].min_monto > 0) then begin
      min := v[i].min_monto;
      cod := i;
    end;

    writeln('La cantidad de Arquitectos de software para el proyecto ', i, ' es de: ', v[i].arqui);
  end;

  if (cod <> -1) then
    writeln('El código del proyecto con menor monto invertido: ', cod)
  else
    writeln('No se encontraron proyectos con monto invertido.');
end;

// Procesamiento de la información de los desarrolladores
procedure procesar_info(var v: vector; hora_sueldo: vector_montos);
var
  de: desarolladores;
  monto_total_argentina: real;
  cant_horas_admin: integer;
begin
  monto_total_argentina := 0;
  cant_horas_admin := 0;
  
  leer_desarolladores(de);
  while (de.cod <> -1) do begin
    monto_total_argentina := monto_total_argentina + residencia_arg(de, hora_sueldo);
    
    if (de.rol = 3) then  // Administrador de bases de datos
      cant_horas_admin := cant_horas_admin + de.cant_horas;

    v[de.cod].arqui := v[de.cod].arqui + es_arqui(de);
    v[de.cod].min_monto := v[de.cod].min_monto + (de.cant_horas * hora_sueldo[de.rol]);
    
    leer_desarolladores(de);
  end;

  minimo(v);
  writeln('El monto total invertido en desarrolladores con residencia en Argentina: ', monto_total_argentina:0:2);
  writeln('La cantidad total de horas trabajadas por Administradores de bases de datos: ', cant_horas_admin);
end;

// Programa principal
var
  v: vector;
  v_mon: vector_montos;
begin
   cargar_montos(v_mon);
   inicializar_contadores(v);
   procesar_info(v, v_mon);
end.

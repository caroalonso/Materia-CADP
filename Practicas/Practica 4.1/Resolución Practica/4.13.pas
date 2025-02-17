{13.El Grupo de Expertos sobre el Cambio Climático de la ONU  
realiza todos los años mediciones de temperatura en 30 puntos diferentes del planeta y,
para cada uno de estos lugares, obtiene un promedio anual.
Este relevamiento se viene realizando desde hace 20 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos.

Realizar un programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años 
(la información se ingresa ordenada por año).
Una vez finalizada la carga de la información, obtener:

a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program vectores;
const
  dimf = 30; // Número de puntos de medición

type
  vector = array[1..dimf] of integer; // Vector de 30 lugares en el mundo
  vector_anio = array[1..50] of vector; // Datos de 50 años

//PROCESOS    
procedure cargar_anios(var v_anio: vector_anio);
var
  i, e: integer;
begin
  for i := 1 to 50 do begin  // Carga por cada año
    for e := 1 to dimf do begin
      v_anio[i][e] := random(999) + 1; // Carga los 30 datos por cada año
    end;
  end;
end;  

procedure imprimir_galaxias(v: vector_anio);
var
  i, e: Integer;
begin
  for i := 1 to 50 do begin
    WriteLn();
    WriteLn('Año:', i);
    for e := 1 to dimf do begin
      WriteLn('Temperatura en el punto ', e, '): ', v[i][e]);
    end;
  end;
end;

procedure recorrer_anios(v: vector_anio);
var
  max_temp_mundial: integer;
  anio_max_temp_mundial: integer;
  anio_max_promedio: integer;
  i, e: integer;
  contador_temperatura: real;
  max_promedio: real;
begin
  max_temp_mundial := -1;
  max_promedio := -1;

  for i := 1 to 50 do begin
    contador_temperatura := 0;
    for e := 1 to dimf do begin
      if (v[i][e] > max_temp_mundial) then begin  
        max_temp_mundial := v[i][e]; 
        anio_max_temp_mundial := i;
      end;
      contador_temperatura := contador_temperatura + v[i][e];
    end;  

    if ((contador_temperatura / dimf) > max_promedio) then begin
      max_promedio := contador_temperatura / dimf;
      anio_max_promedio := i;
    end;           
  end;

  WriteLn();
  writeln('El año con la mayor temperatura promedio global es: ', anio_max_promedio);
  writeln('El año con la mayor temperatura detectada en algún punto del planeta es: ', anio_max_temp_mundial);
  WriteLn();
end;

//PROGRAMA PRINCIPAL
var
  v: vector_anio;
begin
  randomize;
  cargar_anios(v);
  imprimir_galaxias(v);
  recorrer_anios(v);
end.

{NOTA:* para acceder a un vector de otro vector v[i][e]}   

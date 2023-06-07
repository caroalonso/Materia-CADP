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
dimf=30;

type
  vector=array [1..dimf] of integer; //vector de 30 lugares en el mundo
  vector_anio=array[1..20] of vector;

//PROCESOS    
procedure cargar_anios(var v_anio:vector_anio);
var
i:integer;
e:integer;
begin
  for i := 1 to 20 do begin  //carga por cada anio
    for e := 1 to dimf do begin
      v_anio[i][e]:=random(999)+1; //carga los 30 datos por cada anio
    end;
  end;
end;  

procedure imprimir_galaxias(v:vector_anio);
var
i,e:Integer;
begin
  for i:= 1 to 20 do begin
    WriteLn();
    WriteLn('anio:',i);
    for e:= 1 to dimf do begin
      WriteLn('temperatura:',e,') ',v[i][e]);
    end;
  end;
end;


procedure recorrer_anios(v:vector_anio);
var
max_temp_mundial_20:real;
anio_max_tem_mundial_20:integer;
anio_max_promedio:integer;
i:integer;
e:integer;
contador_temperatura:real;
max_promedio:real;
begin
  max_temp_mundial_20:=-1;
  max_promedio:=-1;
  for i:= 1 to 20 do begin
     contador_temperatura:=0;
     for e:= 1 to dimf do begin
       if (v[i][e] > max_temp_mundial_20) then begin  
         max_temp_mundial_20:= v[i][e]; 
         anio_max_tem_mundial_20:= i;
         contador_temperatura:=contador_temperatura + v[i][e];
       end;
     end;  
     if ((contador_temperatura/dimf) > max_promedio) then begin
       max_promedio:=contador_temperatura/dimf;
       anio_max_promedio:=i;
     end;           
  end;
  WriteLn();
  writeln('el anio con mayor temperatura promedio: ',anio_max_tem_mundial_20);
  writeln('el anio con la mayor temperatura detectada en los ultimos 20 anios: ',anio_max_promedio);
  WriteLn();
end;         
  

//PROGRAMA PRINCIPAL
var
v:vector_anio;
begin
  randomize;
  cargar_anios(v);
  imprimir_galaxias(v);
  recorrer_anios(v);
end. 

{NOTA:* para acceder a un vector de otro vector v[i][e]}   

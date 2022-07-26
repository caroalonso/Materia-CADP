{
11.Realizar un módulo que calcule el rendimiento económico de una plantación de soja.
El módulo debe recibir la cantidad de hectáreas (ha) sembradas,
el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar, 3: zona árida)
y el precio en U$S de la tonelada de soja;
y devolver el rendimiento económico esperado de dicha plantación. 

Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:

zona   rendimiento por ha 
1      6 toneladas por ha
2      2,6 toneladas por ha
3      1,4 toneladas por ha

b.ARBA desea procesar información obtenida de imágenes satelitales de campos
sembrados con soja en la provincia de Buenos Aires.

De cada campo se lee:
localidad,
cantidad de hectáreas sembradas y 
el tipo de zona (1, 2 ó 3).

La lectura finaliza al leer un campo de 900 ha en la localidad ‘saladillo’, que debe procesarse.
El precio de la soja es de U$S320 por ha. 

Informar:
- La cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000.
- La localidad del campo con mayor rendimiento económico esperado.
- La localidad del campo con menor rendimiento económico esperado.
}

program punto11;
type
rango=1..3;
str=string[22];

//PROCESOS
procedure rendimiento_economico(cant_hectareas:integer; tipodezona:integer;  precio:real; var recaudacion :real);
begin
  if (tipodezona = 1) then begin 
    recaudacion:=((cant_hectareas * 6)* precio);
  end  
  else begin
    if (tipodezona = 2 ) then begin 
      recaudacion:=((cant_hectareas * 2.6)* precio);
    end  
    else begin 
      recaudacion:= ((cant_hectareas * 1.4)* precio);
    end;
  end;
end;


procedure localidad_mayor_y_menor (recaudacion :real; localidad:string ; var localidad_menor:string ; var localidad_mayor:string; var max:real ; var min :real);
begin
  if(recaudacion > max) then begin
    max:=recaudacion;
    localidad_mayor := localidad;
  end;
  if(recaudacion < min) then begin 
    min:= recaudacion;
    localidad_menor:= localidad ;
  end;
end;


//PROGRAMA PRINCIPAL
var
cant_hectareas:integer;
tipo_zona:rango;
recaudacion:real;
localidad:str;
precio:real;
contador: integer;
localidad_menor:str;
localidad_mayor:str; 
min:real;
max:real;
begin 
  min:=999999;
  max:= -1;
  contador:=0;
  recaudacion:=0;
  precio:=320;
  repeat
    writeLn('ingrese cantidad de hectareas:');
    readln ( cant_hectareas);
    writeLn('ingrese tipo de zona (1,2 o 3):');
    readln (tipo_zona);
    writeLn('ingrese localidad:');
    readln (localidad);
    rendimiento_economico(cant_hectareas,tipo_zona,precio,recaudacion);
    if ( localidad = 'Tres De Febrero') and ( recaudacion > 10.000) then begin
       contador := contador+1;
    end;
    localidad_mayor_y_menor( recaudacion , localidad, localidad_menor , localidad_mayor , max , min );
    recaudacion:=0;
  until(cant_hectareas = 900) and (localidad = 'saladillo'); 
  writeln;
  writeln('cantidad de campos de la localidad de Tres de Febrero con un rendimiento estimado superior a U$S 10.000: ' ,contador);
  writeln('La localidad del campo con mayor rendimiento economico esperado: ', localidad_mayor);
  writeln('La localidad del campo con menor rendimiento economico esperado: ', localidad_menor);
end.
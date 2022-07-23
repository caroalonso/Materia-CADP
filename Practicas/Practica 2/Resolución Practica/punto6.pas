{ 6. Realizar un programa que lea desde teclado información de autos de carrera.
Para cada uno de los autos se lee
el nombre del piloto
y el tiempo total que le tomó finalizar la carrera.
En la carrera participaron 100 autos.
Informar en pantalla:
Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.
}

program punto6;
var
  nombre: string[6];
  tiempo: real;
  i:integer;
  min1:real;
  min2:real;
  max1:real;
  max2:real;
  piloto1:string [6];
  piloto2: string [6];
  piloto3:string [6];
  piloto4: string [6];
begin
  min1:=9999;
  min2:=9999;
  max1:=-0000;
  max2:=-0000;
  for i:= 1 to 100 do begin
    writeln('ingrese tiempo: ');
    readln(tiempo);
    writeln('ingrese nombre del piloto: ');
    readln(nombre);
    if(tiempo < min1 )then begin 
       min2:=min1;
       min1:=tiempo;
       piloto2:=piloto1;
       piloto1:=nombre;
    end  
    else begin
      if(tiempo < min2)then begin
        min2:=tiempo;
        piloto2:=nombre;
      end;
    end;
    if(tiempo > max1 ) then begin 
       max2:=max1;
       max1:=tiempo;
       piloto4:=piloto3;
       piloto3:=nombre;
    end   
    else begin
      if (tiempo>max2)then begin
        max2:=tiempo;
        piloto4:=nombre;
      end;
    end;  
  end;
  writeln('pilotos con mejor tiempo:',piloto1,' y ',piloto2);
  writeln('pilotos con peor tiempo:', piloto3,' y ',piloto4);  
end.
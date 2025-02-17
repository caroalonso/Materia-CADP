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
  nombre: string;
  tiempo: real;
  i: integer;
  min1, min2: real;
  max1, max2: real;
  piloto1, piloto2, piloto3, piloto4: string;
begin
  min1 := 9999999;  { Valor alto para los mejores tiempos }
  min2 := 9999999;
  max1 := -1;       { Valor bajo para los peores tiempos }
  max2 := -1;

  for i := 1 to 100 do begin
    writeln('Ingrese tiempo: ');
    readln(tiempo);
    writeln('Ingrese nombre del piloto: ');
    readln(nombre);

    { Identificar los dos primeros puestos (mejores tiempos) }
    if (tiempo < min1) then begin
      min2 := min1;
      min1 := tiempo;
      piloto2 := piloto1;
      piloto1 := nombre;
    end
    else if (tiempo < min2) then begin
      min2 := tiempo;
      piloto2 := nombre;
    end;

    { Identificar los dos últimos puestos (peores tiempos) }
    if (tiempo > max1) then begin
      max2 := max1;
      max1 := tiempo;
      piloto4 := piloto3;
      piloto3 := nombre;
    end
    else if (tiempo > max2) then begin
      max2 := tiempo;
      piloto4 := nombre;
    end;
  end;

  { Mostrar los resultados }
  writeln('Pilotos con los mejores tiempos: ', piloto1, ' y ', piloto2);
  writeln('Pilotos con los peores tiempos: ', piloto3, ' y ', piloto4);
end.

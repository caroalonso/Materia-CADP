{ 7. Un local de ropa desea analizar las ventas realizadas en el último mes.
Para ello se lee por cada día del mes, los montos de las ventas realizadas.
La lectura de montos para cada día finaliza cuando se lee el monto 0.
Se asume un mes de 31 días.
Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo el mes.

a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.
}

program punto7a;
var
  i:integer;
  monto:real;
  ventas_dia:integer;
  contadortotal:real;
  dia:integer;
  max:integer;
begin
  max:=000;
  contadortotal:=0;
  for i:= 1 to 31 do begin
    ventas_dia:=0;
    repeat
      WriteLn('ingrese monto: ');
      readln(monto);
      ventas_dia:=ventas_dia+1;
      contadortotal:=contadortotal + monto;
    until(monto=0);
    writeln('cantida de ventas en el dia : ',ventas_dia);
    if(ventas_dia > max)then
      max:= ventas_dia;
      dia:=i;
  end;
  writeln('todas las ventas del mes: ',contadortotal);
end.
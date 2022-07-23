{ 7. Un local de ropa desea analizar las ventas realizadas en el último mes.
Para ello se lee por cada día del mes, los montos de las ventas realizadas.
La lectura de montos para cada día finaliza cuando se lee el monto 0.
Se asume un mes de 31 días.
Informar la cantidad de ventas por cada día, y el monto total acumulado en ventas de todo el mes.
}

program punto7;
var
  i:integer;
  monto:real;
  ventas_dia:integer;
  contadortotal:real;
begin
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
  end;
  writeln('todas las ventas del mes: ',contadortotal);
end.
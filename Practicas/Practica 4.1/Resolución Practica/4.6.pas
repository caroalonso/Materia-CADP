{6.Dado que en la solucion anterior se recorre dos veces el vector
(una para calcular el elemento máximo y otra para el mínimo),
implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.
}

program punto6;

procedure max_min(v:vector; diml:integer; var max:integer; var min:integer; var p1:integer; var p2:integer);
var
i:integer;
begin
    for i:= 1 to diml do begin
		if(v[i] > max)then begin
			max:=v[i];
			p1:=i;
		end;
		if(v[i]<min)then begin
			min:=v[i];
			p2:=i;
		end;
   end;		
end;


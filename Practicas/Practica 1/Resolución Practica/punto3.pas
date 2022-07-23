{ 3.Realice un programa que lea 3 números enteros y los imprima en orden descendente. Por
ejemplo, si se ingrescn los valores 4,- 10 y 12, deberá imprimir: 12 ,4, -10.
}

program punto3;
var
  num1:integer;
  num2:integer;
  num3:integer;
  mayor:integer;
  mediano:integer;
  menor:integer;
begin
  writeln('Ingrese numero 1:');
  readln(num1);
  writeln('Ingrese numero 2:');
  readln(num2);
  writeln('Ingrese numero 3:');
  readln(num3);
  if(num1>num2) and (num1>num3) then begin
    mayor:=num1;
    if(num2>num3) then begin
      mediano:=num2;
       menor:=num3;
    end
    else begin
      mediano:=num3;
      menor:=num2; 
    end;
  end  
  else begin
    if(num2>num1) and (num2>num3)then begin
       mayor:=num2;
       if( num1>num3)then begin
         mediano:=num1;
         menor:=num3;
       end
       else begin
         mediano:=num3;
         menor:=num1;
       end;
    end  
    else
      mayor:=num3;
      if(num2>num1)then begin 
        mediano:=num2;
         menor:=num1;
      end
      else begin
        mediano:=num1;
        menor:=num2;
      end; 
    end;
  writeln( mayor,'-',mediano,'-',menor);
end.
